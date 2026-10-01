import 'dart:io';
import 'kalkulator.dart';

void main() {
  final kalkulator = Kalkulator();
  bool ulang = true;

  print('========================================');
  print('     APLIKASI KALKULATOR SEDERHANA      ');
  print('========================================');

  while (ulang) {
    
    double bil1 = inputAngka('\nMasukkan bilangan pertama: ');
    double bil2 = inputAngka('Masukkan bilangan kedua: ');

    
    print('\nPilih operasi matematika:');
    print('[1] Tambah');
    print('[2] Kurang');
    print('[3] Kali');
    print('[4] Bagi');

    int pilihan = inputPilihan(1, 4);

    
    try {
      double hasil = 0;
      switch (pilihan) {
        case 1:
          hasil = kalkulator.tambah(bil1, bil2);
          print('\nHasil: $bil1 + $bil2 = $hasil');
          break;
        case 2:
          hasil = kalkulator.kurang(bil1, bil2);
          print('\nHasil: $bil1 - $bil2 = $hasil');
          break;
        case 3:
          hasil = kalkulator.kali(bil1, bil2);
          print('\nHasil: $bil1 * $bil2 = $hasil');
          break;
        case 4:
          hasil = kalkulator.bagi(bil1, bil2);
          print('\nHasil: $bil1 / $bil2 = $hasil');
          break;
      }
    } catch (e) {
      print('\n[Error] Terjadi kesalahan: ${e is ArgumentError ? e.message : e}');
    }

    
    ulang = konfirmasiUlang();
  }

  print('\nTerima kasih telah menggunakan aplikasi kalkulator!');
}


double inputAngka(String pesan) {
  while (true) {
    stdout.write(pesan);
    String? input = stdin.readLineSync();

    try {
      if (input == null || input.trim().isEmpty) {
        throw FormatException('Input tidak boleh kosong.');
      }
      return double.parse(input);
    } catch (e) {
      print(' Input tidak valid! Masukkan angka yang benar (misal: 10 atau 3.14).');
    }
  }
}


int inputPilihan(int min, int max) {
  while (true) {
    stdout.write('Pilihan Anda ($min-$max): ');
    String? input = stdin.readLineSync();

    try {
      if (input == null || input.trim().isEmpty) {
        throw FormatException();
      }
      int pilihan = int.parse(input);
      if (pilihan >= min && pilihan <= max) {
        return pilihan;
      } else {
        print(' Pilihan harus berupa angka antara $min sampai $max!');
      }
    } catch (e) {
      print(' Input pilihan tidak valid! Harap masukkan nomor menu yang benar.');
    }
  }
}


bool konfirmasiUlang() {
  while (true) {
    stdout.write('\nApakah Anda ingin melakukan perhitungan lagi? (Y/T): ');
    String? input = stdin.readLineSync()?.trim().toUpperCase();

    if (input == 'Y') {
      return true;
    } else if (input == 'T') {
      return false;
    } else {
      print(' Pilihan tidak valid! Ketik "Y" untuk Ya atau "T" untuk Tidak.');
    }
  }
}