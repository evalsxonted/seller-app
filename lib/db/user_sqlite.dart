import 'dart:async';

import 'package:seller/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDB {
  final Database db;
  UserDB(this.db);

  Future<bool> addUser(User user) async{
    return await db.insert(
      'users',
      user.toSqlMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ) != 0;
  }
  Future<User> getUser(int userPhone) async{
    List<Map> result = await db.query(
        'users',
        where: 'phone = ?',
        whereArgs: [userPhone]);
    return User.fromSqlMap(result[0]);
  }
  Future<bool> updateUser(int userPhone, User user) async {
    int updates = await db.update("users", user.toSqlMap(), where: "phone = ?", whereArgs: [user.phone]);
    if(updates == 0){
      return false;
    }else{
      return true;
    }
  }
}