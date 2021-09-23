import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/start/start_w.dart';
import 'utilities/db_init/hive_db_init.dart';
import 'utilities/db_init/sqlite_db_init.dart';
import 'utilities/hive_prefs.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  await InitHive().initDatabase();
  await HivePrefs.open();
  await InitSqlite().initDatabase();
  runApp(Start());
}




