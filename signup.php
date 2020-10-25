<?php
    require "header.php";
?>

<main>
    <h1 class="signupHeader">Signup</h1>
    <?php
        if (isset($_GET['error'])) {
            if ($_GET['error'] == "emptyfields") {
                echo '<p> Fill in all fields!</p>';
            }
            elseif ($_GET['error'] == "invalidduimail") {
                echo '<p> Invalid username and e-mail!</p>';
            }
            elseif ($_GET['error'] == "invaliduid") {
                echo '<p> Invalid username!</p>';
            }
            elseif ($_GET['error'] == "invalidmail") {
                echo '<p> Invalid e-mail!</p>';
            }
            elseif ($_GET['error'] == "passwordcheck") {
                echo '<p> Your passwords do not match!</p>';
            }
            elseif ($_GET['error'] == "usertaken") {
                echo '<p> Username is already taken!</p>';
            }
        }
        elseif ($_GET['signup'] == "success") {
            echo '<p>Signup successful!</p>';
        }
    ?>
    <form action="includes/signup.inc.php" method="post" id="signupForm">
        <input type="text" name="uid" placeholder="Username">
        <input type="text" name="mail" placeholder="E-mail">
        <input type="password" name="pwd" placeholder="Password">
        <input type="password" name="pwd-repeat" placeholder="Repeat Password">
        <button class="btn btn-outline-success" type="submit" name="signup-submit">Signup</button>
    </form>

    <a href="reset-password.php"> Forgot your Password? </a>
</main>

<?php
    require "footer.php";
?>
