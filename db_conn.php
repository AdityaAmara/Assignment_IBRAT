<?php

$servername = "127.0.0.1:3308";
$dBUsername = "root";
$dBPassword = "";
$dBName = "assignment";

$conn = mysqli_connect($servername, $dBUsername, $dBPassword, $dBName);

if(!$conn)
{
  die("Connection failed: ".mysqli_connect_error());
}
