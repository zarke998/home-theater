<?php 
    session_start();

    $rootPath = $_SERVER["DOCUMENT_ROOT"];
    $rootPath.= "/home-theater";
    require_once "$rootPath/logic/dbConnection.php";

    if(!isset($_POST["surveyBtn"]) or !isset($_SESSION["user"])){
        http_response_code(400);
        die("Incomplete input data.");
    }

    $postData = $_POST;
    $user = $_SESSION["user"];
    unset($postData["surveyBtn"]);
    

    $query = "INSERT INTO user_survey_answers(survey_question_answer_id,user_id)
                            VALUES(:answerId,:userId);";                            
    $conn->beginTransaction();

    $stm = $conn->prepare($query);
    $stm->bindParam(":userId",$user->id);

    foreach($postData as $answerId){    
        $stm->bindParam(":answerId",$answerId);    
        $stm->execute();
    }

    $conn->commit();

    $_SESSION["surveyMsg"] = "Thank you for your time !";

    header("Location: ../index.php");
?>