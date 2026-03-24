var gelar;
var pendidikan = "S2";
if (pendidikan === "S1") {
    gelar = "Sarjana";
} else if (pendidikan === "S2") {
    gelar = "Master";
} else if (pendidikan === "S3") {
    gelar = "Doktor";
} else {
    gelar = "Tidak Diketahui";
}
console.log(gelar);


console.log(5 == "5");            // true
console.log(5 === "5");           // false
console.log(1 == true);           // true
console.log(1 === true);          // false
console.log(null == undefined);   // true
console.log(null === undefined);  // false
console.log("" == 0);             // true
console.log("" === 0);            // false


//perulangan while
var i = 1;
while (i < 5) {
    console.log("Perulangan while ke-" + i);
    i++;
}

//perulangan do-while
var input;
do {
    input = Math.floor(Math.random() * 10); // angka random 0–9
    console.log("Input:", input);
} while (input !== 5); // berhenti kalau dapat angka 5

//perulangan for
for (var i = 0; i < 5; i++) {
    console.log("Perulangan for ke-" + i);
}
