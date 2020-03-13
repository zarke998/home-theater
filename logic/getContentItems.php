<?php
    $root = $_SERVER["DOCUMENT_ROOT"];
    $root .= "/home-theater";
    require_once "$root/logic/dbConnection.php";

    if(!(isset($_GET["offset"]) and isset($_GET["contentType"]))){
        http_response_code(400);
        die("Incomplete input data");
    }
    $offset = $_GET["offset"];
    $contentType = $_GET["contentType"];

    $offset = intval($offset);

    $getContentQuery = "SELECT content.id, title, year_released, runtime,metascore, file_path FROM content
    INNER JOIN content_images AS images ON content.id = images.content_id
    WHERE images.isCover = 1 AND content.content_types_id = :c_type
    LIMIT 8 OFFSET :offset;";

    $contentStm = $conn->prepare($getContentQuery);
    $contentStm->bindParam(":offset",$offset,PDO::PARAM_INT);
    $contentStm->bindParam(":c_type",$contentType);
    $contentStm->execute();

    $contentList = $contentStm->fetchAll();

    header("Content-Type: application/json");
    echo json_encode($contentList);
?>