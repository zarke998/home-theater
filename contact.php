<?php 
    session_start();

    $pageTitle = "HomeTheater - Contact";
    require_once "views/head.php";

    $isIntroSmaller = true;
    require_once "views/header.php";

    require_once "views/contact_content.php";

    $scripts = ["main.js","contact.js"];
    require_once "views/footer.php";
?>