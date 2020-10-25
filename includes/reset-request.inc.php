<?php

if (isset($_POST["reset-request-submit"])) {

    $selector = bin2hex(random_bytes(8));
    $token = random_bytes(32);

    $url = "http://localhost/PhP_Lessons/PHP-Projects-Plug-Ins/create-new-password.php?selector" . $selector . "$validator" . bin2hex($token);

    $expires = date("U") + 1800;

    include 'dbh.inc.php';

    $userEmail = $_POST["email"];

    $sql = "DELETE FROM pwdReset WHERE pwdResetEmail=?";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_smt_prepare($stmt, $sql)) {
        echo "There was an error!";
        exit();
    } else {
        mysqli_stmt_bind_param($stmt, "s", $userEmail);
        mysq_stmt_execute($stmt);
    }

    $sql = "INSERT INTO pwdReset (pwdResetEmail, pwdResetSelector, pwdResetToken, pwdResetExrires) VALUES(?, ?, ?, ?);";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_smt_prepare($stmt, $sql)) {
        echo "There was an error!";
        exit();
    } else {
        $hashedToken = password_hash($token, PASSWORD_DEFAULT);
        mysqli_stmt_bind_param($stmt, "ssss", $userEmail, $selector, $hashedToken, $expires);
        mysq_stmt_execute($stmt);
    }

    mysqli_stm_close($stmt);
    mysqli_close();

    $to = $userEmail;

    $subject = "Reset your password!";

    $message = '<p>We recieved a password reset request. The link to reset your password make this request, you can igonre this email.</p>';
    $message .= '<p>Here is yout password reset link: </br>';
    $message .= '<a href="' . $url . '">' . $url . '</a> </p>';

    $headers = "From : <giaxaibis.petros@gmail.com>\r\n";
    $headers .= "Reply-To: giaxaibis.petros@gmail.com\r\n";
    $headers .= "Content-type: text/html\r\n";

    mail($to, $subject, $message, $headers);
    header("Location: ../reset-password.php?reset=success");
} else {
    header("Location: ../index.php");
}
