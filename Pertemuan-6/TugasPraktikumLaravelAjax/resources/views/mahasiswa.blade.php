<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tugas Praktikum Laravel + AJAX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

    <div class="container mt-5">
        <h1 class="mb-4 text-center">Data Mahasiswa</h1>

        <div class="text-center mb-4">
            <button id="btnTampilData" class="btn btn-primary">Tampilkan Data</button>
        </div>

        <div class="row" id="areaHasilData"></div>
    </div>

    <script>
        document.getElementById('btnTampilData').addEventListener('click', function () {
            //mengambil elemen tempat hasil data akan ditaruh
            const areaHasil = document.getElementById('areaHasilData');

            //memberikan indikator loading
            areaHasil.innerHTML = '<div class="col-12 text-center text-muted">Mengambil data...</div>';

            //melakukan request AJAX dengan Fetch API
            fetch('/mahasiswa')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Terjadi kesalahan jaringan');
                    }
                    return response.json();
                })
                .then(data => {
                    //mengosongkan area hasil sebelum merender data baru
                    areaHasil.innerHTML = '';

                    //looping data JSON dan membuat struktur HTML Card
                    data.forEach(mhs => {
                        const cardHtml = `
                            <div class="col-md-4 mb-3">
                                <div class="card shadow-sm h-100">
                                    <div class="card-body">
                                        <p class="card-text mb-1">
                                            <strong>Nama :</strong> ${mhs.nama}
                                        </p>
                                        <p class="card-text mb-1">
                                            <strong>NIM :</strong> ${mhs.nim}
                                        </p>
                                        <p class="card-text mb-1">
                                            <strong>Kelas :</strong> ${mhs.kelas}
                                        </p>
                                        <p class="card-text">
                                            <strong>Prodi :</strong> ${mhs.prodi}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        `;
                        //menyisipkan card ke dalam area hasil
                        areaHasil.innerHTML += cardHtml;
                    });
                })
                .catch(error => {
                    console.error('Error:', error);
                    areaHasil.innerHTML = '<div class="col-12 text-center text-danger">Gagal memuat data.</div>';
                });
        });
    </script>
</body>

</html>