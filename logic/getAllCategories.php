<?php 
    require_once "dbConnection.php";

    $categories = [];

    $stm = $conn->query("SELECT * FROM categories");

    foreach($stm->fetchAll() as $c)
        $categories[] = $c;
?>