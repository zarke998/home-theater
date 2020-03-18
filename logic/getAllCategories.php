<?php 

    
    require_once "dbConnection.php";

    $categories = [];

    $stm = $conn->query("SELECT * FROM categories");

    foreach($stm->fetchAll() as $c)
        $categories[] = $c;

    if(isset($_POST["ajax"])){
        header("Content-Type: application/json");
        echo json_encode($categories);
    }
?>