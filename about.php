<?php 
    session_start();

    $pageTitle = "HomeTheater - About";
    require_once "views/head.php";

    $isIntroSmaller = true;
    require_once "views/header.php";

    require_once "views/about_content.php";

    $scripts = ["main.js","about.js"];
    require_once "views/footer.php";
?>