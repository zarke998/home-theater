var offset = 0;
var contentType = 0;

$(document).ready(function(){
    contentType = parseInt($("#contentListFull").attr("data-contenttype"));

    $("#loadMoreContent").click(loadNewContent);
    $("#contentCategoriesSelect").change(loadCategoryContent);
    $("#search").blur(searchContent);
    $("#contentSortSelect").change(loadSortedContent);
    
    loadContentItems(contentType,0,24,0);
});
function onContentReceived(content){
    if(content.length == 0){
        $("#loadMoreContent").hide();
        return;
    }

    let $list = $("#contentListFull");
    for(let c of content){
        $list.append(createContentListItem(c));
    }
    $(".favoriteBtn").click(setUserBookmark);

    offset += 24;
}
function onContentError(xhr, errType, errMsg){
    console.log(xhr.responseText);
}
function loadContentItems(contentTypeId, listOffset, limit, categoryId, searchString, sortId){
    let searchCrit = searchString ? searchString : "";
    sortId = sortId ? sortId : 1;
    limit = limit ? limit : 8;

    searchCrit = searchCrit.trim();
    ajaxGetFromServer("logic/getContentItems.php", {offset: listOffset, limit: limit, contentType: contentTypeId, category: categoryId, search: searchCrit, sort: sortId}, onContentReceived, onContentError, false);
}
function loadNewContent(){
    let search = $("#search").val();
    let category = $("#contentCategoriesSelect").val();
    let sort = $("#contentSortSelect").val();

    loadContentItems(contentType,offset, 24, category, search,sort);
}
function loadCategoryContent(){
    offset = 0;
    $("#search").val("");
    $("#contentListFull").html("");
    $("#loadMoreContent").show();

    let category = this.value;
    let sort = $("#contentSortSelect").val();
    let search = $("#search").val();
    
    loadContentItems(contentType,0,24,category, search, sort);
}
function loadSortedContent(){
    offset = 0;
    
    $("#contentListFull").html("");
    $("#loadMoreContent").show();
    $("#search").val("");

    let category = $("#contentCategoriesSelect").val();
    let sort = $("#contentSortSelect").val();
    let search = $("#search").val();

    loadContentItems(contentType,0,24,category,search, sort);
}
function searchContent(){
    offset = 0;

    let search = this.value;
    let category = $("#contentCategoriesSelect").val();

    $("#contentListFull").html("");
    $("#loadMoreContent").show();

    loadContentItems(contentType,offset,24,category,search);
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

function createContentListItem(c){

    
    let fav = "";
    if(typeof c.user != "undefined"){
        if(c.user == null)
            fav = `<i data-id='${c.id}' class="material-icons favoriteBtn">favorite_border</i>`;
        else
            fav = `<i data-id='${c.id}' class="material-icons favoriteBtn">favorite</i>`;
    }

    let image = c.file_path.substring(3);
    let markup = `
    <div class="contentListItem">
        <img src="${image}" alt="Cover">
        <div class="contentOverlay">
            ${fav}
            <div class="contentInfo px-2">
                <p>${c.title}</p>
                <p>${c.rating} <i class="material-icons ml-1">star</i></p>
            </div>
        </div>
    </div>`;

    return markup;
}