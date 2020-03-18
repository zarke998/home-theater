<?php 


    $rootPath = $_SERVER["DOCUMENT_ROOT"];
    require_once "$rootPath/logic/dbConnection.php";

    if(!(isset($_POST["id"]) 
    and isset($_POST["title"]) 
    and isset($_POST["releaseYear"]) 
    and isset($_POST["rating"]) 
    and isset($_POST["metascore"])
     and isset($_POST["runtime"]))){
        http_response_code(400);
        die("Incomplete input data.");
    }

    $id = $_POST["id"];
    $title = $_POST["title"];
    $releaseYear = $_POST["releaseYear"];
    $runtime = $_POST["runtime"];
    $rating = $_POST["rating"];
    $metascore = $_POST["metascore"];
    $description = $_POST["description"];

    if($description == "")
        $description = null;

    $updateQuery = "UPDATE content
                    SET title=:title,description=:description, year_released=:releaseYear, runtime=:runtime, rating=:rating, metascore=:metascore
                    WHERE id=:id;";
    $updateStm = $conn->prepare($updateQuery);
    $updateStm->bindParam(":id", $id);
    $updateStm->bindParam(":title", $title);
    $updateStm->bindParam(":releaseYear", $releaseYear);
    $updateStm->bindParam(":rating", $rating);
    $updateStm->bindParam(":runtime", $runtime);
    $updateStm->bindParam(":metascore", $metascore);
    $updateStm->bindParam(":description", $description);

    $updateStm->execute();

    header("Content-Type: application/json");
    echo json_encode(["message" => "Content updated successfuly."]);

?>