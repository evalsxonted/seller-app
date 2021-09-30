import 'package:path/path.dart';
import 'package:seller/models/user.dart';
import 'package:sqflite/sqflite.dart';

import 'db_init.dart';

class Sqlite extends InitDB {
  late final Database? _database;

  @override
  Future<String> getPath() async {
    return join(await getDatabasesPath(), 'main.db');
  }

  @override
  Future<Database> initDatabase() async {
    _database = await openDatabase(await getPath(), onCreate: (db, version) async {
      await db.execute(
        User.sqliteUserTable
      );
    }, version: 1);
   return _database!;
  }

  @override
  removeDatabase() async{
    deleteDatabase(await getPath());
  }

  @override
  closeDatabase() {
    if(_database != null){
      _database!.close();
    }
  }

}
