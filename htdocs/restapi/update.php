<?php
header('Content-Type: application/json');
include('db.php');
if (!isset($_POST['id']) && !isset($_POST['title']) && !isset($_POST['content'])) {
	echo json_encode("No Data Sent");
} else {
	$id = $_POST['id'];
	$title = $_POST['title'];
	$content = $_POST['content'];
	$result = mysqli_query($db, "UPDATE blog SET title = '{$title}', content = '{$content}' WHERE id ={$id}");
	if ($result) {
		echo json_encode("Success");
	} else {
		echo json_encode("Failed");
	}
}
