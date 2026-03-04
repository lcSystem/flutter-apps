<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');

require 'db_connection.php';

$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['habit_logs']) && is_array($data['habit_logs'])) {
    foreach ($data['habit_logs'] as $log) {
        if (
            isset($log['habit_id']) &&
            isset($log['completed_at']) &&
            isset($log['xp_earned'])
        ) {
            $habit_id = $log['habit_id'];
            $completed_at = $log['completed_at'];
            $xp_earned = $log['xp_earned'];

            $stmt = $conn->prepare("INSERT INTO habit_logs (habit_id, completed_at, xp_earned) VALUES (?, ?, ?)");
            $stmt->bind_param("isi", $habit_id, $completed_at, $xp_earned);

            if ($stmt->execute()) {
                $updateXpStmt = $conn->prepare("UPDATE users SET xp = xp + ? WHERE id = (SELECT user_id FROM habits WHERE id = ?)");
                $updateXpStmt->bind_param("ii", $xp_earned, $habit_id);
                $updateXpStmt->execute();
                $updateXpStmt->close();
            }

            $stmt->close();
        }
    }

    echo json_encode(["success" => true, "message" => "Data synchronized successfully."]);
} else {
    echo json_encode(["success" => false, "message" => "Invalid input."]);
}

$conn->close();
?>