import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'db/db_init/hive_db_init.dart';
import 'pages/start/start_w.dart';
import 'db/hive_prefs.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  await HiveDB().initDatabase();
  await HivePrefs.open();
  runApp(Start());
}




