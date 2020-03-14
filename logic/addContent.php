<?php 
    session_start();

    $referer = getenv("HTTP_REFERER");
    if(substr($referer,0,61) != "http://localhost/home-theater/auth/manage_content_library.php"){
        header("Location: ../403.php");
        exit;
    }

    require_once "dbConnection.php";

    if(isset($_POST["addBtn"])){
        $title = $_POST["title"];        
        $year = $_POST["releaseYear"];
        $runtime = $_POST["runtime"];
        $rating = $_POST["rating"];
        $metascore = $_POST["metascore"];
        $contentType = $_POST["content_type"];
        $description = $_POST["description"];

        if($description == "")
            $description = null;

        $categories = $_POST["categories"];
        $resolutions = $_POST["resolutions"];

        $cover = $_FILES["coverImage"];
        $thumbnail = $_FILES["thumbnail"];
        try{

        $conn->beginTransaction();

        // ADD CONTENT
        $contentQuery = "INSERT INTO content(id,title,description,year_released,runtime,rating,metascore,content_types_id)
                                    VALUES(NULL,:title,:description,:year,:runtime,:rating,:metascore,:contentType);";
        $stmContent = $conn->prepare($contentQuery);
        $stmContent->bindParam(":title",$title);
        $stmContent->bindParam(":year",$year);
        $stmContent->bindParam(":runtime",$runtime);
        $stmContent->bindParam(":rating",$rating);
        $stmContent->bindParam(":metascore",$metascore);
        $stmContent->bindParam(":contentType",$contentType);
        $stmContent->bindParam(":description",$description);

        $stmContent->execute();

        // ADD CONTENT RESOLUTIONS
        $contentId = $conn->lastInsertId();
        $resolutionId = 0;
        $contentResQuery = "INSERT INTO content_resolutions(content_id,resolution_id)
                                    VALUES(:contentId,:resolutionId)";
        $stmContentRes = $conn->prepare($contentResQuery);
        $stmContentRes->bindParam(":contentId",$contentId);
        $stmContentRes->bindParam(":resolutionId",$resolutionId);

        foreach($resolutions as $r){
            $resolutionId = $r;
            $stmContentRes->execute();
        }

        // ADD CONTENT CATEGORIES
        $categoryId = 0;
        $contentCatQuery = "INSERT INTO content_categories(content_id,category_id)
                                    VALUE(:contentId,:categoryId)";
        $stmContentCat = $conn->prepare($contentCatQuery);
        $stmContentCat->bindParam(":contentId",$contentId);                                    
        $stmContentCat->bindParam(":categoryId",$categoryId);

        foreach($categories as $c){
            $categoryId = $c;
            $stmContentCat->execute();
        }
    

        // ADD CONTENT COVER IMAGE
        $coverName = $cover["name"];
        $coverTmp = $cover["tmp_name"];
        $coverErr = $cover["error"];
        if($coverErr){
            $_SESSION["addContentError"] = "Error uploading image.";
            header("Location: ../auth/manage_content_library.php");
        }

        $coverQuery = "INSERT INTO content_images(file_name,isCover,isThumbnail,content_id)
                                    VALUES(:fileName,1,0,:contentId)";                                    
        $coverStm = $conn->prepare($coverQuery);
        $coverStm->bindParam(":fileName",$coverName);
        $coverStm->bindParam(":contentId",$contentId);
        $coverStm->execute();

        $coverId = $conn->lastInsertId();

        $coverNewName = $coverId . extractImageExtension($coverName);
        $coverPath = "../images/cover/$coverNewName";

        move_uploaded_file($coverTmp,$coverPath);

        $coverUpdateStm = $conn->prepare("UPDATE content_images
                                            SET file_path=:filePath
                                            WHERE id=:coverId");
        $coverUpdateStm->bindParam(":filePath", $coverPath);                                            
        $coverUpdateStm->bindParam(":coverId", $coverId);
        $coverUpdateStm->execute();

        // ADD CONTENT THUMBNAIL
        $thumbName = $thumbnail["name"];
        $thumbTmp = $thumbnail["tmp_name"];
        $thumbErr = $thumbnail["error"];
        if($thumbErr){
            $_SESSION["addContentError"] = "Error uploading image.";
            header("Location: ../auth/manage_content_library.php");
        }

        

        $thumbImgQuery = "INSERT INTO content_images(file_name,isCover,isThumbnail,content_id)
                                        VALUES(:thumbName,0,1,:contentId);";
        $thumbImgStm = $conn->prepare($thumbImgQuery);
        $thumbImgStm->bindParam(":thumbName",$thumbName);
        $thumbImgStm->bindParam(":contentId",$contentId);
        $thumbImgStm->execute();

        $thumbId = $conn->lastInsertId();

        $thumbNewName = $thumbId . extractImageExtension($thumbName);
        $thumbPath = "../images/thumb/$thumbNewName";
        move_uploaded_file($thumbTmp, $thumbPath);

        $thumbUpdateStm = $conn->prepare("UPDATE content_images
                                            SET file_path=:filePath
                                            WHERE id=:thumbId");
        $thumbUpdateStm->bindParam(":filePath", $thumbPath);                                            
        $thumbUpdateStm->bindParam(":thumbId", $thumbId);
        $thumbUpdateStm->execute();

        // ADD CONTENT WALLPAPERS
        $wName = "";
        $wallpapersQuery = "INSERT INTO content_images(file_name,isCover,isThumbnail,content_id)
                                                VALUES(:wName,0,0,:contentId);";
        $wallpapersStm = $conn->prepare($wallpapersQuery);
        $wallpapersStm->bindParam(":wName",$wName);
        $wallpapersStm->bindParam(":contentId",$contentId);

        // ADD WALLPAPERS
        if(isset($_FILES["wallpapers"])){
            $wallpapers = $_FILES["wallpapers"];
            var_dump($wallpapers);
            for($i = 0; $i < count($wallpapers["name"]);$i++){
                $wName = $wallpapers["name"][$i];
                if($wName == "")
                    break;

                $wTmp = $wallpapers["tmp_name"][$i];
                $wError = $wallpapers["error"][$i];
                if($wError){
                    $_SESSION["addContentError"] = "Error uploading image.";
                    header("Location: ../auth/manage_content_library.php");
                }

                $wallpapersStm->execute();
                $wId = $conn->lastInsertId();
                
                $wNewName = $wId . extractImageExtension($wName);
                $wPath = "../images/wallpapers/$wNewName";
                
                move_uploaded_file($wTmp,$wPath);

                $wUpdateStm = $conn->prepare("UPDATE content_images
                                                SET file_path=:wPath
                                                WHERE id=:wId");
                $wUpdateStm->bindParam(":wPath",$wPath);
                $wUpdateStm->bindParam(":wId",$wId);
                $wUpdateStm->execute();

                
                
            }
        }
        

        $conn->commit();
        $_SESSION["addContentSuccess"] = "Content added successfuly.";
        header("Location: ../auth/manage_content_library.php");
        }
        catch(PDOException $e){
            $_SESSION["addContentError"] = "Unable to add content.";
            header("Location: ../auth/manage_content_library.php");
        }
    }

    function extractImageExtension($name){
        return substr($name,strrpos($name,"."));
    }
?>