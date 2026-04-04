<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Halaman Login</title>
</head>

<body>
    <div class="container mt-5" style="max-width:350px;">

        <h2 class="text-center mb-4">Login</h2>

        <form action="/auth" method="POST">
            @csrf

            <div class="row mb-3 align-items-center">
                <label for="usn_id" class="col-sm-4 col-form-label">Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" name="email" id="email_id" required>
                </div>
            </div>

            <div class="row mb-4 align-items-center">
                <label for="psw_id" class="col-sm-4 col-form-label">Password</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" name="password" id="psw_id" required>
                </div>
            </div>

            <div class="text-end">
                <button type="submit" class="btn btn-success px-3">Login</button>
                <a href="{{ route('registration') }}" class="ms-3">Belum punya akun? Register</a>
            </div>

            @if ($errors->any())
            <div class="alert text-center mt-3">
                {{ $errors->first() }}
            </div>
            @endif

        </form>

    </div>
</body>

</html>