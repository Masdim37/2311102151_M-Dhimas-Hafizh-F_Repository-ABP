<?php
function cetakGenap() {
    for ($i = 1; $i <= 100; $i++) {
        if ($i % 2 == 0) {
            echo "$i ";
        }
    }
}

//pemanggilan fungsi
cetakGenap();
?>