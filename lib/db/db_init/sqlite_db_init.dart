import 'package:path/path.dart';
import 'package:seller/models/user.dart';
import 'package:sqflite/sqflite.dart';


class Sqlite {
  late final Database? _database;

  Future<String> getPath() async {
    return join(await getDatabasesPath(), 'main.db');
  }

  Future<Database> initDatabase() async {
    _database = await openDatabase(await getPath(), onCreate: (db, version) async {
      await db.execute(
        User.sqliteUserTable
      );
    }, version: 1);
   return _database!;
  }

  removeDatabase() async{
    deleteDatabase(await getPath());
  }

  closeDatabase() {
    if(_database != null){
      _database!.close();
    }
  }

}
