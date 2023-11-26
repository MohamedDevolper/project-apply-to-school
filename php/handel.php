<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_school_information";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// taking the form variables
$studentName = $_POST['studentName'];
$studentGender = $_POST['studentGender'];
$studentGuardianNumber = $_POST['studentGuardianNumber'];
$studentGrada = $_POST['studentGrada'];
$studentDate = $_POST['studentDate'];
$email = $_POST['email'];

// create query
$sql = "INSERT INTO new_student VALUES
('$studentName', '$studentGender', '$studentGuardianNumber', '$studentGrada', '$studentDate', '$email')";

if ($conn->query($sql) === TRUE) {
    echo "<h3>Data stored in the database successfully.</h3>";
} else {
    echo "ERROR: Hush! Sorry $sql. " . $conn->error;
}

// Close connection
$conn->close();

?>
