var mobil = {
    Nama: "mobil",
    jumlahBan: 4
};

var truk = Object.create(mobil);
truk.nama = "mobil";
truk.jumlahBan = 8;

console.log(truk.nama); //mobil
console.log(truk.jumlahBan); //8
console.log(mobil.jumlahBan); //4
