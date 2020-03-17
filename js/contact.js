$(document).ready(function(){
    $("#contactBtn").click(sendContactData);
});

function sendContactData(){
    let $feedback = $("#contactFeedback");
    $feedback.removeClass("d-block");
    $feedback.text();

    let $email = $("#contactEmail");
    $email.removeClass("is-invalid");

    let $subject = $("#contactSubject");
    $subject.removeClass("is-invalid");

    let $message = $("#contactMessage");
    $message.removeClass("is-invalid");

    let emailReg = /^[a-z]+[a-z\d]{2,}(\.[a-z\d]+)*@[a-z]{2,}(\.[a-z]{2,})+$/;
    let subjectReg = /^[A-z\d-]+(\s([A-z\d-]+))*$/;

    if(!emailReg.test($email.val())){
        $email.addClass("is-invalid");
        $feedback.addClass("d-block");
        $feedback.text("Invalid email format. Email must start with a letter and contain only letters and numbers.");
        return;
    }

    if(!subjectReg.test($subject.val())){
        $subject.addClass("is-invalid");
        $feedback.addClass("d-block");
        $feedback.text("Subject can only contain letters and numbers.");
        return;
    }

    if($message.val() == ""){
        $message.addClass("is-invalid");
        $feedback.addClass("d-block");
        $feedback.text("Message can not be empty.");
        return;
    }

    ajaxSendToServer("logic/contact_processor.php",{
        email: $email.val(),
        subject: $subject.val(),
        message: $message.val(),
        contactBtn: "on"
    }, onContactDataSent, onContactDataError);
}
function onContactDataSent(data){
    alert(data.message);
    $("#contactEmail").val("");
    $("#contactSubject").val("");
    $("#contactMessage").val("");
}
function onContactDataError(xhr, errType, errMsg){
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