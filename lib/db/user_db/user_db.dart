import 'package:seller/models/user.dart';

abstract class UserDB {
  getUser();
  Future<bool> addUser(User user);
  deleteUser();
  updateUser();
}
