<?php
    session_start();
    $message = "";

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $username = $_POST["usn_input"];
        $password = $_POST["psw_input"];
        $_SESSION["username"] = $username;
        $message = 'User is added <a href="login.php">login</a>';
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Halaman Register</title>
</head>

<body>
    <div class="container mt-5" style="max-width:350px;">

        <h2 class="text-center mb-4">Register</h2>

        <form method="post">

            <div class="row mb-3 align-items-center">
                <label for="usn_id" class="col-sm-4 col-form-label">Username</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="usn_input" id="usn_id" placeholder="Input Username"
                        required>
                </div>
            </div>

            <div class="row mb-4 align-items-center">
                <label for="psw_id" class="col-sm-4 col-form-label">Password</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" name="psw_input" id="psw_id"
                        placeholder="Input Password" required>
                </div>
            </div>

            <div class="text-end">
                <button type="submit" class="btn btn-success px-3">Send</button>
            </div>

        </form>

        <div class="mt-3 text-center">
            <?php echo $message; ?>
        </div>

    </div>
</body>

</html>