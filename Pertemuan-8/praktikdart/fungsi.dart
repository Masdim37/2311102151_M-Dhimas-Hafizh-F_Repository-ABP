String cekGanjilGenap(int n) {
  if (n % 2 == 0) {
    return "Genap";
  } else {
    return "Ganjil";
  }
}

void main() {
  int angka = 8;
  String hasil = cekGanjilGenap(angka);
  print("Angka " + angka.toString() + " adalah " + hasil);
}
