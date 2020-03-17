$(document).ready(function(){
    $("#loginBtn").click(login);
});

function login(){
    let $feedback = $("#loginFeedback");
    $feedback.removeClass("d-block");
    $feedback.text();

    let $email = $("#loginEmail");
    $email.removeClass("is-invalid");

    let $password = $("#loginPassword");
    $password.removeClass("is-invalid");

    let emailReg = /^[a-z]+[a-z\d]{2,}(\.[a-z\d]+)*@[a-z]{2,}(\.[a-z]{2,})+$/;
    let passwordReg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$/;

    if(!emailReg.test($email.val())){
        $email.addClass("is-invalid");
        $feedback.addClass("d-block");
        $feedback.text("Invalid email format. Email must start with a letter and contain only letters and numbers.");
        return;
    }

    if(!passwordReg.test($password.val())){
        $password.addClass("is-invalid");
        $feedback.addClass("d-block");
        $feedback.text("Invalid password format. Password must contain at least one lowercase and uppercase letter, and a number. And it must be at least 8 characters long.");
        return;
    }

    // let rememberMe = $("#loginRememberMe").prop("checked");

    ajaxSendToServer("logic/login_processor.php",{
        email: $email.val(),
        password: $password.val(),
        // rememberLogin: rememberMe,
        loginBtn: "on"
    }, onLoginSuccess, onLoginError);
}

function onLoginSuccess(data){
    window.location.href = `${data.redirect}`;
}
function onLoginError(xhr, errType, errMsg){
    $("#loginFeedback").addClass("d-block");
    $("#loginFeedback").text(xhr.responseText);
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