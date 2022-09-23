<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');

include("connection.php");

$query = $mysqli->prepare("SELECT * FROM newsArticles");
$query->execute();
$array = $query->get_result();

$response = [];

while ($a = $array->fetch_assoc()) {
    $response[] = $a;
}

$json = json_encode($response);
echo $json;
