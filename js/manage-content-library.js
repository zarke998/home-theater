
var coverImage = "";
var thumbnailImage = "";
var wallpapers = [];

$(document).ready(function(){
    $("#addNewContentBtn").click(showNewContentDialog);
    $(".closeDialogBtn").click(closeNewContentDialog);
    $("#newContentPanel").click(closeNewContentDialog).children().click(function(event){event.stopPropagation();});

    $(".ht-multiselect>div:first-child").click(toggleMultiselect);

    $("#chooseCoverImage").change(loadImage);
    $("#thumbnailImageBtn").change(showThumbnailName);

    $("#wallpaperImagesBtn").change(showWallpaperNames);

    $("#addContentBtn").click(addNewContent);
});

// EVENT HANDLERS
function showNewContentDialog(){
    ajaxGetFromServer("../logic/getCTRC.php", function(data){
        $("#newContentPanel").addClass("d-block");
        $("body").addClass("stop-scrolling");

        console.log(data);
        
        addCategories(data.categories);
        addContentTypes(data.c_types);
        addResolutions(data.resolutions);

        $("#categoriesDropdown").prev().text("(none)");
        $("#resolutionsDropdown").prev().text("(none)");
    
        $("#newCoverImage>img").attr("src","/home-theater/images/no-image.jpg");
        $("#thumbnailImageBtn").parent().next().removeClass("d-block");
        $("#wallpapersContainer").removeClass("d-block");

        
    },
    function(xhr,errType,errMsg){
        alert(xhr.responseText);
        alert(errMsg);
    })
    
}
function closeNewContentDialog(){
    $("#newContentPanel").removeClass("d-block");
    $("body").removeClass("stop-scrolling");

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

    let $errorInfo = $(this).prev();
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

function ajaxGetFromServer(toScript, callbackSuccess, callbackError) {
    $.ajax({
        url: `${toScript}`,
        method: "GET",
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