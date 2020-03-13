<div id="registerContainer" class="container-fluid ht-px-7 py-5 position-relative">
    <div class="row">
        <div class="col-md-6">
            <h2>Register</h2>
            <form class="mt-4 pt-2">
                <div class="form-group border-0">
                    <input type="email" class="form-control border-0 rounded-0" id="registerEmail" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control border-0 rounded-0" id="registerPassword" placeholder="Password">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control border-0 rounded-0" id="registerConfirmPassword" placeholder="Confirm password">
                </div>
                <div id="registerFeedback" class="invalid-feedback d-none mb-2"></div>
                <div>
                    <p>Subscription plan:</p>
                    <div id="subscriptionRadios" class="d-flex justify-content-between">
                    <?php
                        $rootPath = $_SERVER["DOCUMENT_ROOT"];
                        $rootPath.= "/home-theater";
                        require_once "$rootPath/logic/dbConnection.php";

                        $subscriptionQuery = "SELECT id, name, price FROM subscription_types;";

                        $subStm = $conn->query($subscriptionQuery);

                        $subscriptions = $subStm->fetchAll();

                        for($i = 0; $i < count($subscriptions); $i++): ?>
                            <div class="custom-control custom-radio">
                                <input type="radio" id="customRadio<?=$i?>" name="subscription" value="<?=$subscriptions[$i]->id?>" class="custom-control-input">
                                <label class="custom-control-label" for="customRadio<?=$i?>">
                                    <?php 
                                        echo $subscriptions[$i]->name;

                                        if($subscriptions[$i]->price > 0){
                                            $price = $subscriptions[$i]->price;
                                            $price = " - $price$";
                                        }
                                        else
                                            $price = "";

                                        echo $price;
                                    ?>
                                </label>
                            </div>
                        <?php endfor; ?>
                    </div>
                </div>
                <button id="registerBtn" type="button" class="d-block mx-auto w-25 mt-4 ht-btn">Register</button>
            </form>
        </div>
    </div>
    <img id="registerDecoration" src="images/black-widow.png" alt="Decoration image"/>
</div>