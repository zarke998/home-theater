var panelIsShowed = false;

$(document).ready(function(){
    $("#accountBtn").click(togglePanel);
    $("#logoutBtn").click(logout);
});

function togglePanel(){
    panelIsShowed ? $(".accountPanel").hide() : $(".accountPanel").show();
    
    panelIsShowed = !panelIsShowed;
}
function logout(){
    
}