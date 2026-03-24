var naikkan = function (n) {
    var hasil = n + 10;
    return hasil;
// kode di bawah tidak dijalankan lagi 
hasil = hasil * 100;
}

console.log(naikkan(10)); // mengembalikan 20 
console.log(naikkan(25)); // mengembalikan 35

var naikkan = function (n) {
    return n + 10;
};
var tambah = function (a, b) {
    return a + b;
};

console.log(tambah(4, 4)); // mengembalikan 8
console.log(naikkan(10)); // mengembalikan 20
console.log(tambah(naikkan(5), 7)); // mengembalikan 22

