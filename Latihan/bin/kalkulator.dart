class Kalkulator {
  
  double tambah(double a, double b) => a + b;

  
  double kurang(double a, double b) => a - b;

  
  double kali(double a, double b) => a * b;

  
  double bagi(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Pembagian dengan angka nol tidak diperbolehkan!');
    }
    return a / b;
  }
}