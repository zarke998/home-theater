<?php 
    $rootPath = $_SERVER["DOCUMENT_ROOT"];
    $rootPath.= "/home-theater";
    require_once "$rootPath/logic/dbConnection.php";

    if(!isset($_POST["id"])){
        http_response_code(400);
        die("Incomplete input data");
    }

    $id = $_POST["id"];

    $deleteStm = $conn->prepare("DELETE FROM content WHERE id=:id");
    $deleteStm->bindParam(":id",$id);

    $deleteStm->execute();

    $message = "Content deleted successfuly.";
    header("Content-Type: application/json");
    echo json_encode(["message" => $message]);
?>