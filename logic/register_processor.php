<?php 
    session_start();



    if(!(isset($_POST["registerBtn"]) and isset($_POST["email"]) and isset($_POST["password"]) and isset($_POST["subscription"]))){
        http_response_code(400);
        die("Incomplete input data.");
    }
    
    $email = $_POST["email"];
    $password = $_POST["password"];
    $subscription = $_POST["subscription"];

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
    if($stm->rowCount() > 0){
        http_response_code(500);
        die("You have already registered.");
    }


    $key = getRandomString(128);
    $password = password_hash($password,PASSWORD_DEFAULT);
    $addUserQuery = "INSERT INTO users(email,password,role_id,subscription_types_id)
                               VALUES(:email,:password,2,:subscriptionTypesId);";
    $addStm = $conn->prepare($addUserQuery);
    $addStm->bindParam(":email",$email);
    $addStm->bindParam(":password",$password);
    // $addStm->bindParam(":activationKey",$key);
    $addStm->bindParam(":subscriptionTypesId",$subscription);

    $addStm->execute();
    $userId = $conn->lastInsertId();


    $getUserStm = $conn->prepare("SELECT * FROM users WHERE id=:id");
    $getUserStm->bindParam(":id",$userId);
    
    $getUserStm->execute();
    
    $user = $getUserStm->fetch();
    // $headers = 'From: ' .$email . "\r\n". 
    // 'X-Mailer: PHP/' . phpversion();

    // $mailMessage = "Activation link for your account on HomeTheater:\n";
    // $mailMessage.= "http://localhost/home-theater/logic/activate?id=$userId&key=$key";
    // $mailMessage = wordwrap($mailMessage,69);

    // mail($email,"HomeTheater - Account activation",$mailMessage,$headers);

    $_SESSION["user"] = $user;
    
    header("Conent-Type: application/json");
    echo json_encode(["redirect" => "login.php"]);

    function getRandomString($n) { 
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'; 
        $randomString = ''; 
      
        for ($i = 0; $i < $n; $i++) { 
            $index = rand(0, strlen($characters) - 1); 
            $randomString .= $characters[$index]; 
        } 
      
        return $randomString; 
    }
?>
