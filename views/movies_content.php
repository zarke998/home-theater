<?php 
    require_once "logic/dbConnection.php";
?>

<div id="moviesContainer" class="container-fluid px-3">
    <h1 class="text-center mt-3 mb-5">Movies</h1>

    <div id="contentFilters" class="row mb-4">
        <div class="col-sm-6 offset-sm-6 col-md-5 offset-md-7 col-lg-3 offset-lg-9 mb-2">
            <input class="d-block ml-0 w-100 ml-sm-auto" type="search" id="search" placeholder="search">
        </div>
        <div class="d-flex align-items-center col-12 col-sm-6 mb-2">
            <label class="mb-0">Select category: </label>
            <select id="contentCategoriesSelect" class="ml-3">
                <?php
                    $rootPath = $_SERVER["DOCUMENT_ROOT"];
                    require_once "$rootPath/logic/getAllCategories.php";

                    var_dump($categories);
                    echo "<option value='0'>All</option>";
                    foreach($categories as $c): ?>
                        <option value="<?=$c->id?>"><?=$c->name?></option>
                    <?php endforeach;
                ?>
            </select>
        </div>
        <div class="p-0 col-auto col-md-2"></div>
        <div class="col-12 col-sm-6 col-md-4 d-flex align-items-center justify-content-sm-end justify-content-start">
            <label class="mb-0">Sort by: </label>
            <select id="contentSortSelect" class="ml-3">
                <option value="1">Name A-Z</option>
                <option value="2">Name Z-A</option>
                <option value="3">Rating</option>
                <option value="4">Year ascending</option>
                <option value="5">Year descending</option>
            </select>
        </div>
    </div>

    <div id="contentListFull" data-contenttype="1" class="row mt-2 mb-3">
    </div>
    <button id="loadMoreContent" type="button" class="ht-btn mx-auto my-3"><i class="material-icons">arrow_drop_down</i></button>

</div>