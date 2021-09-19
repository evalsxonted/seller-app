import 'package:flutter/material.dart';
import 'pages/start/start_w.dart';
import 'utilities/db_init/hive_db_init.dart';
import 'utilities/db_init/sqlite_db_init.dart';
import 'utilities/hive_prefs.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitHive().initDatabase();
  await HivePrefs.open();
  await InitSqlite().initDatabase();
  runApp(Start());
}




