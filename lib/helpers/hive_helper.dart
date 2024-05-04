import 'package:hive_flutter/hive_flutter.dart';
import 'package:lastapp/model/userModel.dart';

class HiveHelper {
  HiveHelper._();

  static void registerAdapters() {
    Hive.registerAdapter<UserModel>(UserAdapter());
  }

  static Future<void> openUserAccounts() async {
    await Hive.openBox<UserModel>('users');

    final _userBox = Hive.box<UserModel>('users');

    print('users box length: ${_userBox.length}');
  }
}
