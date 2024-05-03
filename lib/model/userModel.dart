import 'package:hive/hive.dart';

part 'userModel.g.dart';

@HiveType(typeId: 0, adapterName: 'UserAdapter')
class UserModel {
  @HiveField(0)
  String username;
  @HiveField(1)
  String email;
  @HiveField(2)
  String password;
  @HiveField(3)
  String confirmPassword;
  @HiveField(4)
  String phoneNumber;

  UserModel(
    this.username,
    this.email,
    this.password,
    this.confirmPassword,
    this.phoneNumber,
  );
}
