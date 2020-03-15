<?php 
    session_start();

    if(isset($_SESSION["user"])){
        header("Location: index.php");
        exit;
    }

    $pageTitle = "HomeTheater - Login";
    require_once "views/head.php";

    $isIntroSmaller = true;
    require_once "views/header.php";

    require_once "views/register_content.php";

    $scripts = ["main.js","register.js"];
    require_once "views/footer.php";
?>