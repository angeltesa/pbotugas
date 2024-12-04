import 'mhs.dart';
import 'matkul.dart';

// Class untuk KRS
class KRS extends Mhs {  
  List<Matkul> daftarMatkul = [];  // Daftar mata kuliah dalam KRS

  // Constructor memanggil constructor induk Mhs
  KRS(String nim, String nama, int semester) : super(nim, nama, semester);  

  // Method untuk menambahkan mata kuliah ke KRS
  void operator +(Matkul matkul) {  
    daftarMatkul.add(matkul);  
    print('${matkul.nama} ditambahkan ke KRS.');
  }
}