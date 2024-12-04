import 'mhs.dart';
import 'nilai.dart';

// Class untuk Transkrip
class Transkrip extends Mhs {  
  List<Nilai> daftarNilai = [];  // Daftar nilai mata kuliah

  // Constructor memanggil constructor induk Mhs
  Transkrip(String nim, String nama, int semester) : super(nim, nama, semester);  

  // Method untuk menambahkan nilai ke daftar
  void operator +(Nilai nilai) {  
    daftarNilai.add(nilai);  
    print('Nilai ${nilai.matkul.nama} berhasil ditambahkan.');
  }

  // Method untuk menghitung IPK
  double hitungIPK() {  
    double totalNilai = 0;  
    int totalSKS = 0;  

    for (var nilai in daftarNilai) {  
      totalNilai += nilai.nilai * nilai.matkul.sks;  
      totalSKS += nilai.matkul.sks;  
    }
    return totalSKS == 0 ? 0 : totalNilai / totalSKS;  
  }

  // Method untuk mencetak transkrip
  void cetakTranskrip() {  
    print('\n=== Transkrip Nilai Mahasiswa: ${nama} ===');  
    for (var nilai in daftarNilai) {  
      print('${nilai.matkul.nim} - ${nilai.matkul.nama}: ${nilai.nilai}');
    }
    print('IPK: ${hitungIPK().toStringAsFixed(2)}');  
    print('===============================');
  }
}