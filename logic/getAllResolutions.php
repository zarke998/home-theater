<?php 

    
    require_once "dbConnection.php";

    $resolutions = [];

    $stm = $conn->query("SELECT * FROM resolutions");

    foreach($stm->fetchAll() as $r)
        $resolutions[] = $r;
?>