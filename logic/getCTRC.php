<?php 

    

    require_once "getAllCategories.php";
    require_once "getAllContentTypes.php";
    require_once "getAllResolutions.php";

    header("Content-Type: application/json");
    echo json_encode(["categories" => $categories,"c_types" => $content_types,"resolutions" => $resolutions])
?>
