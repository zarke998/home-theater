<?php 
    $rootPath = $_SERVER["DOCUMENT_ROOT"];
    $rootPath.= "/home-theater";
    require_once "$rootPath/logic/dbConnection.php";

    if(!isset($_POST["id"])){
        http_response_code(400);
        die("Incomplete input data");
    }
    
    $id = $_POST["id"];

    $contentInfoQuery = "SELECT content.id AS content_id, title,description, year_released, rating, runtime, metascore, 
                                content_types_id, con_res.resolution_id AS res_id, con_img.id AS img_id, file_name, file_path, isCover,isThumbnail, con_cat.category_id AS cat_id 
                                FROM content 
                                INNER JOIN content_categories as con_cat ON content.id = con_cat.content_id 
                                INNER JOIN content_resolutions AS con_res ON con_res.content_id = content.id 
                                INNER JOIN content_images AS con_img ON con_img.content_id = content.id
                                WHERE content.id=:id;";
    $contentStm = $conn->prepare($contentInfoQuery);
    $contentStm->bindParam(":id",$id);
    $contentStm->execute();

    $data = $contentStm->fetchAll();
    
    $contentInfo = ["id" => $data[0]->content_id, 
                    "title" => $data[0]->title,
                    "description" => $data[0]->description,
                    "yearReleased" => $data[0]->year_released,
                    "runtime" => $data[0]->runtime,
                    "rating" => $data[0]->rating,
                    "metascore" => $data[0]->metascore,
                    "contentType" => $data[0]->content_types_id];
    $resolutions = [];
    $categories = [];
    $images = ["id" => [], "file_name" => [], "file_path" => [], "isCover" => [], "isThumbnail" => []];

    foreach($data as $c){
        if(!in_array($c->res_id, $resolutions))
            $resolutions[] = $c->res_id;
        if(!in_array($c->img_id, $images["id"])){
            array_push($images["id"], $c->img_id);
            array_push($images["file_name"], $c->file_name);
            array_push($images["file_path"], $c->file_path);
            array_push($images["isCover"], $c->isCover);
            array_push($images["isThumbnail"], $c->isThumbnail);
        }
        if(!in_array($c->cat_id, $categories))
            $categories[] = $c->cat_id;
    }

    header("Content-Type: application/json");
    echo json_encode(["info" => $contentInfo, "resolutions" => $resolutions, "categories" => $categories, "images" => $images]);
?>