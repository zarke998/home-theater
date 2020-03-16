<?php

    session_start();

    if(!isset($_SESSION["user"]))
        die("User not logged in");

    $rootPath = $_SERVER["DOCUMENT_ROOT"];
    $rootPath.= "/home-theater";
    require "$rootPath/logic/dbConnection.php";


    if(!(isset($_POST["content_id"]) and isset($_POST["set_state"]))){
        http_response_code(400);
        die("Incomplete input data.");
    }

    define("BOOKMARK_SET_STATE_ADD", 0);
    define("BOOKMARK_SET_STATE_DELETE", 1);

    $userId = $_SESSION["user"]->id;
    $contentId = $_POST["content_id"];
    $setState = $_POST["set_state"];

    // die("User id: $userId, Content id: $contentId");

    try{
        if($setState == BOOKMARK_SET_STATE_ADD){
            $bookmarkSetQuery = "INSERT INTO user_bookmarks(user_id, content_id)
                                        VALUES(:userId, :contentId);";
            $bookmarkStm = $conn->prepare($bookmarkSetQuery);
            $bookmarkStm->bindParam(":userId",$userId);
            $bookmarkStm->bindParam(":contentId",$contentId);
        }
        else if($setState == BOOKMARK_SET_STATE_DELETE){
            $bookmarkSetQuery = "DELETE FROM user_bookmarks
                                WHERE user_id=:userId";
            $bookmarkStm = $conn->prepare($bookmarkSetQuery);
            $bookmarkStm->bindParam(":userId",$userId);
        }


        $bookmarkStm->execute();

        header("Content-Type: application/json");
        echo json_encode(["message" => "Bookmark set successfuly."]);
    }
    catch(PDOException $e){
        http_response_code(500);
        $message= $e->getMessage();
        die("$message");
    }

    
?>