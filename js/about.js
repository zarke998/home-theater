$(document).ready(function(){
    $("#businessBtn").click(sendBusinessData);
});

function sendBusinessData(){
    let $feedback = $("#businessFeedback");
    $feedback.removeClass("d-block");
    $feedback.text();

    let $email = $("#businessEmail");
    $email.removeClass("is-invalid");

    let $message = $("#businessMessage");


    let emailReg = /^[a-z]+[a-z\d]{2,}(\.[a-z\d]+)*@[a-z]{2,}(\.[a-z]{2,})+$/;

    if(!emailReg.test($email.val())){
        $email.addClass("is-invalid");
        $feedback.addClass("d-block");
        $feedback.text("Invalid email format. Email must start with a letter and contain only letters and numbers.");
        return;
    }

    if($message.val() == ""){
        $message.addClass("is-invalid");
        $feedback.addClass("d-block");
        $feedback.text("Message can not be empty.");
        return;
    }

    ajaxSendToServer("logic/business_processor.php",{
        email: $email.val(),
        message: $message.val(),
        businessBtn: "on"
    }, onBusinessDataSent, onBusinessDataError);
}
function onBusinessDataSent(data){
    alert(data.message);
    $("#businessEmail").val("");
    $("#businessMessage").val("");
}
function onBusinessDataError(xhr, errType, errMsg){
    alert(xhr.responseText);
}

function ajaxSendToServer(toScript, json, callbackSuccess, callbackError){
    $.ajax({
        url: `${toScript}`,
        method: "POST",
        dataType: "json",
        data: json,
        success: function(data){
            if(callbackSuccess)
                callbackSuccess(data);
        },
        error: function(xhr,errType,errMsg){
            if(callbackError)
                callbackError(xhr,errType,errMsg);
        }
    });
}