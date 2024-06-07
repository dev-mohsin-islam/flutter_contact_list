

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
}