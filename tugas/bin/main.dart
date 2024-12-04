import 'dart:io';
import '../lib/matkul.dart';
import '../lib/krs.dart';
import '../lib/nilai.dart';
import '../lib/transkrip.dart';

void main() {
  // Daftar mata kuliah awal
  List<Matkul> daftarMatkul = [
    Matkul('TI2324', 'Matematika Diskrit', 3),  
    Matkul('TI2325', 'Basis Data', 2),  
    Matkul('TI2326', 'Bahasa Inggris', 2),  
  ];

  // Input data mahasiswa
  print('Masukkan NIM Mahasiswa: ');
  String? nimMhs = stdin.readLineSync();
  print('Masukkan Nama Mahasiswa: ');
  String? namaMhs = stdin.readLineSync();
  print('Masukkan Semester Mahasiswa: ');
  String? inputSemester = stdin.readLineSync();
  int? semesterMhs = int.tryParse(inputSemester ?? '');

  if (nimMhs != null && namaMhs != null && semesterMhs != null) {
    KRS krs = KRS(nimMhs, namaMhs, semesterMhs);  
    Transkrip transkrip = Transkrip(nimMhs, namaMhs, semesterMhs);  
    //Menggunakan perulangan while untuk menghasilkan print menu
    while (true) {
      print('\nMenu:');
      print('1. Tambah Mata Kuliah ke KRS');
      print('2. Tambah Nilai');
      print('3. Cetak Transkrip');
      print('4. Tambah Mata Kuliah Baru'); 
      print('5. Keluar'); 
      print('Pilih menu: ');

      String? pilihan = stdin.readLineSync();
      //Menggunakan pemilihian switch case untuk filter pemilihan
      switch (pilihan) {
        case '1':
          print('\n=== Daftar Mata Kuliah ===');
          for (int i = 0; i < daftarMatkul.length; i++) {
            print('${i + 1}. ${daftarMatkul[i].nama} (${daftarMatkul[i].sks} SKS)');
          }
          print('Pilih nomor mata kuliah: ');
          String? input = stdin.readLineSync();
          int? nomor = int.tryParse(input ?? '');

          if (nomor != null && nomor > 0 && nomor <= daftarMatkul.length) {
            krs + daftarMatkul[nomor - 1];  
          } else {
            print('Pilihan tidak valid.');
          }
          break;

        case '2':
          print('\n=== Tambah Nilai ===');
          print('Daftar Mata Kuliah:');
          for (int i = 0; i < daftarMatkul.length; i++) {
            print('${i + 1}. ${daftarMatkul[i].nama}');
          }
          print('Pilih nomor mata kuliah: ');
          String? inputMatkul = stdin.readLineSync();
          int? nomorMatkul = int.tryParse(inputMatkul ?? '');

          if (nomorMatkul != null && nomorMatkul > 0 && nomorMatkul <= daftarMatkul.length) {
            print('Masukkan nilai (0-4): ');
            String? inputNilai = stdin.readLineSync();
            double? nilai = double.tryParse(inputNilai ?? '');

            if (nilai != null && nilai >= 0 && nilai <= 4) {
              transkrip + Nilai(daftarMatkul[nomorMatkul - 1], nilai);  
            } else {
              print('Nilai tidak valid.');
            }
          } else {
            print('Pilihan tidak valid.');
          }
          break;

        case '3':
          transkrip.cetakTranskrip();   // Pemanggilan method cetakTranskrip()
          break;

        case '4':  // Opsi untuk menambah mata kuliah baru
          print('Masukkan Kode mata kuliah: ');
          String? nim = stdin.readLineSync();
          print('Masukkan nama mata kuliah: ');
          String? nama = stdin.readLineSync();
          print('Masukkan jumlah SKS: ');
          String? inputSKS = stdin.readLineSync();
          int? sks = int.tryParse(inputSKS ?? '');

          if (nim != null && nama != null && sks != null) {
            daftarMatkul.add(Matkul(nim, nama, sks));  
            print('Mata kuliah ${nama} berhasil ditambahkan.');
          } else {
            print('Input tidak valid.');
          }
          break;

        case '5':
          print('Keluar dari sistem.');
          return;

        default:
          print('Pilihan tidak valid.');
      }
    }
  } else {
    print('Input mahasiswa tidak valid.');
  }
}