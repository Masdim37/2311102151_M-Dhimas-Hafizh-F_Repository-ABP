<!-- resources/views/buku/index.blade.php -->

<!DOCTYPE html>
<html>
<head>
    <title>Data Buku</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">

    <h2 class="mb-4">📚 Data Buku</h2>

    <a href="{{ route('buku.create') }}" class="btn btn-primary mb-3">
        + Tambah Buku
    </a>

    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    <div class="card shadow">
        <div class="card-body">

            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Judul</th>
                        <th>Penulis</th>
                        <th>Penerbit</th>
                        <th>Halaman</th>
                        <th>Tahun</th>
                        <th width="150">Aksi</th>
                    </tr>
                </thead>

                <tbody>
                    @foreach($data as $buku)
                    <tr>
                        <td>{{ $buku->judul_buku }}</td>
                        <td>{{ $buku->penulis }}</td>
                        <td>{{ $buku->penerbit }}</td>
                        <td>{{ $buku->jumlah_halaman }}</td>
                        <td>{{ $buku->tahun_terbit }}</td>
                        <td>
                            <a href="{{ route('buku.edit', $buku->bukuID) }}" class="btn btn-warning btn-sm">
                                Edit
                            </a>

                            <form action="{{ route('buku.destroy', $buku->bukuID) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm"
                                    onclick="return confirm('Yakin hapus data?')">
                                    Hapus
                                </button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>

            </table>

        </div>
    </div>

</div>

</body>
</html>