<body>

    <nav class="navbar navbar-expand-md navbar-light bg-light fixed-top py-0 navigationContainer">
        <button class="navbar-toggler navigationBtn" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="material-icons">menu</span>
        </button>
        <a class="navbar-brand d-md-none mx-auto websiteTitle" href="#">HomeTheater</a>
        <div class="account">
            <i class="material-icons medium">account_circle</i>
        </div>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav mx-auto my-0 navigationMenu">
                <li class="nav-item">
                    <a class="nav-link" href="#">Movies</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">TV Shows</a>
                </li>
                <li class="nav-item d-none d-md-inline websiteTitle">
                    <a class="nav-link" href="#">HomeTheater</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
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