<?php 
    session_start();

    $rootPath = $_SERVER["DOCUMENT_ROOT"];
    $rootPath.= "/home-theater";
    require_once "$rootPath/logic/dbConnection.php";

    if(!isset($_SESSION["user"]) and isset($_GET["offset"])){
        http_response_code(403);
        header("Location: ../403.php");
        exit;
    }

    try{
        $userId = $_SESSION["user"]->id;
        $offset = intval($_GET["offset"]);



        $bookmarkQuery = "SELECT content.id AS con_id, title, file_path FROM content
                            INNER JOIN content_images ON content.id = content_images.content_id
                            INNER JOIN user_bookmarks AS bookmarks ON bookmarks.content_id = content.id
                            WHERE content_images.isCover = 1 AND bookmarks.user_id = :user
                            LIMIT 8 OFFSET :offset";
        $stm = $conn->prepare($bookmarkQuery);
        $stm->bindParam(":user",$userId);
        $stm->bindParam(":offset",$offset, PDO::PARAM_INT);

        $stm->execute();

        $result = $stm->fetchAll();
        // http_response_code(500);
        // die("$offset");

        header("Content-Type: application/json");
        echo json_encode($result);
    }
    catch(PDOException $e){
        http_response_code(500);
        die("Error fetching bookmarks.");
    }

?>