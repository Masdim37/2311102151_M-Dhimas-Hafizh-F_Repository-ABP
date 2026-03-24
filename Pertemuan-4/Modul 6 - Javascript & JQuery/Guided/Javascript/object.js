var objek_kosong = {}
var jadwal = {
    platform : 34,
    telah_berangkat : false,
    "kota-tujuan" : "Medan",
    kota_asal : "jakarta",
    "nomor-polisi" : "BK1234AB",
    "jarak-tempuh" : 123
};

console.log(jadwal.platform) //34
console.log(jadwal.kota_asal) //jakarta
console.log(jadwal["kota-tujuan"]) //medan
console.log(jadwal["nomor-polisi"])  //BK1234AB

console.log("Berangkat dari : " + jadwal.kota_asal); //jakarta
console.log("Tujuan : " + jadwal["kota-tujuan"]);  //medan


