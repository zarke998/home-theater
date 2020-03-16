<?php   

    if(!(isset($_POST["businessBtn"]) and isset($_POST["email"]) and isset($_POST["message"]))){
        http_response_code(400);
        die("Incomplete input data.");
    }
    
    $email = $_POST["email"];
    $message = $_POST["message"];

    if(!preg_match("/^[a-z]+[a-z\d]{2,}@[a-z]{2,}(\.[a-z]{2,})*$/", $email)){
        http_response_code(422);
        die("Invalid email format");
    }
    else if($message == ""){
        http_response_code(422);
        die("Invalid subject format.");
    }

    header("Conent-Type: application/json");
    echo json_encode(["message" => "Email sent successfuly."]);
?>