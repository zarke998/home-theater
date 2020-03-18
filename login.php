<?php

    session_start();
    if(isset($_SESSION["user"])){
        header("Location: index.php");
        exit;
    }

    $pageTitle = "HomeTheater - Login";
    require_once "views/head.php";

    $isIntroSmaller = true;
    $introId = "loginIntro";
    require_once "views/header.php";

    require_once "views/login_content.php";

    $scripts = ["main.js","login.js"];
    require_once "views/footer.php";
?>