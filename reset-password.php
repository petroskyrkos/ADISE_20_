<?php
require "header.php";
?>

<main>
    <h1>Reset your passoword</h1>
    <p>An e-mail wiil be send to you with instructions on hot to reset yout password.</p>
    <form action="includes/reset-request.inc.php" method="post">
        <input type="text" name="email" placeholder="Enter your e-mail address...">
        <button type="submit" name="reset-request-submit">Receive new password by e-mail.</button>
    </form>
    <?php
        if (isset($_GET["reset"])) {
          if ($_GET["reset"] == success) {
            echo '<p>Check your E-mail!</p>';
          }
        }
     ?>
</main>

<?php
require "footer.php";
?>
