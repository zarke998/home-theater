<?php 
    $rootPath = $_SERVER["DOCUMENT_ROOT"];
    $rootPath.= "/home-theater";
    require "$rootPath/logic/dbConnection.php";

    $selectQuery = "SELECT content.id AS con_id,title,description, file_path FROM content
                    INNER JOIN content_images AS con_img ON con_img.content_id=content.id
                    WHERE con_img.isCover = 1 AND description IS NOT NULL 
                        AND content.id IN (SELECT content_id FROM content_images WHERE isThumbnail = 0 AND isCover = 0)
                    ORDER BY year_released DESC
                    LIMIT 10 OFFSET 0;";
    $selectStm = $conn->query($selectQuery);

    $result = $selectStm->fetchAll();

    $contents = [];
    foreach($result as $r){
        $contentItem = [];
        $contentItem["info"] = $r;
        $wallpapers = [];


        $selectWallpapersQuery = "SELECT file_path FROM content_images
                                    WHERE content_id=:contentId AND isThumbnail = 0 AND isCover = 0;";
        $wallStm = $conn->prepare($selectWallpapersQuery);
        $wallStm->bindParam(":contentId", $r->con_id);

        $wallStm->execute();

        $wallData = $wallStm->fetchAll();
        
        foreach($wallData as $w)
            $wallpapers[] = $w->file_path;
        
        $contentItem["wallpapers"] = $wallpapers;
        
        $contents[] = $contentItem;
    }

    header("Content-Type: application/json");
    echo json_encode($contents);
?>