<?php
$host = "localhost";
$username = "root"; 
$password = ""; 
$database = "naklocal"; 

$connection = new mysqli($host, $username, $password, $database);

// Check connection
if ($connection->connect_error) {
    die(json_encode(["status" => "error", "message" => "Connection failed: " . $connection->connect_error]));
}
?>
