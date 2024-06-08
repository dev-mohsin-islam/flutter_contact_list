

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

import '../models/contact_model.dart';

class DbHelper{
  final String _createTableContact = '''create table $tblContact(
    $colConId integer primary key autoincrement,
    $colConName text not null,
    $colConNumber text not null,
    $colConEmail text,
    $colConAddress text,
    $colConWebsite text,
    $colConIsFavorite integer
  )''';

Future<Database> _open() async {
  final root = await getDatabasesPath();
  final dbPath = path.join(root, 'contact.db');
  return openDatabase(dbPath, version: 1, onCreate: (db, version) {
        db.execute(_createTableContact);
   });
  }

  Future<int> insertContact(ContactModel contact) async {
    final db = await _open();
    return db.insert(tblContact, contact.toMap());
  }

  Future<List<ContactModel>> getAllContacts() async {
    final db = await _open();
    final List<Map<String, dynamic>> maps = await db.query(tblContact);
    return List.generate(maps.length, (index) => ContactModel.fromMap(maps[index]));
  }

  Future<List<ContactModel>> getAllFavoriteContacts() async {
    final db = await _open();
    final List<Map<String, dynamic>> maps = await db.query(tblContact, where: '$colConIsFavorite = ?', whereArgs: [1]);
    return List.generate(maps.length, (index) => ContactModel.fromMap(maps[index]));
  }

  Future<int> updateSingleColumn(int rowId, Map<String,dynamic> map) async {
    final db = await _open();
    return db.update(tblContact, map, where: '$colConId = ?', whereArgs: [rowId]);
  }
  Future<int> deleteContact(int rowId) async {
    final db = await _open();
    return db.delete(tblContact, where: '$colConId = ?', whereArgs: [rowId]);
  }
}