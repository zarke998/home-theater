<?php 
    session_start();

    $pageTitle = "HomeTheater - Home";
    require_once "views/head.php";

    $headerText = "Cheap. High quality. New.";
    $isIntroSmaller = false;
    require_once "views/header.php";

    require_once "views/index_content.php";

    $scripts = ["main.js","index.js"];
    require_once "views/footer.php";
?>