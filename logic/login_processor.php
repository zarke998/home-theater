<?php 
    if(!session_id())
        session_start();

    $email = $_POST["email"];
    $password = $_POST["password"];

    if(!preg_match("/^[a-z]+[a-z\d]{2,}(\.[a-z\d]+)*@[a-z]{2,}(\.[a-z]{2,})+$/", $email)){
        http_response_code(422);
        die("Invalid email format");
    }
    else if(!preg_match("/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$/", $password)){
        http_response_code(422);
        die("Invalid password format.");
    }

    $email = addslashes($email);

    require_once "dbConnection.php";

    $stm = $conn->prepare("SELECT * FROM users WHERE email=:email");
    $stm->bindParam(":email",$email);

    $stm->execute();
    if($stm->rowCount() == 0){
        http_response_code(500);
        die("There is no account associated with this email.");
    }
    else{
        $user = $stm->fetch();
        if(!password_verify($password,$user->password)){
            http_response_code(500);
            die("Password is incorrect.");
        }
    }

    $_SESSION["user"] = $user;

    header("Conent-Type: application/json");
    echo json_encode(["redirect" => "index.php"]);
?>