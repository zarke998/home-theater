var coverImage = "";
var thumbnailImage = "";
var wallpapers = [];
var offset = 0;

$(document).ready(function(){
    $("#addNewContentBtn").click(showNewContentDialog);
    $(".closeDialogBtn").click(closeNewContentDialog);
    $("#newContentPanel").click(closeNewContentDialog).children().click(function(event){event.stopPropagation();});

    $(".ht-multiselect>div:first-child").click(toggleMultiselect);

    $("#chooseCoverImage").change(loadImage);
    $("#thumbnailImageBtn").change(showThumbnailName);

    $("#wallpaperImagesBtn").change(showWallpaperNames);

    $("#addContentBtn").click(addNewContent);
    $("#updateContentBtn").click(updateContent);

    $("#contentTypesSelect").change(loadContentOfType);
    $("#loadMoreContent").click(function(){
        let contentType = $("#contentTypesSelect").val();
        let search = $("#search").val();
        loadContentItems(contentType, offset, search);
    });
    $("#search").blur(searchContent);

    loadContentItems(1,0);
});

// EVENT HANDLERS
function showNewContentDialog(){
    ajaxGetFromServer("../logic/getCTRC.php", {},function(data){
        $("#newContentPanel").addClass("d-block");
        $("body").addClass("stop-scrolling");

        console.log(data);
        
        $("#categoriesDropdown").prev().text("(none)");
        $("#resolutionsDropdown").prev().text("(none)");
    
        $("#newCoverImage>img").attr("src","/images/no-image.jpg");
        $("#thumbnailImageBtn").parent().next().removeClass("d-block");
        $("#wallpapersContainer").removeClass("d-block");

        addCategories(data.categories);
        addContentTypes(data.c_types);
        addResolutions(data.resolutions);


        
    },
    function(xhr,errType,errMsg){
        console.log(xhr.responseText);
        console.log(errType);
        console.log(errMsg);
    },false)
    
}
function closeNewContentDialog(){
    $("#newContentPanel").removeClass("d-block");
    $("body").removeClass("stop-scrolling");
    $(".ht-multiselect>div:first-child").removeClass("non-clickable");
    $("#contentTypesDropdown").prop("disabled", false);
    $("#newContentPanelDialog input[type=file]").prop("disabled",false);
    $("#errorInfo").removeClass("d-block");

    $("#addContentBtn").removeClass("d-none");
    $("#addContentBtn").addClass("d-block");

    $("#updateContentBtn").removeClass("d-block");

    
    $("form").trigger("reset");
}
function toggleMultiselect(){
    let $multiselect = $(this).parent();
    let $list = $multiselect.find(".ht-multiselect-list");

    if(!$list.hasClass("d-block"))
    {
        $(".ht-multiselect-list").removeClass("d-block");
        $list.addClass("d-block");
    }
    else{
        $list.removeClass("d-block");
        $checkedLabels = $list.find(".ht-multiselect-list-item>input[type=checkbox]:checked+label");

        let chbsToText = "";

        // $checkedLabels.forEach(element => {
        //     console.log(element.innerText);
        // });
        $checkedLabels.each(function(i) { 
            i == 0 ? chbsToText += $(this).text() : chbsToText += ", " + $(this).text();
        });
        console.log(chbsToText);
        

        chbsToText == "" ? $(this).text("(none)") :$(this).text(chbsToText);
    }
}
function loadImage(){
    let input = this;
    if(input.files && input.files[0]){
        let reader = new FileReader();

        reader.onload = function(e){
            $(input).prev().attr("src", e.target.result);
        }

        reader.readAsDataURL(input.files[0]);

        coverImage = extractFileNameFromPath(input.files[0].name);
    }
}
function showThumbnailName(){
    let filePath = this.value;
    thumbnailImage = extractFileNameFromPath(filePath);

    $(this).parent().next().addClass("d-block").text(thumbnailImage);

}
function showWallpaperNames(){
    wallpapers = [];

    let input = this;

    let wallpaperTags = ""

    console.dir(input);
    if(input.files){
        $(input).parent().next().addClass("d-block");
        for(let i = 0; i < input.files.length; i++){
            wallpaperTags += `<p class="text-center my-0">${input.files[i].name}</p>`;
            wallpapers.push(input.files[i].name);
        }
    }

    $(input).parent().next().html(wallpaperTags);
}
function addNewContent(){

    let $errorInfo = $("#errorInfo");
    $errorInfo.removeClass("d-block");
    $errorInfo.text("");

    let imgReg = /(png|jpg)$/;

    if(!imgReg.test(coverImage)){
        $errorInfo.addClass("d-block");
        console.log($errorInfo);

        $errorInfo.text("Incorrect image extension. Allowed png or jpg.");
        return false;
    }
    if(!imgReg.test(thumbnailImage)){
        $errorInfo.addClass("d-block");
        $errorInfo.text("Incorrect thumbnail extension. Allowed png or jpg.");
        return false;
    }
    for(let w of wallpapers){
        if(!imgReg.test(w)){
            $errorInfo.addClass("d-block");
            $errorInfo.text("Incorrect wallpaper extension. Allowed png or jpg.");
            return false;
        }
    }

    let title = $("input[name=title]").val();
    if(title == ""){
        $errorInfo.addClass("d-block");
        $errorInfo.text("Title can't be empty.");
        return false;
    }

    let releaseYear = parseInt($("input[name=releaseYear]").val(), 10);
    if(isNaN(releaseYear) || releaseYear < 1900){
        $errorInfo.addClass("d-block");
        $errorInfo.text("Release year must be greater than 1900.");
        return false;
    }

    let runtime = parseInt($("input[name=runtime]").val(),10);
    if(isNaN(runtime) || runtime < 0){
        $errorInfo.addClass("d-block");
        $errorInfo.text("Runtime must be greater than 0.");
        return false;
    }

    console.log(title);
    console.log(releaseYear);
    console.log(runtime);
    let rating = parseFloat($("input[name=rating]").val());
    if(isNaN(rating) || rating < 0 || rating > 5){
        $errorInfo.addClass("d-block");
        $errorInfo.text("Rating must be between 0 and 5.0");
        return false;
    }

    let metascore = parseInt($("input[name=metascore]").val(),10);
    if(isNaN(metascore) || metascore < 0 || metascore > 100){
        $errorInfo.addClass("d-block");
        $errorInfo.text("Metascore must be between 0 and 100");
        return false;
    }

    let contentType = $("#contentTypesDropdown").val();

    if($("#categoriesDropdown").prev().text() == "(none)"){
        $errorInfo.addClass("d-block");
        $errorInfo.text("Please select at least one category.");
        return false;
    }
    if($("#resolutionsDropdown").prev().text() == "(none)"){
        $errorInfo.addClass("d-block");
        $errorInfo.text("Please select at least one resolution.");
        return false;
    }
    
}
function updateContent(){
    let $errorInfo = $("#errorInfo");
    $errorInfo.removeClass("d-block");
    $errorInfo.text("");

    let contentId = $(this).data("id");

    let title = $("input[name=title]").val();
    if(title == ""){
        $errorInfo.addClass("d-block");
        $errorInfo.text("Title can't be empty.");
        return false;
    }

    let releaseYear = parseInt($("input[name=releaseYear]").val(), 10);
    if(isNaN(releaseYear) || releaseYear < 1900){
        $errorInfo.addClass("d-block");
        $errorInfo.text("Release year must be greater than 1900.");
        return false;
    }

    let runtime = parseInt($("input[name=runtime]").val(),10);
    if(isNaN(runtime) || runtime < 0){
        $errorInfo.addClass("d-block");
        $errorInfo.text("Runtime must be greater than 0.");
        return false;
    }

    console.log(title);
    console.log(releaseYear);
    console.log(runtime);
    let rating = parseFloat($("input[name=rating]").val());
    if(isNaN(rating) || rating < 0 || rating > 5){
        $errorInfo.addClass("d-block");
        $errorInfo.text("Rating must be between 0 and 5.0");
        return false;
    }

    let metascore = parseInt($("input[name=metascore]").val(),10);
    if(isNaN(metascore) || metascore < 0 || metascore > 100){
        $errorInfo.addClass("d-block");
        $errorInfo.text("Metascore must be between 0 and 100");
        return false;
    }

    let description = $("textarea[name=description]").val();

    console.log(description);

    ajaxSendToServer("../logic/updateContent.php",
    {
        id: contentId, 
        title: title, 
        releaseYear: releaseYear, 
        runtime: runtime, 
        rating: rating, 
        metascore: metascore,
        description: description
    }
    ,function(data){
        alert(data.message);
        location.reload();
    },
    function(xhr, errMsg, errType){
        console.log(xhr.responseText);
    });
}

function onContentReceived(content){
    if(content.length == 0){
        $("#loadMoreContent").hide();
        return;
    }
    console.log(content);
    
    let $list = $("#manageContentList");
    for(let c of content){
        $list.append(createContentListItem(c.id,c.title,c.year_released,c.runtime,c.metascore,c.file_path));
    }

    $(".manageContentItem .deleteBtn").click(removeContentItem);
    $(".manageContentItem .editContentBtn").click(editContent);

    offset += 8;
}
function onContentError(xhr, errType, errMsg){
    console.log(xhr.responseText);
}
function removeContentItem(){
    let cId = this.dataset.id;

    ajaxSendToServer("../logic/removeContentItem.php",{id: cId}, 
    function(data){
        // alert(data.message);
        location.reload();
    },
    function(xhr, errType, errMsg){
        alert(xhr.responseText);
    });
}
function editContent(){
    showNewContentDialog();
    initializeDialogFields(this.value);

    $("#addContentBtn").addClass("d-none");
    $("#addContentBtn").removeClass("d-block");

    $("#updateContentBtn").addClass("d-block");
    $("#updateContentBtn").data("id",parseInt(this.value));
}

function onContentInfoReceive(data){
    // alert("Success");
    console.log(data);
    $("input[name=title]").val(data.info.title);
    $("input[name=releaseYear]").val(data.info.yearReleased);
    $("input[name=runtime]").val(data.info.runtime);
    $("input[name=rating]").val(data.info.rating);
    $("input[name=metascore]").val(data.info.metascore);
    $("textarea[name=description]").val(data.info.description);

    $("#contentTypesDropdown").val(data.info.contentType);
    $("#contentTypesDropdown").prop("disabled", true);
    
    $("#categoriesDropdown").prev().text("(non-editable)");
    $("#resolutionsDropdown").prev().text("(non-editable)");

    showCoverImage(data.images);
    $("#newContentPanelDialog input[type=file]").prop("disabled",true);

    $(".ht-multiselect>div:first-child").addClass("non-clickable");
}
function onContentInfoError(xhr,errType,errMsg){
    console.log(xhr.responseText);
    console.log(errType);
    console.log(errMsg);
}
function searchContent(){
    let searchString = this.value;

    let contentType = $("#contentTypesSelect").val();

    $("#manageContentList").html("");
    $("#loadMoreContent").show();
    offset = 0;
    loadContentItems(contentType, 0, searchString);
}
// FUNCTIONS

function addCategories(categories){
    let catItems = "";

    for(let c of categories)
        catItems += `
        <div class="ht-multiselect-list-item">
            <input type="checkbox" name="categories[]" value="${c.id}"/>
            <label>${c.name}</label>
        </div>`;

    $("#categoriesDropdown").html(catItems);
}
function addContentTypes(contentTypes){
    let contentTypesItems = "";
    for(let ct of contentTypes)
        contentTypesItems += `<option value="${ct.id}">${ct.name}</option>`;

    $("#contentTypesDropdown").html(contentTypesItems);
}
function addResolutions(resolutions){
    let resItems = "";

    for(let r of resolutions)
        resItems += `
        <div class="ht-multiselect-list-item">
            <input type="checkbox" name="resolutions[]" value="${r.id}"/>
            <label>${r.name}</label>
        </div>`;

    $("#resolutionsDropdown").html(resItems);
}
function extractFileNameFromPath(path){
    return path.substring(path.lastIndexOf("\\") + 1);
}


function loadContentOfType(){
    offset = 0;

    let contentTypeId = this.value;
    $("#manageContentList").html("");
    $("#loadMoreContent").show();
    $("#search").val("");
    loadContentItems(contentTypeId, 0);
}
function loadContentItems(contentTypeId, listOffset, searchString){
    let searchCrit = searchString ? searchString : "";
    searchCrit = searchCrit.trim();
    ajaxGetFromServer("/logic/getContentItems.php", {offset: listOffset, contentType: contentTypeId, search: searchCrit}, onContentReceived, onContentError, false);
}
function createContentListItem(id, title, yearReleased, runtime, metascore, imgPath){
    let listItem = document.createElement("div");
    listItem.classList.add("col-3","manageContentItem","mb-3");

    let content = `
    <div>
        <img src="${imgPath}" alt="Cover">
    </div>
    <div class="px-0 ml-2">
        <div>
            <div class="d-flex align-items-center mb-2">
                <h3 class="d-inline mb-0">${title}</h3> <i data-id=${id} class="d-inline ml-2 material-icons deleteBtn">delete</i>
            </div>
            <p>Release year: ${yearReleased}</p>
            <p>Runtime: ${runtime}min</p>
            <p>Metascore: ${metascore}</p>
        </div>  
        <button class="ht-btn mt-3 editContentBtn" value="${id}" type="button">Edit</button>
    </div>`;

    listItem.innerHTML = content;

    return listItem;
}

function initializeDialogFields(contentId){

    ajaxSendToServer("../logic/getContentInfo.php", {id: contentId} ,onContentInfoReceive, onContentInfoError);
}
function showCoverImage(images){
    for(var i = 0; i < images.isCover; i++){
        if(images.isCover[i] == 1)
            return;
    }
    let img_path = images.file_path[i];
    console.log(img_path);
    $("#newCoverImage img").attr("src",img_path);
}

// AJAX FUNCTIONS
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

