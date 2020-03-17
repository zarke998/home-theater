$(document).ready(function(){
    $("#registerBtn").click(register);
});

// EVENT HANDLERS
function register(){
    let $feedback = $("#registerFeedback");
    $feedback.removeClass("d-block");
    $feedback.text();

    let $email = $("#registerEmail");
    $email.removeClass("is-invalid");

    let $password = $("#registerPassword");
    $password.removeClass("is-invalid");

    let $passwordConfirm = $("#registerConfirmPassword");
    $passwordConfirm.removeClass("is-invalid");

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

    if($password.val() != $passwordConfirm.val()){
        $passwordConfirm.addClass("is-invalid");
        $feedback.addClass("d-block");
        $feedback.text("Passwords do not match.");
        return;
    }

    $subscription = $("input[name=subscription]:checked");
    if(!$subscription.length){
        $feedback.addClass("d-block");
        $feedback.text("Please select a subscription plan.");
        return;
    }

    ajaxSendToServer("logic/register_processor.php",{
        email: $email.val(),
        password: $password.val(),
        subscription: $subscription.eq(0).val(),
        registerBtn: "on"
    }, onRegisterSuccess, onRegisterError);
}
function onRegisterSuccess(data){
    window.location.href = `${data.redirect}`;
}
function onRegisterError(xhr,errType,errMsg){
    $("#registerFeedback").addClass("d-block");
    $("#registerFeedback").text(xhr.responseText);
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

