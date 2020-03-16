    <div id="footer" class="container-fluid px-5 pt-4">
        <div class="row">
            <div class="col-9">
                <div class="row footerList">
                    <div class="col-3">
                        <h3>General</h3>
                        <ul>
                        <?php 
                            $rootPath = $_SERVER["DOCUMENT_ROOT"];
                            $rootPath.= "/home-theater";
                            require_once "$rootPath/logic/menuFetcher.php";

                            $items = getMenuItems("nav_menu");
                            
                            for($i = 0; $i < count($items); $i++): ?>
                            <li>
                                <a href="<?=$items[$i]->href?>"><?=$items[$i]->item_name?></a>
                            </li>
                            <?php endfor;
                        ?>
                        </ul>
                    </div>
                    <div class="col-3">
                        <h3>Socials</h3>
                        <ul>
                        <?php 
                            $rootPath = $_SERVER["DOCUMENT_ROOT"];
                            $rootPath.= "/home-theater";
                            require_once "$rootPath/logic/menuFetcher.php";

                            $items = getMenuItems("socials_menu");
                            
                            for($i = 0; $i < count($items); $i++): ?>
                            <li>
                                <a href="<?=$items[$i]->href?>"><?=$items[$i]->item_name?></a>
                            </li>
                            <?php endfor;
                        ?>
                        </ul>
                    </div>
                    <div class="col-3">
                        <h3>Legal</h3>
                        <ul>
                        <?php 
                            $rootPath = $_SERVER["DOCUMENT_ROOT"];
                            $rootPath.= "/home-theater";
                            require_once "$rootPath/logic/menuFetcher.php";

                            $items = getMenuItems("legal_menu");
                            
                            for($i = 0; $i < count($items); $i++): ?>
                            <li>
                                <a href="<?=$items[$i]->href?>"><?=$items[$i]->item_name?></a>
                            </li>
                            <?php endfor;
                        ?>
                        </ul>
                    </div><div class="col-3">
                        <h3>Account</h3>
                        <ul>
                        <?php 
                            $rootPath = $_SERVER["DOCUMENT_ROOT"];
                            $rootPath.= "/home-theater";
                            require_once "$rootPath/logic/menuFetcher.php";

                            $items = getMenuItems("account_footer_menu");
                            
                            for($i = 0; $i < count($items); $i++): ?>
                            <li>
                                <a href="<?=$items[$i]->href?>"><?=$items[$i]->item_name?></a>
                            </li>
                            <?php endfor;
                        ?>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-3 newsletterContainer">
                <h3>Subscribe to our newsletter</h3>
                <form class="mt-4 pt-2">
                    <div class="input-group input-group-sm border-0 newsletterForm">
                        <input type="email" class="form-control border-0 rounded-0" id="loginEmail" aria-describedby="emailHelp" placeholder="Enter email">
                        <div class="input-group-append">
                            <i class="input-group-text material-icons sendIcon">send</i>
                         </div>
                        <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                    </div>
                </form>
            </div>
        </div>
        <p id="copyright" class="text-center mb-2">Copyright &copy; | HomeTheater <?php echo date("Y")?>. All rights reserved.</p>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/home-theater/js/jquery.nicescroll.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <?php 
        if(isset($scripts))
        {
            foreach($scripts as $s): ?>
                <script src="/home-theater/js/<?=$s?>"></script>
            <?php endforeach;
        }
        if(isset($alertMsg)): ?>
            <script type="text/javascript">
                window.onload = function(){
                    alert("<?=$alertMsg?>"); 
                }
            </script>
        <?php endif;
    ?>
</body>

</html>