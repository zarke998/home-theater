<?php 
    require_once "logic/dbConnection.php";
?>

<div id="moviesContainer" class="container-fluid px-3">
    <h1 class="text-center mt-3 mb-5">TV Shows</h1>

    <div id="contentFilters" class="row mb-4">
        <div class="col-12 mb-2">
            <input class="d-block ml-auto" type="search" id="search" placeholder="search">
        </div>
        <div class="d-flex align-items-center col-6">
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
        <div class="col-2"></div>
        <div class="col-4 d-flex align-items-center justify-content-end">
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

    <div id="contentListFull" data-contenttype="2" class="row mt-2 mb-3">
    </div>
    <button id="loadMoreContent" type="button" class="ht-btn mx-auto my-3"><i class="material-icons">arrow_drop_down</i></button>

</div>