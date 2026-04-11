<?php 
function luasSegitiga($alas, $tinggi) {
    return 0.5 * $alas * $tinggi;
}

//pemanggilan fungsi
$a = 10;
$t = 50;
echo "Luas Segitiga dengan alas $a dan tinggi $t adalah : " . luasSegitiga($a, $t);
?>