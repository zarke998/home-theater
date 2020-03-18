<?php 

    $rootPath = $_SERVER["DOCUMENT_ROOT"];
    require_once "$rootPath/logic/dbConnection.php";

    if(isset($_SESSION["user"])){
        $user = $_SESSION["user"];

        $movieCategories = getAvailableContentCategories(1);
        $tvShowCategories = getAvailableContentCategories(2);

    }
    else
        $user = null;
?>

<div class="container-fluid py-5 d-flex flex-column">

    <?php 
        if($user == null)
            $order = "1";
        else
            $order = "6";

    ?>
    <div class="contentListContainer mb-5 px-1 order-<?php echo $order ?>">
        <h2 class="mb-4">Most popular Movies</h2>
        <div class="contentListWrapper">
            <div class="contentList d-flex">
            <?php 
                    $movies = getMostPopularContent(1,false);

                    foreach($movies as $m): ?>
                    <div class="contentListItem">
                        <img src="<?=substr($m->file_path,3)?>" alt="Cover">
                        <div class="contentOverlay">
                        <?php 
                            if($user != null){
                                if($m->user != null)
                                    echo "<i data-id='$m->con_id'class='material-icons favoriteBtn'>favorite</i>";
                                else
                                    echo "<i data-id='$m->con_id'class='material-icons favoriteBtn'>favorite_border</i>";
                            }
                                // <i class="material-icons">favorite</i>
                        ?>
                        
                            <div class="contentInfo">
                                <p><?=$m->title?></p>
                                <p><?=$m->rating?> <i class="material-icons ml-1">star</i></p>
                            </div>
                        </div>
                    </div>
                    <?php endforeach;
            ?>
            </div>
            <div class="contentListScroll contentListScrollLeft" data-dir="-1"><i class="material-icons">keyboard_arrow_left</i></div>
            <div class="contentListScroll contentListScrollRight" data-dir="1"><i class="material-icons">keyboard_arrow_right</i></div>
        </div>
    </div>

    <?php 
        if($user == null)
            $order = "2";
        else
            $order = "7";
    ?>
    <div class="contentListContainer mb-4 px-1 order-<?php echo $order ?>">
        <h2 class="mb-4">Most popular TV Shows</h2>
        <div class="contentListWrapper">
            <div class="contentList d-flex">
            <?php 

                    $tvShows = getMostPopularContent(2,false);

                    foreach($tvShows as $tS): ?>
                    <div class="contentListItem">
                        <img src="<?=substr($tS->file_path,3)?>" alt="Cover">
                        <div class="contentOverlay">
                            <?php 
                                if($user != null){
                                    if($tS->user != null)
                                        echo "<i data-id='$tS->con_id'class='material-icons favoriteBtn'>favorite</i>";
                                    else
                                        echo "<i data-id='$tS->con_id'class='material-icons favoriteBtn'>favorite_border</i>";
                                }
                                    // <i class="material-icons">favorite</i>
                            ?>
                            <div class="contentInfo">
                                <p><?=$tS->title?></p>
                                <p><?=$tS->rating?> <i class="material-icons ml-1">star</i></p>
                            </div>
                        </div>
                    </div>
                    <?php endforeach;
            ?>
            </div>
            <div class="contentListScroll contentListScrollLeft" data-dir="-1"><i class="material-icons">keyboard_arrow_left</i></div>
            <div class="contentListScroll contentListScrollRight" data-dir="1"><i class="material-icons">keyboard_arrow_right</i></div>
        </div>
    </div>

    <?php
        if($user == null): ?>
    <div id="freeTrialContainer" class="row px-5 py-5 order-3">
        <div class="col-6">
            <h2 class="text-center mb-5">Start your Free Trial</h2>
            <ul>
                <li class="mb-2"><i class="material-icons mr-3 ">play_circle_filled</i><span>7 day Free Trial</span></li>
                <li class="mb-2"><i class="material-icons mr-3 ">play_circle_filled</i><span>Gain access to all features</span></li>
                <li class="mb-2"><i class="material-icons mr-3 ">play_circle_filled</i><span>After that you can subscribe for only 4.99$/month</span></li>
            </ul>
            <button type="button" class="ht-btn d-block mx-auto py-0 w-25" disabled>Free trial</button>
        </div>
        <div class="col-6"></div>
    </div>
    <?php endif; ?>

    <div class="contentListContainer mb-5 mt-4 px-1 order-4">
        <h2 class="mb-4">4K Movies</h2>
        <div class="contentListWrapper">
            <div class="contentList d-flex">
            <?php 
                    $movies = getContentByResolution(1,2);

                    foreach($movies as $m): ?>
                    <div class="contentListItem">
                        <img src="<?=substr($m->file_path,3)?>" alt="Cover">
                        <div class="contentOverlay">
                            <?php 
                                if($user != null){
                                    if($m->user != null)
                                        echo "<i data-id='$m->con_id'class='material-icons favoriteBtn'>favorite</i>";
                                    else
                                        echo "<i data-id='$m->con_id'class='material-icons favoriteBtn'>favorite_border</i>";
                                }
                                    // <i class="material-icons">favorite</i>
                            ?>
                            <div class="contentInfo">
                                <p><?=$m->title?></p>
                                <p><?=$m->rating?> <i class="material-icons ml-1">star</i></p>
                            </div>
                        </div>
                    </div>
                    <?php endforeach;
            ?>
            </div>
            <div class="contentListScroll contentListScrollLeft" data-dir="-1"><i class="material-icons">keyboard_arrow_left</i></div>
            <div class="contentListScroll contentListScrollRight" data-dir="1"><i class="material-icons">keyboard_arrow_right</i></div>
        </div>
    </div>

    <?php 
        if($user == null)
            $order = "5";
        else
            $order = "3";
    ?>
    <div id="newReleasesContainer" class="row py-4 order-<?php echo $order?>">
        <div id="newReleasesBackground"></div>
        <div class="col-12 mb-4">
            <h2 class="text-center mb-5">New releases</h2>
        </div>
        <div class="col-1"></div>
        <div class="col-8">
            <div id="newReleases" class="row">
                <div class="col-6 px-0">
                    <div class="row d-flex align-items-center justify-content-between">
                        <div data-dir="-1" class="col-1 contentListScroll contentListScrollLeft px-0">
                            <i class="material-icons">keyboard_arrow_left</i>
                        </div>
                        <div id="sliderItemCover" class="col-10 px-3">
                            <img src="images/no-image.jpg" class="w-100" alt="Cover">
                        </div>
                        <div data-dir="1" class="col-1 contentListScroll contentListScrollRight px-0">
                            <i class="material-icons">keyboard_arrow_right</i>
                        </div>
                    </div>
                </div>
                <div id="sliderItemInfo" class="col-6">
                    <h4 class="mb-4">Deadpool</h4>
                    <p>This is a description.. This is a description.. This is a description.. This is a description.. This is a description.. This is a description.. This is a description.. This is a description.. This is a description.. This is a description.. This is a description.. This is a description.. This is a description.. This is a description.. This is a description.. </p>
                    <button type="button" class="ht-btn d-block mx-auto" disabled> Watch now</button>
                </div>
            </div>
        </div>
    </div>

    <?php 
        if($user == null){
            $order = "6";
        }

        if($user == null): ?>
    <div id="promoContainer" class="d-flex justify-content-between align-items-center px-4 py-2 order-<?=$order?>">
        <p class="mb-0">Have a promo code? Get 3 months of free subscription, and watch anything you want.</p>
        <button type="button" class="ht-yellow-btn">Enter code now!</button>
    </div>
    <?php endif; ?>

    <?php 
        if($user == null)
            $order = "7";
        else
            $order = "5";
    ?>
    <div id="mobileAppContainer" class="row mb-5 px-5 py-5 order-<?=$order?>">
        <img id="mobileDecoration" src="images/phone-frame.png" alt="Decoration" ></img>
        <div id="mobileInfo"class="col-8">
            <h2 class="mb-4">Download our mobile app!</h2>
            <p>Take our content library anywhere with you, by scaning qr code with your phone or going to the play store directly via button below.</p>
            <div class="row">
                <div id="mobileInfoDetails" class="col-6">
                    <p>Benefits of installing mobile app:</p>
                    <ul>
                        <li class="mb-2"><i class="material-icons mr-3 ">play_circle_filled</i><span>7 day Free Trial</span></li>
                        <li class="mb-2"><i class="material-icons mr-3 ">play_circle_filled</i><span>Gain access to all features</span></li>
                        <li class="mb-2"><i class="material-icons mr-3 ">play_circle_filled</i><span>After that you can subscribe for only 4.99$/month</span></li>
                    </ul>
                    <button type="button" class="ht-btn mx-auto py-0" disabled>Go to Play Store</button>
                </div>
            </div>
        </div>
        <div class="col-4"></div>
    </div>

    <?php 
        if($user == null){
            $order = "8";
        }
        if($user == null): ?>
    <div class="contentListContainer mb-5 px-1 order-<?=$order?>">
        <h2 class="mb-4">Best rated Movies by critics</h2>
        <div class="contentListWrapper">
            <div class="contentList d-flex">
            <?php 
                    $movies = getMostPopularContent(1,true);

                    foreach($movies as $m): ?>
                    <div class="contentListItem">
                        <img src="<?=substr($m->file_path,3)?>" alt="Cover">
                        <div class="contentOverlay">
                            <?php 
                                if($user != null){
                                    if($m->user != null)
                                        echo "<i data-id='$m->con_id'class='material-icons favoriteBtn'>favorite</i>";
                                    else
                                        echo "<i data-id='$m->con_id'class='material-icons favoriteBtn'>favorite_border</i>";
                                }
                                    // <i class="material-icons">favorite</i>
                            ?>
                            <div class="contentInfo">
                                <p><?=$m->title?></p>
                                <p><?=$m->rating?> <i class="material-icons ml-1">star</i></p>
                            </div>
                        </div>
                    </div>
                    <?php endforeach;
            ?>
            </div>
            <div class="contentListScroll contentListScrollLeft" data-dir="-1"><i class="material-icons">keyboard_arrow_left</i></div>
            <div class="contentListScroll contentListScrollRight" data-dir="1"><i class="material-icons">keyboard_arrow_right</i></div>
        </div>
    </div>
    <?php endif; ?>

    <!-- authorized -->
    <?php 
        if($user != null and count($movieCategories) > 0){
            $randCat = rand(0, count($movieCategories) - 1);

            $catId = $movieCategories[$randCat]->cat_id;
            $catName = $movieCategories[$randCat]->cat_name;
        }
        
        if($user != null and count($movieCategories) > 0) : ?>
    <div class="contentListContainer mb-5 px-1 order-1">
        <h2 class="mb-4">Best Movies - <?=$catName?></h2>
        <div class="contentListWrapper">
            <div class="contentList d-flex">
                <?php

                    $movies = getContentByCategory(1, $catId);

                    foreach($movies as $m): ?>
                    <div class="contentListItem">
                        <img src="<?=substr($m->file_path,3)?>" alt="Cover">
                        <div class="contentOverlay">
                            <?php 
                                if($user != null){
                                    if($m->user != null)
                                        echo "<i data-id='$m->con_id'class='material-icons favoriteBtn'>favorite</i>";
                                    else
                                        echo "<i data-id='$m->con_id'class='material-icons favoriteBtn'>favorite_border</i>";
                                }
                                    // <i class="material-icons">favorite</i>
                            ?>
                            <div class="contentInfo">
                                <p><?=$m->title?></p>
                                <p><?=$m->rating?> <i class="material-icons ml-1">star</i></p>
                            </div>
                        </div>
                    </div>
                    <?php endforeach;
            ?>
            </div>
            <div class="contentListScroll contentListScrollLeft" data-dir="-1"><i class="material-icons">keyboard_arrow_left</i></div>
            <div class="contentListScroll contentListScrollRight" data-dir="1"><i class="material-icons">keyboard_arrow_right</i></div>
        </div>
    </div>
    <?php endif; ?>

    <?php 
        if($user != null and count($tvShowCategories) > 0) {
            $randCat = rand(0, count($tvShowCategories) - 1);

            $catId = $tvShowCategories[$randCat]->cat_id;
            $catName = $tvShowCategories[$randCat]->cat_name;
        }
        if($user != null and count($tvShowCategories) > 0):
         ?>
    <div class="contentListContainer mb-5 px-1 order-2">
        <h2 class="mb-4">Best TV Shows - <?=$catName?></h2>
        <div class="contentListWrapper">
            <div class="contentList d-flex">
                <?php

                    $tvShows = getContentByCategory(2, $catId);

                    foreach($tvShows as $tS): ?>
                    <div class="contentListItem">
                        <img src="<?=substr($tS->file_path,3)?>" alt="Cover">
                        <div class="contentOverlay">
                            <?php 
                                if($user != null){
                                    if($tS->user != null)
                                        echo "<i data-id='$tS->con_id'class='material-icons favoriteBtn'>favorite</i>";
                                    else
                                        echo "<i data-id='$tS->con_id'class='material-icons favoriteBtn'>favorite_border</i>";
                                }
                                    // <i class="material-icons">favorite</i>
                            ?>
                            <div class="contentInfo">
                                <p><?=$tS->title?></p>
                                <p><?=$tS->rating?> <i class="material-icons ml-1">star</i></p>
                            </div>
                        </div>
                    </div>
                    <?php endforeach;
            ?>
            </div>
            <div class="contentListScroll contentListScrollLeft" data-dir="-1"><i class="material-icons">keyboard_arrow_left</i></div>
            <div class="contentListScroll contentListScrollRight" data-dir="1"><i class="material-icons">keyboard_arrow_right</i></div>
        </div>
    </div>
    <?php endif; ?>
</div>


<?php 
    function getContentByCategory($contentType,$category){
        global $conn;
        global $user;

        $bookmarksJoin = "";
        $bookmarksFilter = "";
        $bookmarksColumn = "";
        if($user != null){
            $bookmarksJoin = "LEFT JOIN (SELECT content_id, user_id FROM user_bookmarks WHERE user_id = :user) AS bookmarks
                                ON bookmarks.content_id = content.id";
            $bookmarksColumn = ",bookmarks.user_id AS user";
        }

        $selectQuery = "SELECT content.id AS con_id, title, rating, file_path $bookmarksColumn FROM content
                        INNER JOIN content_categories AS con_cat ON con_cat.content_id=content.id
                        INNER JOIN content_images AS con_img ON con_img.content_id = content.id 
                        $bookmarksJoin
                        WHERE content_types_id=:contentType AND isCover=1 AND con_cat.category_id=:category
                        LIMIT 25 OFFSET 0;";
        
        $stm = $conn->prepare($selectQuery);
        $stm->bindParam(":contentType", $contentType);
        $stm->bindParam(":category", $category);
        if($user != null)
            $stm->bindParam(":user", $user->id);

        $stm->execute();
        
        return $stm->fetchAll();
    }
    function getAvailableContentCategories($contentType){
        global $conn;

        $selectQuery = "SELECT DISTINCT category_id AS cat_id, categories.name AS cat_name FROM content_categories
                        INNER JOIN content ON content.id = content_categories.content_id
                        INNER JOIN categories ON categories.id=content_categories.category_id
                        WHERE content_types_id = :contentType;";
        $stm = $conn->prepare($selectQuery);
        $stm->bindParam(":contentType", $contentType);
        $stm->execute();
        
        return $stm->fetchAll();
        }
    function getContentByResolution($contentType, $resolution){
 
        global $user;
        global $conn;

        $bookmarksJoin = "";
        $bookmarksFilter = "";
        $bookmarksColumn = "";

        if($user != null){
            $bookmarksJoin = "LEFT JOIN (SELECT content_id, user_id FROM user_bookmarks WHERE user_id = :user) AS bookmarks
                                ON bookmarks.content_id = content.id";
            $bookmarksColumn = ",bookmarks.user_id AS user";
        }

        $selectQuery = "SELECT content.id AS con_id, title, rating, file_path $bookmarksColumn FROM content
                        INNER JOIN content_resolutions AS con_res ON con_res.content_id = content.id
                        INNER JOIN content_images AS con_img ON con_img.content_id = content.id
                        $bookmarksJoin
                        WHERE content_types_id=:contentType AND isCover=1 AND con_res.resolution_id=:resolution
                        LIMIT 25 OFFSET 0;";

        $stm = $conn->prepare($selectQuery);
        $stm->bindParam(":contentType",$contentType);
        $stm->bindParam(":resolution",$resolution);
        if($user != null)
            $stm->bindParam(":user", $user->id);
        
        $stm->execute();

        return $stm->fetchAll();
    }
    function getMostPopularContent($contentType, $byCritics){
        // die("blabla");

        // if(isset($_GET["contentType"])){
        //     http_response_code(400);
        //     die("Incomplete input data.");
        // }

        // $contentType = $_GET["contentType"];

        global $conn;
        global $user;

        if($byCritics)
            $orderCrit = "metascore";
        else
            $orderCrit = "rating";
        
        
        $bookmarksJoin = "";
        $bookmarksFilter = "";
        $bookmarksColumn = "";
        if($user != null){
            $bookmarksJoin = "LEFT JOIN (SELECT content_id, user_id FROM user_bookmarks WHERE user_id = :user) AS bookmarks
                                ON bookmarks.content_id = content.id";
            $bookmarksColumn = ", bookmarks.user_id AS user";
        }

        $selectQuery = "SELECT content.id AS con_id, title, rating, file_path $bookmarksColumn FROM content
                        INNER JOIN content_images AS con_img ON con_img.content_id = content.id
                        $bookmarksJoin
                        WHERE content_types_id=:contentType AND isCover=1
                        ORDER BY $orderCrit DESC
                        LIMIT 25 OFFSET 0;";

        $stm = $conn->prepare($selectQuery);
        $stm->bindParam(":contentType",$contentType);

        if($user != null)
            $stm->bindParam(":user", $user->id);

        $stm->execute();

        return $stm->fetchAll();

        // header("Content-Type: application/json");
        // echo json_encode($result);

        }
?>