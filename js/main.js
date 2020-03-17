var panelIsShowed = false;

$(document).ready(function(){
    $("#accountBtn").click(togglePanel);
    $("#logoutBtn").click(logout);

    $(".surveyPanel").hide();
    $(".surveyBtn i").click(showSurvey);

    $(".sendSurveyAnswersBtn").click(validateSurvey);
});

function togglePanel(){
    panelIsShowed ? $(".accountPanel").hide() : $(".accountPanel").show();
    
    panelIsShowed = !panelIsShowed;
}
function logout(){
    
}

function showSurvey(){
    $(".surveyPanel").toggle();
}

function validateSurvey(){
    let $form = $(this).closest("form");
    var error = false;

    let $questions = $form.find(".surveyQuestion");

    $questions.each(function(index){
        let $checkedAnswers = $(this).find("input[type=radio]:checked");

        if($checkedAnswers.length == 0){
            error = true;
        }
    });
    if(error){
        alert("Please check at least one answer in a question.");
        return false;
    }
}