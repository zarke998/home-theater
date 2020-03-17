var offset = 0;
var btnClicked = false;

$(document).ready(function(){
    $("#loadMoreBookmarksBtn").click(loadMoreBookmarks);
    $("#bookmarksList").niceScroll()
    loadBookmarks(0);
});


function onBookmarksReceived(data){
    let bookmarks = data;
    let $list = $("#bookmarksList");

    if(bookmarks.length > 0){
        $("#bookmarksList h4").hide();

        for(let b of bookmarks){
            $list.append(createBookmarkListItem(b.con_id, b.title, b.file_path));
        }
        $(".favoriteBtn").click(removeBookmark);
        if(btnClicked)
            $("#bookmarksList").scrollTop($("#bookmarksList")[0].scrollHeight + 50);
        offset+= 8;
    }
    else
        $("#loadMoreBookmarksBtn").css({ "visibility": "hidden"});
    
    
}
function onBookmarksError(xhr, errType, errMsg){
    alert(xhr.responseText);
}
function loadMoreBookmarks(){
    btnClicked = true;
    loadBookmarks(offset);
}
function loadBookmarks(listOffset){
    ajaxGetFromServer("../logic/bookmarks_processor.php", {offset: listOffset}, onBookmarksReceived, onBookmarksError);
}
function removeBookmark(){
    var contentId = this.dataset.id;

    ajaxSendToServer("../logic/setUserBookmark.php",{ content_id: contentId, set_state: 1 },
        function(data){
            alert("Bookmark removed successfuly");
            location.reload();
        },
        function(xhr, errMsg, errType){
            alert(xhr.responseText);
        }
    )
}

function createBookmarkListItem(contentId, title, imgPath){

    let listItem = document.createElement("div");
    listItem.classList.add("row","bookmarkListItem", "align-items-center","py-2","mx-0","px-0");    

    let markup = `
        <div class="col-auto">
            <img src="${imgPath}" alt="Cover">
        </div>
        <div class="col">
            <p class="mb-0">${title}</p>
        </div>
        <div class="col-1 px-0">
            <i data-id="${contentId}" class="material-icons favoriteBtn">favorite</i>
        </div>
        `;

    listItem.innerHTML= markup;
    
    return listItem;
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