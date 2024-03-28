void main() {
  double panjang = 6;
  double lebar = 5;
  double tinggi = 3;

  double volumeBalok = hitungVBalok(panjang, lebar, tinggi);
  double luasPermukaan = hitungLPermukaan(panjang, lebar, tinggi);
  double kelilingRusuk = hitungKRusuk(panjang, lebar, tinggi);

  print("Volume Balok: $volumeBalok");
  print("Luas Permukaan Balok: $luasPermukaan");
  print("Keliling Rusuk Balok: $kelilingRusuk");
}

double hitungVBalok(double panjang, double lebar, double tinggi) {
  return panjang * lebar * tinggi;
}

double hitungLPermukaan(double panjang, double lebar, double tinggi) {
  return 2 * (panjang * lebar + panjang * tinggi + lebar * tinggi);
}

double hitungKRusuk(double panjang, double lebar, double tinggi) {
  return 4 * (panjang + lebar + tinggi);
}
