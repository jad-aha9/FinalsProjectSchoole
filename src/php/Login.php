<?php
// Database connection settings
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hotelbooking";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize input data to prevent SQL injection
    $nome = $conn->real_escape_string($_POST['nome']);
    $prenom = $conn->real_escape_string($_POST['prenom']);
    $email = $conn->real_escape_string($_POST['email']);
    $phone_number = $conn->real_escape_string($_POST['number']);
    $password = password_hash($conn->real_escape_string($_POST['modeDePass']), PASSWORD_BCRYPT);

    // Insert data into database
    $sql = "INSERT INTO users (nome, prenom, email, number, modeDePass) VALUES ('$nome', '$prenom', '$email', '$phone_number', '$password')";

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();

?>
