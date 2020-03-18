<?php
    session_start();

    if(!isset($_SESSION["user"]) or $_SESSION["user"]->role_id != 1){
        header("Location: ../403.php");
        exit;
    }
    
    $pageTitle = "HomeTheater - Manage content library";
    require_once "../views/head.php";

    $isIntroSmaller = true;
    $introId = "manageContentIntro";
    require_once "../views/header.php";

    require_once "../views/manage_content_library_content.php";

    $scripts = ["main.js","manage-content-library.js"];
    if(isset($_SESSION["addContentError"])){
        $alertMsg = $_SESSION["addContentError"];
        unset($_SESSION["addContentError"]);
    }
    else if(isset($_SESSION["addContentSuccess"])){
        $alertMsg = $_SESSION["addContentSuccess"];
        unset($_SESSION["addContentSuccess"]);
    }
    $isSurveyHidden = true;
    require_once "../views/footer.php";
?>