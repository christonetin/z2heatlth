<?php 

$servername = "localhost";
$username = "root";
$password = "";
$db = "z2hhealthcare";


/*$servername = "localhost";
$username = "u897136063_uaththanoortex";
$password = "Aththanoortex@123";
$db = "u897136063_aththanoortex";*/

$con = mysqli_connect($servername, $username, $password,$db);


if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
$today = new DateTime("now", new DateTimeZone('Asia/Kolkata') );
$date=$today->format('d-m-Y'); 
$time=$today->format('H:i:s');
$dt=$today->format('Y-m-d H:i:s');
$row_admin=mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM admin"));
define("company_name", "Kanchipuram S.M.Silks");
define("domain","blackystar.in");
define("email_id", "blackystar.in@gmail.com");
define("user_name", "BS".rand(11111,99999).mysqli_num_rows(mysqli_query($con,"SELECT * FROM reg")));
define("primary_id","BS123123");
define("url", "https://".domain);
define("mobile", "");
define("full_company_name", "blackystar.in");
define("address", "");
define("logo", "assets/logo.jpg");
define("fevicon", "assets/fevi.jpg");
define("currency", "&#8377;");
define("bgColor", "green");
define("primaryColor", "#ae1c9a");
define("fontWhiteColor", "white");
define("url_image", "../images/");
define("plan_amount", 5000);
define("ref_income", 250);
define("binary_income", 500);


?>

