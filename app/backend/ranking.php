<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');

require 'db_connection.php';

$result = $conn->query("SELECT username, xp FROM users ORDER BY xp DESC");

$ranking = [];
while ($row = $result->fetch_assoc()) {
    $ranking[] = $row;
}

echo json_encode(["success" => true, "ranking" => $ranking]);

$conn->close();
?>