function hitungGanjil() {
    var min = parseInt(document.getElementById("min").value);
    var max = parseInt(document.getElementById("max").value);
    var total = 0;

    if (isNaN(min) || isNaN(max)) {
        document.getElementById("hasil").innerHTML = "Inputan tidak valid!";
        return;
    } else {
        for (var i = min; i <= max; i++) {
            if (i % 2 != 0) {
                total += i;
            }
        }
        document.getElementById("hasil").innerHTML = "Jumlah bilangan ganjil = " + total;
    }  
}