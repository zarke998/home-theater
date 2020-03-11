<?php
    $host = "localhost";
    $dbName = "hometheater";
    $dbUser = "root";
    $dbPassword = "";

    try{
        $conn = new PDO("mysql:host=$host;dbname=$dbName",$dbUser,$dbPassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_OBJ);

    }
    catch(PDOException $e){
        http_response_code(500);
        die("Could not connect to the database.");
    }
?>