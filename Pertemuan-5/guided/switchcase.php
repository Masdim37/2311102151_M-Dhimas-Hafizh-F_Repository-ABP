<?php
$nilai = 80;
switch ($nilai) {
    case ($nilai > 50 && $nilai <= 60) : 
        echo "Nilai Anda adalah " . $nilai . ". Indeks nilai anda C"; 
        break;
    case ($nilai > 60 && $nilai <= 70) : 
        echo "Nilai Anda adalah " .$nilai . ". Indeks nilai anda BC"; 
        break;
    case ($nilai > 70 && $nilai <= 75) : 
        echo "Nilai Anda adalah " .$nilai . ". Indeks nilai anda B"; 
        break;
    case ($nilai > 75 && $nilai <= 80) : 
        echo "Nilai Anda adalah " .$nilai . ". Indeks nilai anda AB"; 
        break;
    case ($nilai > 80 && $nilai <= 100) : 
        echo "Nilai Anda adalah " .$nilai . ". Indeks nilai anda A"; 
        break;
    default :
        echo "Nilai Anda adalah " . $nilai . ". Maaf, Anda tidak lulus";
        break; 
}
?>