<?php
session_start();
unset($_SESSION['admin_ssj']);
header("location:login.php?mes=You Are Logout.");
die();
?>
