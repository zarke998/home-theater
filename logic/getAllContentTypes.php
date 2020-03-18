<?php 

    
    require_once "dbConnection.php";

    $content_types = [];

    $stm = $conn->query("SELECT * FROM content_types");

    foreach($stm->fetchAll() as $c_types)
        $content_types[] = $c_types;
?>