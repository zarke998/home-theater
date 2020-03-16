<?php

    if(session_status() != PHP_SESSION_ACTIVE){
        session_start();

        if(isset($_SESSION["user"]))
            $user = $_SESSION["user"];
        else
            $user = null;
    }
    else
        $user = null;
    
    $root = $_SERVER["DOCUMENT_ROOT"];
    $root .= "/home-theater";
    require_once "$root/logic/dbConnection.php";

    if(!(isset($_GET["offset"]) and isset($_GET["contentType"])) and isset($_GET["search"])){
        http_response_code(400);
        die("Incomplete input data");
    }

    $offset = $_GET["offset"];
    $contentType = $_GET["contentType"];
    $search = $_GET["search"];

    $search = trim($search);


    $searchQuery = "";
    if($search != ""){
        $searchQuery = "AND INSTR(title,:search) > 0 ";
    }
    $offset = intval($offset);

    
    if(isset($_GET["limit"]))
        $limit = intval($_GET["limit"]);
    else
        $limit = 8;

    if(isset($_GET["category"]) and ($_GET["category"] != "0")){
        $category = intval($_GET["category"]);
        $categoryJoin = "INNER JOIN content_categories AS con_cat ON con_cat.content_id = content.id";
        $categoryFilter = "AND con_cat.category_id = :category";
    }
    else{
        $categoryJoin = "";
        $categoryFilter = "";
    }

    if(isset($_GET["sort"])){
        $sort = $_GET["sort"];
        $sortCrit = "";
        switch($sort){
            case 1:
                $sortCrit = "ORDER BY title ASC";
                break;
            case 2:
                $sortCrit = "ORDER BY title DESC";
                break;       
            case 3:
                $sortCrit = "ORDER BY rating DESC";
                break;       
            case 4:
                $sortCrit = "ORDER BY year_released ASC";
                break;       
            case 5:
                $sortCrit = "ORDER BY year_released DESC";
                break;  
            default:
                $sortCrit = "ORDER BY year_released DESC";
                break;
        }
    }
    else
        $sortCrit = "";
    

    $bookmarksJoin = "";
    $bookmarksFilter = "";
    $bookmarksColumn = "";
    if($user != null){
        $bookmarksJoin = "LEFT JOIN (SELECT content_id, user_id FROM user_bookmarks WHERE user_id = :user) AS bookmarks
        ON bookmarks.content_id = content.id";
        $bookmarksColumn = ",bookmarks.user_id AS user";
    }

    $getContentQuery = "SELECT content.id, title, year_released, runtime,rating, metascore, file_path $bookmarksColumn FROM content
    INNER JOIN content_images AS images ON content.id = images.content_id 
    $categoryJoin
    $bookmarksJoin
    WHERE images.isCover = 1 AND content.content_types_id = :c_type $searchQuery $categoryFilter
    $sortCrit
    LIMIT :limit OFFSET :offset;";


    $contentStm = $conn->prepare($getContentQuery);
    $contentStm->bindParam(":offset",$offset,PDO::PARAM_INT);
    $contentStm->bindParam(":c_type",$contentType);
    $contentStm->bindParam(":limit",$limit, PDO::PARAM_INT);
    
    if($search != ""){
        $contentStm->bindParam(":search", $search);
    }
    if(isset($_GET["category"]) and $_GET["category"] != "0"){
        $contentStm->bindParam(":category",$category);
    }
    if($user != null)
        $contentStm->bindParam(":user", $user->id);
    
    $query = $contentStm->queryString;
    $contentStm->execute();

    // $rows = $contentStm->rowCount();
    // die("$rows");
    $contentList = $contentStm->fetchAll();

    header("Content-Type: application/json");
    echo json_encode($contentList);


//     SELECT content.id, title, year_released, runtime,rating, metascore, file_path, bookmarks.user_id AS user FROM content 
// INNER JOIN content_images AS images ON content.id = images.content_id 
// INNER JOIN content_categories AS con_cat ON con_cat.content_id = content.id
// LEFT JOIN user_bookmarks AS bookmarks ON bookmarks.content_id = content.id
// WHERE images.isCover = 1 AND content.content_types_id = 1 AND con_cat.category_id = 1 
// LIMIT 24 OFFSET 0

?>