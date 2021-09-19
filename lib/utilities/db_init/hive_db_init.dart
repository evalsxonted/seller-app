import 'package:hive/hive.dart';
import 'package:seller/utilities/db_init/db_init.dart';
import 'package:sqflite/sqflite.dart';


class InitHive extends InitDB{
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
}