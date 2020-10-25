<?php

// $servername = "users.iee.ihu.gr";
// $dBUsername = "root";
// $dBPassrword = "123";
// $dBName = "tic_tac_toe_db";


$user='root';
$pass='123';
$host='';
$db = 'tic_tac_toe_db';


 // $conn = mysqli_connect($servername, $dBUsername, $dBPassrword, $dBName);
$conn = mysqli_connect($host, $user, $pass, $db,null,'/home/student/it/2016/it164692/mysql/run/mysql.sock');

if (!$conn) {
  die("Connection Failed: " . mysqli_connect_error());
}
