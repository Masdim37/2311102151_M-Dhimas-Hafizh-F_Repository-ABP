var jadwal = {
    platform: 34,
    telah_berangkat: false,
    asal: { //objek asal sebagai properti objek jadwal
        "kode-kota": "MDN",
        nama_kota: "Medan",
        waktu: "2013-12-29 14:00"
    },
    tujuan: { //objek tujuan sebagai properti objek tujuan
        "kode-kota": "JKT",
        "nama-kota": "Jakarta",
        waktu: "2013-12-29 17:30"
    }
};

console.log(jadwal.platform); //34
console.log(jadwal.asal.nama_kota); //medan
console.log(jadwal.asal["kode-kota"]); //MDN
console.log(jadwal.tujuan["nama-kota"]);  //jakarta

console.log(jadwal.asal.nama_kota); //medan
console.log(jadwal.tujuan["kode-kota"]); //JKT
console.log(jadwal.tujuan["nama-kota"]);  //Jakarta
