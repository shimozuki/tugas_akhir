import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:tugasakhir/models/admin.dart';

class DbAset {
  static DbAset _dbAset;
  static Database _database;

  DbAset._createObject();

  factory DbAset() {
    if (_dbAset == null) {
      _dbAset = DbAset._createObject();
    }
    return _dbAset;
  }

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'aset.db';

    //create, read databases
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return todoDatabase;
  }

  //buat tabel baru dengan nama Admin
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Admin (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        alamat TEXT,
        luas TEXT,
        foto Blob
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('Admin', orderBy: 'nama');
    return mapList;
  }

//create databases
  Future<int> insert(Admin object) async {
    Database db = await this.database;
    int count = await db.insert('Admin', object.toMap());
    return count;
  }

//update databases
  Future<int> update(Admin object) async {
    Database db = await this.database;
    int count = await db
        .update('Admin', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('Admin', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Admin>> getAdminList() async {
    var AdminMapList = await select();
    int count = AdminMapList.length;
    List<Admin> AdminList = List<Admin>();
    for (int i = 0; i < count; i++) {
      AdminList.add(Admin.fromMap(AdminMapList[i]));
    }
    return AdminList;
  }
}
