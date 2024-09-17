import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'contact.dart';
class DbHelper{
  Future<Database> initDb()async{
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'demo.db');

    return await openDatabase(path, version: 1,onCreate: _onCreate);
  }

  Future _onCreate(Database db,int version)async{
    var sql =  ''' CREATE TABLE contact (id INTEGER PRIMARY KEY, name TEXT, phone TEXT)''';
    await db.execute(sql);
  }
  Future<int> createContact(Contact contact)async{
    Database db = await DbHelper().initDb();
    return await db.insert('contact', contact.toMap() );

  }

}