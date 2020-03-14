<?php 
    require_once "../logic/dbConnection.php";
?>

<div id="manageLibraryContainer" class="container-fluid px-3">
    <h1 class="text-center mt-3 mb-5">Manage library</h1>

    <div id="contentFilters" class="row mb-4">
        <div class="d-flex align-items-center col-6">
            <label class="mb-0">Select content type: </label>
            <select id="contentTypesSelect" class="ml-3">
                <?php
                    $rootPath = $_SERVER["DOCUMENT_ROOT"];
                    $rootPath.= "/home-theater";
                    require_once "$rootPath/logic/getAllContentTypes.php";

                    foreach($content_types as $c): ?>
                        <option value="<?=$c->id?>"><?=$c->name?></option>
                    <?php endforeach;
                ?>
            </select>
        </div>
        <div class="col-3"></div>
        <div class="col-3">
            <input class="d-block ml-auto" type="search" id="search" placeholder="search">
        </div>
    </div>

    <div id="manageContentList" class="row mt-2 mb-3">
        <!-- <div class="col-3 manageContentItem mb-3">
            <div>
                <img src="/home-theater/images/no-image.jpg" alt="Cover">
            </div>
            <div class="px-0 ml-2">
                <div>
                    <div class="d-flex align-items-center mb-2">
                        <h3 class="d-inline mb-0">Deadpool</h3> <i class="d-inline ml-2 material-icons deleteBtn">delete</i>
                    </div>
                    <p>Release year: 2019</p>
                    <p>Runtime: 120min</p>
                    <p>Categories: Actio, Drama...</p>
                </div>  
                <button class="ht-btn" value="1" type="button">Edit</button>
            </div>
        </div> -->
    </div>
        <button id="loadMoreContent" type="button" class="ht-btn mx-auto my-3"><i class="material-icons">arrow_drop_down</i></button>

    <!-- HIDDEN -->
    <div id="addNewContentBtn" class="ht-floating-btn">
        <i class="material-icons">add</i>
    </div>
    <div id="newContentPanel" class="d-none">
        <div id="newContentPanelDialog" class="container-fluid px-3">
            <i class="material-icons closeDialogBtn">close</i>
            <h3 class="my-2">Add new content</h3>
            <form enctype="multipart/form-data" class="w-100" action="../logic/addContent.php" method="POST" onsubmit="return addNewContent()">
                <div class="row mt-4">
                    <div class="col-3">
                        <div >
                            <div id="newCoverImage" class="mb-2">
                                <img src="/home-theater/images/no-image.jpg" alt="No image" class="w-100">
                                <input id="chooseCoverImage" type="file" name="coverImage" />
                                <p class="text-center">Format: 800x600</p>
                            </div>
                            <div class="ht-file-label-group">
                                <div class="ht-input-file mt-1">
                                    <input id="thumbnailImageBtn" type="file" name="thumbnail" />
                                    <div class="ht-btn">Add thumbnail</div>
                                </div>
                                <p class="text-center my-0 d-none">Image.png</p>
                            </div>
                            <div class="ht-file-label-group">
                                <div class="ht-input-file mt-2">
                                    <input id="wallpaperImagesBtn" type="file" name="wallpapers[]" multiple />
                                    <div class="ht-btn">Add wallpapers</div>
                                </div>
                                <div id="wallpapersContainer" class="d-none">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 pl-0">
                                <input type="text" name="title" class="ht-input-text border-0" placeholder="Title"/>
                            </div>
                            <div class="col-6 pl-0">
                                <div class="ht-inline-form-group">
                                    <label>Release year:</label>
                                    <input type="text" name="releaseYear" class="ht-input-text border-0" placeholder="(none)"/>
                                </div>
                                <div class="ht-inline-form-group">
                                    <label>Runtime:</label>
                                    <input type="text" name="runtime" class="ht-input-text border-0" placeholder="(none)"/>
                                </div>
                                <div class="ht-inline-form-group">
                                    <label>Rating:</label>
                                    <input type="text" name="rating" class="ht-input-text border-0" placeholder="(none)"/>
                                </div>
                                <div class="ht-inline-form-group">
                                    <label>Metascore:</label>
                                    <input type="text" name="metascore" class="ht-input-text border-0" placeholder="(none)"/>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="ht-inline-form-group">
                                    <label>Content type:</label>
                                    <select id="contentTypesDropdown" name="content_type">
                                    </select>
                                </div>
                                <div class="d-flex">
                                    <label>Categories:</label>
                                    <div class="ht-multiselect ml-2">
                                        <div>(none)</div>
                                        <div id="categoriesDropdown" class="ht-multiselect-list d-none">
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex">
                                    <label>Resolutions:</label>
                                    <div class="ht-multiselect ml-2">
                                        <div>(none)</div>
                                        <div id="resolutionsDropdown" class="ht-multiselect-list d-none">
                                            <div class="ht-multiselect-list-item">
                                                <input type="checkbox" value="0"/>
                                                <label>Action</label>
                                            </div>
                                            <div class="ht-multiselect-list-item">
                                                <input type="checkbox" value="0"/>
                                                <label>Action</label>
                                            </div>
                                            <div class="ht-multiselect-list-item">
                                                <input type="checkbox" value="0"/>
                                                <label>Action</label>
                                            </div>
                                            <div class="ht-multiselect-list-item">
                                                <input type="checkbox" value="0"/>
                                                <label>Action</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 px-0">
                                <textarea name="description" class="w-75 h-input-text" rows="4" placeholder="Enter description here..."></textarea>
                            </div>
                        </div>
                    </div>
                    <div id="errorInfo" class="invalid-feedback text-right mb-2"></div>
                    <button id="addContentBtn" type="submit" name="addBtn" value="add" class="d-block w-25 ml-auto mb-2 ht-btn">Add</button>
                    <button id="updateContentBtn" type="button" name="updateBtn" value="update" class="d-none w-25 ml-auto mb-2 ht-btn">Edit</button>
                </div>
            </form>
        </div>
    </div>

</div>