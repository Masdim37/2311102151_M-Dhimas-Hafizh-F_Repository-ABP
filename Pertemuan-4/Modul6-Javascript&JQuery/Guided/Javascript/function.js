function tambah(a, b){
    return a + b
};

var tambah = function (a, b){
    return a + b
};

console.log(tambah(3, 5));

var simpan = tambah(3, 5);            //simpan = 8
console.log(tambah(simpan, 2));       //mengebalikan 10
console.log(tambah(tambah(3, 5), 2)); //mengembalikan 10
console.log(tambah(tambah(2, 3), 4)); //mengembalikan 9

