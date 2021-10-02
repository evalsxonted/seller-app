import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';


class HiveDB{
  Future<String> getPath() async{
    return getDatabasesPath();
  }

  initDatabase() async {
    Hive.init(await getPath());
  }

  removeDatabase() {
    Hive.deleteFromDisk();
  }

  closeDatabase() {
    Hive.close();
  }
}