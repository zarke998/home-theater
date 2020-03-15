<?php 
    $rootPath = $_SERVER["DOCUMENT_ROOT"];
    $rootPath.= "/home-theater";
    require_once "$rootPath/logic/dbConnection.php";
    function getMenuItems($menuName){
        
        global $conn;
        $selectQuery = "SELECT menu_items.name AS item_name, href, role_id FROM menu_items
                                INNER JOIN menus ON menus.id = menu_items.menu_id
                                WHERE menus.name = :menu;";
        $stm = $conn->prepare($selectQuery);
        $stm->bindParam(":menu",$menuName);
        $stm->execute();

        return $stm->fetchAll();
    }
?>