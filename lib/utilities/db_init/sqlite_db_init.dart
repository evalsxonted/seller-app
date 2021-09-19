import 'package:path/path.dart';
import 'package:seller/models/user.dart';
import 'package:seller/utilities/db_init/db_init.dart';
import 'package:sqflite/sqflite.dart';

class InitSqlite extends InitDB {
  static Database? database;

  @override
  Future<String> getPath() async {
    return join(await getDatabasesPath(), 'main.db');
  }

  @override
  initDatabase() async {
    database = await openDatabase(await getPath(), onCreate: (db, version) async {
      await db.execute(
        UserHandler.sqliteUserTable
      );
    }, version: 1);
  }

  @override
  removeDatabase() async{
    deleteDatabase(await getPath());
  }
}
