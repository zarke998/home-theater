<?php 
    
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    $rootPath = $_SERVER["DOCUMENT_ROOT"];    
    require_once "$rootPath/logic/menuFetcher.php";

    if(isset($_SESSION["user"]))
        $user = $_SESSION["user"];
    else
        $user = null;

?>
<body>

    <nav class="navbar navbar-expand-md navbar-light bg-light fixed-top py-0 navigationContainer">
        <button class="navbar-toggler navigationBtn" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="material-icons">menu</span>
        </button>
        <a class="navbar-brand d-md-none mx-auto websiteTitle" href="/index.php">HomeTheater</a>
        <div class="account">
            <div>
                <i id="accountBtn" class="material-icons medium">account_circle</i>
                <?php 
                    if($user != null): ?>
                <div class="accountPanel">
                    <div class="d-flex align-items-center accountInfo">
                        <i class="material-icons d-block">account_circle</i><span class="d-block ml-2 mb-1"><?php 
                            echo explode("@",$user->email)[0];
                        ?> </span>
                    </div>
                    <ul class="accountLinks text-center mb-0">
                        <!-- <li><a href="#">Bookmark list</a></li> -->
                        <?php
                            $items = getMenuItems("authorized_acc_menu");
                            if($user->role_id == 1){
                                foreach($items as $i) {
                                    echo "<li><a href='$i->href'>$i->item_name</a></li>";
                                }
                            }
                            else{
                                foreach($items as $i) {
                                    if($i->role_id == $user->role_id){
                                        echo "<li><a href='$i->href'>$i->item_name</a></li>";
                                    }
                                }
                            }
                        
                            
                        ?>
                        <li class="border-top mt-2 pt-2">
                            <form action="/logout.php" method="GET">
                                <button type="submit" name="logoutBtn" value="on" id="logoutBtn" href="#">Logout</button>
                            </form>
                        </li>
                    </ul>
                </div>

                <?php else: ?>
                <div class="accountPanel">
                    <div class="d-flex align-items-center accountInfo">
                        <i class="material-icons d-block">account_circle</i><span class="d-block ml-2 mb-1"> Account </span>
                    </div>
                    <ul class="accountLinks text-center mb-0">
                        <li><a href="login.php">Login</a></li>
                        <li><a href="register.php">Register</a></li>
                    </ul>
                </div>

                <?php endif;?>
            </div>
        </div>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav mx-auto my-0 navigationMenu">
                <!-- <li class="nav-item">
                    <a class="nav-link" href="#">TV Shows</a>
                </li>
                <li class="nav-item d-none d-md-inline websiteTitle">
                    <a class="nav-link" href="#">HomeTheater</a>
                </li> -->
                <?php
                    $rootPath = $_SERVER["DOCUMENT_ROOT"];
                    require_once "$rootPath/logic/menuFetcher.php";

                    $items = getMenuItems("nav_menu");
                    for($i = 0; $i < (int)count($items)/2; $i++): ?>
                        <li class="nav-item">
                        <a class="nav-link" href="<?=$items[$i]->href?>"><?=$items[$i]->item_name?></a>
                    </li>
                    <?php endfor;
                    
            
                    echo '<li class="nav-item d-none d-md-inline websiteTitle">
                            <a class="nav-link" href="/index.php">HomeTheater</a>
                        </li>';
                    
                    for($i = count($items)/2; $i < count($items); $i++): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?=$items[$i]->href?>"><?=$items[$i]->item_name?></a>
                        </li>
                    <?php endfor;
                ?>
                
            </ul>
        </div>
    </nav>

    <div class="intro<?php if(isset($isIntroSmaller) && $isIntroSmaller) echo " smallerIntro"; ?>">
        <?php 
            if(isset($headerText)){
                echo "<h1>$headerText</h1>";
            }
        ?>
    </div>