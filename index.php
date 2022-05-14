<?php
session_start();
?>

<html>
  <head>
    <title> Home | THE Cafe' </title>
  </head>

 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" type = "text/css" href ="css/index.css">

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top navigation-clean-search" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="index.php">THE Cafe'</a>
        </div>

        <div class="collapse navbar-collapse " id="myNavbar">
          <ul class="nav navbar-nav">
            <li class="active" ><a href="index.php">Home</a></li>
          </ul>

<?php
if (isset($_SESSION['login_user2'])) {
  ?>
           <ul class="nav navbar-nav navbar-right">
            <li><a href="#"> Welcome <?php echo $_SESSION['login_user2']; ?> </a></li>
            <li><a href="foodlist.php"> Food Zone </a></li>
            <li><a href="cart.php">Cart
              (<?php
              if(isset($_SESSION["cart"])){
              $count = count($_SESSION["cart"]); 
              echo "$count"; 
            }
              else
                echo "0";
              ?>)
             </a></li>
            <li><a href="logout.php">Log Out </a></li>
          </ul>
  <?php        
}
else {
?>
        <ul class="nav navbar-nav navbar-right">
          <li> <a href="customersignup.php"> User Sign-up</a></li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
          <li> <a href="customerlogin.php"> User Login</a></li>
        </ul>
<?php
}
?>
       </div>

      </div>
    </nav>

    <div class="container-fluid">
  <img src="images/cappuccino.jpg"  style="width:100%; height: 600px">
  <div class="centered">     	
    <div class="col-xs-5 line"><hr></div>
        <div class="col-xs-5 line"><hr></div>
        <div class="tagline">Good Coffee is Good Mood</div></div>
</div>
</body>
</html>

<?php

if (isset($_POST['submit'])) {
if (empty($_POST['username']) || empty($_POST['password'])) {
$error = "Username or Password is invalid";
}
else
{
// Define $username and $password
$username=$_POST['username'];
$password=$_POST['password'];
// Establishing Connection with Server by passing server_name, user_id and password as a parameter
require 'connection.php';
$conn = Connect();

// SQL query to fetch information of registerd users and finds user match.
$query = "SELECT username, password FROM CUSTOMER WHERE username=? AND password=? LIMIT 1";

// To protect MySQL injection for Security purpose
$stmt = $conn->prepare($query);
$stmt -> bind_param("ss", $username, $password);
$stmt -> execute();
$stmt -> bind_result($username, $password);
$stmt -> store_result();

if ($stmt->fetch())  
{
	$_SESSION['login_user2']=$username; // Initializing Session
	header("location: #.php"); // Redirecting To Other Page
} else {
$error = "Username or Password is invalid";
}

}
}
?>