<?php 
    if(session_status() == PHP_SESSION_NONE)
        session_start() 
?>

    <div id="footer" class="container-fluid px-4 px-md-5 pt-4">
        <?php

        $rootPath = $_SERVER["DOCUMENT_ROOT"];
        require_once "$rootPath/logic/dbConnection.php";

        require_once "$rootPath/logic/SurveyLib.php";

        if(isset($_SESSION["user"])){
            $user = $_SESSION["user"];
            $surveys = getSurveys($user->id);
        }
        else
            $user = null;



        if(session_status() == PHP_SESSION_ACTIVE and isset($_SESSION["user"]) and !(isset($isSurveyHidden) and $isSurveyHidden) and count($surveys) > 0) :?>
        <div class="surveyPanel accordion" id="accordionExample">
            <?php 
                foreach($surveys as $s): ?>
                <div class="card">
                    <div class="card-header p-1" id="heading<?=$s->info->id?>">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse<?=$s->info->id?>" aria-expanded="false" aria-controls="collapse<?=$s->info->id?>">
                            <?=$s->info->name?>
                            </button>
                        </h5>
                    </div>
                    <div id="collapse<?=$s->info->id?>" class="collapse" aria-labelledby="heading<?=$s->info->id?>" data-parent="#accordionExample">
                        <form action="/logic/survey_processor.php" method="POST" onsubmit="return validateSurvey()">    
                            <div class="card-body">
                                <?php 
                                    $questionIndex = 1;
                                    foreach($s->questions as $q): ?>
                                    <div class="surveyQuestion mb-4">
                                    <p>
                                        <?php 
                                            $questionName = $q->info->name;
                                            echo "$questionIndex. $questionName";
                                            $questionIndex++;
                                        ?> 
                                    </p>
                                    <?php foreach($q->answers as $a): ?>
                                    <?php $answerId = $a->id;
                                          $answerName = $a->name; ?>
                                     <div class="custom-control custom-radio">
                                        <input type="radio" id="customRadio<?=$answerId?>" name="customRadio<?=$q->info->id?>" value="<?=$a->id?>" class="custom-control-input">
                                        <label class="custom-control-label" for="customRadio<?=$answerId?>"><?=$answerName?></label>
                                    </div>
                                    <?php endforeach; ?>
                                </div>
                                    <?php endforeach;
                                        echo "<input id='loginBtn' type='submit' name='surveyBtn' value='Send' class='d-block mx-auto w-25 mt-4 ht-btn sendSurveyAnswersBtn' />";
                                    ?>
                            </div>
                        </form>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>    
        <div class="surveyBtn">
            <i class="material-icons">assignment</i>
        </div>
        <?php endif;?>

        <div class="row">
            <div class="col-12 col-md-7 col-lg-9">
                <div class="row footerList text-center text-md-left">
                    <div class="col-6 col-lg-3">
                        <h3>General</h3>
                        <ul>
                        <?php 
                            $rootPath = $_SERVER["DOCUMENT_ROOT"];
                            require_once "$rootPath/logic/menuFetcher.php";

                            $items = getMenuItems("nav_menu");
                            
                            for($i = 0; $i < count($items); $i++): ?>
                            <li>
                                <a href="<?=$items[$i]->href?>"><?=$items[$i]->item_name?></a>
                            </li>
                            <?php endfor;
                        ?>
                        </ul>
                    </div>
                    <div class="col-6 col-lg-3">
                        <h3>Socials</h3>
                        <ul>
                        <?php 
                            $rootPath = $_SERVER["DOCUMENT_ROOT"];
                            require_once "$rootPath/logic/menuFetcher.php";

                            $items = getMenuItems("socials_menu");
                            
                            for($i = 0; $i < count($items); $i++): ?>
                            <li>
                                <a href="<?=$items[$i]->href?>"><?=$items[$i]->item_name?></a>
                            </li>
                            <?php endfor;
                        ?>
                        </ul>
                    </div>
                    <div class="col-6 col-lg-3">
                        <h3>Legal</h3>
                        <ul>
                        <?php 
                            $rootPath = $_SERVER["DOCUMENT_ROOT"];
                            require_once "$rootPath/logic/menuFetcher.php";

                            $items = getMenuItems("legal_menu");
                            
                            for($i = 0; $i < count($items); $i++): ?>
                            <li>
                                <a href="<?=$items[$i]->href?>"><?=$items[$i]->item_name?></a>
                            </li>
                            <?php endfor;
                        ?>
                        </ul>
                    </div><div class="col-6 col-lg-3">
                        <h3>Account</h3>
                        <ul>
                        <?php 
                            $rootPath = $_SERVER["DOCUMENT_ROOT"];
                            require_once "$rootPath/logic/menuFetcher.php";

                            $items = getMenuItems("account_footer_menu");
                            
                            for($i = 0; $i < count($items); $i++): ?>
                            <li>
                                <a href="<?=$items[$i]->href?>"><?=$items[$i]->item_name?></a>
                            </li>
                            <?php endfor;
                        ?>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-5 col-lg-3 px-2 px-sm-5 px-md-1 newsletterContainer mb-2">
                <h3 class="text-center">Subscribe to our newsletter</h3>
                <form class="mt-4 pt-2">
                    <div class="input-group input-group-sm border-0 newsletterForm">
                        <input type="email" class="form-control border-0 rounded-0" id="loginEmail" aria-describedby="emailHelp" placeholder="Enter email">
                        <div class="input-group-append">
                            <i class="input-group-text material-icons sendIcon">send</i>
                         </div>
                        <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                    </div>
                </form>
            </div>
        </div>
        <p id="copyright" class="text-center mb-2">Copyright &copy; | HomeTheater <?php echo date("Y")?>. All rights reserved.</p>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/js/jquery.nicescroll.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <?php 
        if(isset($scripts))
        {
            foreach($scripts as $s): ?>
                <script src="/js/<?=$s?>"></script>
            <?php endforeach;
        }
        if(isset($alertMsg)): ?>
            <script type="text/javascript">
                window.onload = function(){
                    alert("<?=$alertMsg?>"); 
                }
            </script>
        <?php endif;
    ?>
</body>
</html>

<?php 
    function getSurveys($userId){
        global $conn;

        $surveys = [];

        $surveysQuery = "SELECT * FROM surveys 
        WHERE isActive = 1 AND id NOT IN(SELECT s.id FROM surveys AS s
                                         INNER JOIN survey_questions AS s_q ON s_q.survey_id = s.id
                                         INNER JOIN survey_question_answers AS s_q_a ON s_q_a.survey_question_id = s_q.survey_id
                                         INNER JOIN user_survey_answers AS u_s_a ON u_s_a.survey_question_answer_id = s_q_a.id
                                         WHERE u_s_a.user_id = :user)";
        $surveyStm = $conn->prepare($surveysQuery);
        $surveyStm->bindParam(":user",$userId);
        $surveyStm->execute();

        while($s = $surveyStm->fetch()){
            $survey = new Survey();
            $survey->info = $s;

            $questionsQuery = "SELECT * FROM survey_questions WHERE survey_id=:id";
            $questionsStm = $conn->prepare($questionsQuery);
            $questionsStm->bindParam(":id", $s->id);

            $questionsStm->execute();
            
            while($q = $questionsStm->fetch()){
                $surveyQuestion = new SurveyQuestion();
                $surveyQuestion->info = $q;

                $answersQuery = "SELECT * FROM survey_question_answers WHERE survey_question_id=:id";
                $answersStm = $conn->prepare($answersQuery);
                $answersStm->bindParam(":id",$q->id);

                $answersStm->execute();

                while($a = $answersStm->fetch()){
                    $surveyQuestion->answers[] = $a;
                }

                $survey->questions[] = $surveyQuestion;
            }

            $surveys[] = $survey;
        }

        return $surveys;
    }
?>

















