<?php 
    require_once "logic/dbconnection.php";


    $password = password_hash("Admin12345", PASSWORD_DEFAULT);
    echo $conn->query("INSERT INTO users(email,password,active,activation_key,role_id) VALUES ('admin@gmail.com','$password',1,NULL,1)")->rowCount();
?>