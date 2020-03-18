<?php 

    
    $rootPath = $_SERVER["DOCUMENT_ROOT"];
    require_once "$rootPath/logic/dbConnection.php";

    if(!isset($_POST["id"])){
        http_response_code(400);
        die("Incomplete input data");
    }

    $id = $_POST["id"];

    
    $conn->beginTransaction();

    $imagesQuery = "SELECT * FROM content_images WHERE content_id=:id";
    $imagesStm = $conn->prepare($imagesQuery);
    $imagesStm->bindParam(":id",$id);
    $imagesStm->execute();

    $images = $imagesStm->fetchAll();


    $deleteStm = $conn->prepare("DELETE FROM content WHERE id=:id");
    $deleteStm->bindParam(":id",$id);
    $deleteStm->execute();

    $transSuccess = $conn->commit();

    if($transSuccess)
        foreach($images as $img)
            unlink($img->file_path);

    $message = "Content deleted successfuly.";
    header("Content-Type: application/json");
    echo json_encode(["message" => $message]);
?>