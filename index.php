<?php
require "about.php";

?>

<main>
  <div id="container">
    <?php
    if (isset($_SESSION['userId'])) {
        echo '<p id="loggedIn">You are logged in! </p>';
        header("Location: game.php");
    } else {
        echo '<p id="loggedOut">You are logged out! </p>';
    }
    ?>
</div>
</main>
