<?php
    session_start();

    if(!isset($_SESSION["user"])){
        header("Location: ../403.php");
        exit;
    }

    $pageTitle = "HomeTheater - Bookmarks";
    require_once "../views/head.php";

    $isIntroSmaller = true;
    $introId = "bookmarksIntro";
    require_once "../views/header.php";

    require_once "../views/bookmarks_content.php";

    $scripts = ["main.js","bookmarks.js"];
    require_once "../views/footer.php";
?>