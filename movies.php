<?php 
    session_start();

    $pageTitle = "HomeTheater - Movies";
    require_once "views/head.php";

    $isIntroSmaller = true;
    require_once "views/header.php";

    require_once "views/movies_content.php";

    $scripts = ["main.js","content-list.js"];
    require_once "views/footer.php";
?>