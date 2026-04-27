<!-- resources/views/buku/edit.blade.php -->

<!DOCTYPE html>
<html>
<head>
    <title>Edit Buku</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">

    <h2 class="mb-4">✏️ Edit Buku</h2>

    <div class="card shadow">
        <div class="card-body">

            <!-- ERROR VALIDATION -->
            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul class="mb-0">
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <form action="{{ route('buku.update', $buku->bukuID) }}" method="POST">
                @csrf
                @method('PUT')

                <div class="mb-3">
                    <label class="form-label">Judul Buku</label>
                    <input type="text" name="judul_buku" class="form-control"
                        value="{{ $buku->judul_buku }}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Penulis</label>
                    <input type="text" name="penulis" class="form-control"
                        value="{{ $buku->penulis }}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Penerbit</label>
                    <input type="text" name="penerbit" class="form-control"
                        value="{{ $buku->penerbit }}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Jumlah Halaman</label>
                    <input type="number" name="jumlah_halaman" class="form-control"
                        value="{{ $buku->jumlah_halaman }}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Tahun Terbit</label>
                    <input type="number" name="tahun_terbit" class="form-control"
                        value="{{ $buku->tahun_terbit }}" required>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="{{ route('buku.index') }}" class="btn btn-secondary">
                        Kembali
                    </a>

                    <button type="submit" class="btn btn-primary">
                        🔄 Update
                    </button>
                </div>

            </form>

        </div>
    </div>

</div>

</body>
</html>