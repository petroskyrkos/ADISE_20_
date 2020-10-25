<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>

    <header id="container">
        <nav>
            <a href="index.php">
                <img src="https://upload.wikimedia.org/wikipedia/commons/3/32/Tic_tac_toe.svg" alt="Logo">
            </a>
            <ul>
                <li> <a href="index.php">Home</a> </li>
                <li> <a href="history.php">History</a> </li>
                <li> <a href="contact.php">Contact</a> </li>
            </ul>
            <div>
                <?php
                if (isset($_SESSION['userId'])) {
                    echo '<form action="includes/logout.inc.php" method="post" >
                    <button class="btn btn-outline-success" type="submit" name="logout-submit" id="logout">Logout</button>
                </form>';
                } else {
                    echo '<form id="loginForm" action="includes/login.inc.php" method="post">
                    <input type="text" name="mailuid" placeholder="Username/E-mail">
                    <input type="password" name="pwd" placeholder="Password">
                    <form class="form-inline">
                    <button class="btn btn-outline-success" type="submit" name="login-submit">Login</button>
                </form>
                <a href="signup.php" id="signup">Signup</a>';
                }
                ?>
            </div>
        </nav>
    </header>
