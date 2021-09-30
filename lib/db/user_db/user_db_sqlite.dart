import 'dart:async';

import 'package:seller/db/user_db/user_db.dart';
import 'package:seller/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserSqlDB extends UserDB{
  final Database db;
  UserSqlDB(this.db);

  @override
  Future<bool> addUser(User user) async{
    return await db.insert(
      'users',
      user.toSqlMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ) != 0;
  }
  @override
  deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  updateUser() {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}