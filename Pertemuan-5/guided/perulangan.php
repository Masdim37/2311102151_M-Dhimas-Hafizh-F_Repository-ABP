<?php
echo "Ini adalah contoh perulangan for";
echo "<br>";
for ($i = 1; $i <= 10; $i++) {
    echo $i . " ";
}
echo "<br>";
echo "<br>";
echo "Ini adalah contoh perulangan while";
echo "<br>";
$i = 1;
while ($i <= 20) {
    echo $i . " ";
    $i += 2;
}
echo "<br>";
echo "<br>";
echo "Ini adalah contoh perulangan do-while";
echo "<br>";
$i = 1;
do {
    echo $i . " ";
    $i += 3;
} while ($i < 30);
?>