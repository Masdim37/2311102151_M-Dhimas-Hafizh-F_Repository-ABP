<?php
    session_start();
    $message = "";

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isset($_SESSION["username"]) && $_POST["usn_input"] == $_SESSION["username"]) {
            $message = "Welcome " . $_SESSION["username"];
        } else {
            $message = "Wrong username or password!";
        }
    }
?>