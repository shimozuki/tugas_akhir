import 'dart:html';

class Admin {
  int _id;
  String _nama;
  String _alamat;
  String _luas;
  Blob _foto;

  // konstruktor versi 1
  Admin(this._nama, this._alamat, this._luas);

  // konstruktor versi 2: konversi dari Map ke Admin
  Admin.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nama = map['nama'];
    this._alamat = map['alamat'];
    this._luas = map['luas'];
    this._foto = map['foto'];
  }
  //getter dan setter (mengambil dan mengisi data kedalam object)
  // getter
  int get id => _id;
  String get nama => _nama;
  String get alamat => _alamat;
  String get luas => _luas;
  Blob get foto => _foto;

  // setter
  set nama(String value) {
    _nama = value;
  }

  set alamat(String value) {
    _alamat = value;
  }

  set luas(String value) {
    _luas = value;
  }

  set foto(Blob value) {
    _foto = value;
  }

  // konversi dari Admin ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama'] = nama;
    map['alamat'] = alamat;
    map['luas'] = luas;
    map['foto'] = foto;
    return map;
  }
}
