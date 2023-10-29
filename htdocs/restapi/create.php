<?php
header('Content-Type: application/json');
include('db.php');
if (!isset($_POST['title']) && !isset($_POST['content'])) {
	echo json_encode("No Data Sent");
} else {
	$title = $_POST['title'];
	$content = $_POST['content'];
	$result = mysqli_query($db, "INSERT INTO blog (title, content) VALUES ('{$title}','{$content}')");
	if ($result) {
		echo json_encode("Success");
	} else {
		echo json_encode("Failed");
	}
}
