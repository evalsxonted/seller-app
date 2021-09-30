import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';

import 'db_init.dart';

class HiveDB extends InitDB{
  @override
  Future<String> getPath() async{
    return getDatabasesPath();
  }

  @override
  initDatabase() async {
    Hive.init(await getPath());
  }

  @override
  removeDatabase() {
    Hive.deleteFromDisk();
  }

  @override
  closeDatabase() {
    Hive.close();
  }
}