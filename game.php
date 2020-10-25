<?php
require "header.php";
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    
    <title>Tic Tac Toe</title>
  </head>
  <body>
    <form class="" action="game.php" method="post" id="table">
      <?php
      $error = false;
      $x_winns = false;
      $o_winns = false;
      $count = 0;
      for ($id=1; $id<=9 ; $id++) {
        if ($id == 4 or $id == 7)print "<br>";
           print "<input name = $id type = text size =8";
           if (isset($_POST['submit']) and !empty($_POST[$id])) {
             if ($_POST[$id] == "x" or $_POST[$id] == "o") {
               $count +=1;
               print " value = ".$_POST[$id].">";
               for ($a=1 , $b=2, $c=3; $a<=7 , $b<=8 , $c<=9; $a+=3, $b+=3 , $c+=3) {
                 if ($_POST["$a"] == $_POST["$b"] and $_POST[$b] == $_POST[$c]) {
                   if ($_POST["$a"] == "x") {
                     $x_winns = true;
                   }
                   elseif ($_POST["$a"] == "o") {
                     $o_winns = true;
                   }
                 }
               }
               for ($a=1 , $b=4, $c=7; $a<=3 , $b<=6 , $c<=9; $a+=1, $b+=1 , $c+=1 ) {
                 if ($_POST["$a"] == $_POST["$b"] and $_POST[$b] == $_POST[$c]) {
                   if ($_POST["$a"] == "x") {
                     $x_winns = true;
                   }
                   elseif ($_POST["$a"] == "o") {
                     $o_winns = true;
                   }
                 }
               }
               for ($a=1 , $b=5, $c=9; $a<=3 , $b<=5 , $c>=7; $a+=2, $b+=0 , $c-=2 ) {
                 if ($_POST["$a"] == $_POST["$b"] and $_POST[$b] == $_POST[$c]) {
                   if ($_POST["$a"] == "x") {
                     $x_winns = true;
                   }
                   elseif ($_POST["$a"] == "o") {
                     $o_winns = true;
                   }
                 }
               }
             }
             else {
               print ">";
               $error = true;
             }
           }
           else {
             print ">";
           }

      }
        ?>
        <p> <input type="submit" name="submit" value="submit" id="submit"> </p>
    </form>
    <?php
    if ($o_winns) {
      echo '<p class="status">player o winns</p>';
    }
    elseif ($error) {
      echo '<p class="status">Please enter x or o</p>';
    }
    elseif($x_winns) {
      echo '<p class="status">player x winns</p>';
    }
    elseif ($count == 9 and !$o_winns and !$x_winns ) {
      echo '<p class="status">Draw</p>';
    }
    else {
      echo '<p class="status">Please enter x or o</p>';
    }
     ?>
  </body>
</html>

<?php
require "footer.php";
?>
