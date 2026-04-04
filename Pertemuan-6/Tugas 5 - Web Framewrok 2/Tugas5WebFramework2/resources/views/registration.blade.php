<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Halaman Registration</title>
</head>

<body>
    <div class="container mt-5" style="max-width:350px;">

        <h2 class="text-center mb-4">Register</h2>

        <form action="/register" method="POST">
            @csrf

            <div class="row mb-3 align-items-center">
                <label for="usn_id" class="col-sm-4 col-form-label">Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" name="email" id="email_id" required>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <label for="usn_id" class="col-sm-4 col-form-label">Nama</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="name" id="nama_id" required>
                </div>
            </div>

            <div class="row mb-4 align-items-center">
                <label for="psw_id" class="col-sm-4 col-form-label">Password</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" name="password" id="psw_id" required>
                </div>
            </div>

            <div class="text-end">
                <button type="submit" class="btn btn-success px-3">Register</button>
                <a href="{{ route('login') }}" class="ms-3">Sudah punya akun? Login</a>
            </div>

            @if (session('success'))
                <div class="alert text-center mt-3">
                    {{ session('success') }}
                </div>
            @endif
            @if ($errors->any())
                <div class="alert text-center mt-3">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

        </form>

    </div>
</body>

</html>