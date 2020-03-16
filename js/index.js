var contentSliderItems;
var currentWallpaper = 0;

$(document).ready(function(){
    $(".contentListScroll").click(scrollList);
    $("#newReleases .contentListScroll").click(loadNextSliderItem);
    $(".favoriteBtn").click(setUserBookmark);

    loadWallpapers();
});

function scrollList(){
    let dir = this.dataset.dir;
    dir = parseInt(dir);

    let $list = $(this).parent().children().first();
    let currentScrollLeft = $list.scrollLeft();
    $list.stop().animate({
        scrollLeft: currentScrollLeft + 500 * dir
    },400);
}

function loadWallpapers(){
    ajaxGetFromServer("logic/getContentWithWallpapers.php",{}, onWallpapersReceive, onWallpapersError);
}
function onWallpapersReceive(data){
    contentSliderItems = data;

    loadSliderItem(0);
}

function onWallpapersError(xhr,errType,errMsg){
    console.log(xhr.responseText);
}
function loadNextSliderItem(){
    let dir = parseInt(this.dataset.dir);

    currentWallpaper+= dir;

    if(currentWallpaper < 0)
        currentWallpaper = contentSliderItems.length - 1;
    else if(currentWallpaper == contentSliderItems.length)
        currentWallpaper = 0;

    loadSliderItem(currentWallpaper);
}
function loadSliderItem(pos){
    let coverPath = contentSliderItems[pos].info.file_path;
    coverPath = coverPath.substring(3);
    $("#sliderItemCover img").attr("src", coverPath);
    $("#sliderItemInfo h4").text(contentSliderItems[pos].info.title);
    $("#sliderItemInfo p").text(contentSliderItems[pos].info.description);

    console.log(contentSliderItems);
    let wallCount = contentSliderItems[pos].wallpapers.length;

    let randomWall = randomBetween(0, wallCount - 1);
    randomWall = contentSliderItems[pos].wallpapers[randomWall];
    randomWall = randomWall.substring(3);
    $("#newReleasesBackground").css("background-image", "url('" + randomWall + "')");
}
function setUserBookmark(){
    var contentId = this.dataset.id;
    var $favoriteBtn = $(this);
    let setState = $favoriteBtn.text() == "favorite" ? 1 : 0;

    ajaxSendToServer("logic/setUserBookmark.php",{ content_id: contentId, set_state: setState },
        function(data){
            alert(data.message);

            if($favoriteBtn.text() == "favorite")
                $(`.favoriteBtn[data-id="${contentId}"]`).text("favorite_border");
            else
                $(`.favoriteBtn[data-id="${contentId}"]`).text("favorite");
            
        },
        function(xhr, errMsg, errType){
            alert(xhr.responseText);
        }
    )
}
function ajaxGetFromServer(toScript,json,callbackSuccess, callbackError, isAsync) {
    $.ajax({
        url: `${toScript}`,
        method: "GET",
        async: isAsync,
        data: json,
        dataType: "json",
        success: function(data){
            if(callbackSuccess)
                callbackSuccess(data);
        },
        error: function(xhr,errType,errMsg){
            if(callbackError)
                callbackError(xhr,errType,errMsg);
        }
    })
}
function randomBetween(start, end){
    if(start > end)
        return 0;

    start = Math.floor(start);
    end = Math.floor(end);

    let generated = Math.random();
    let random = Math.round(generated);

    random*= (end - start);
    random+= start;

    return random;
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