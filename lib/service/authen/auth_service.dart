import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:lastapp/model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   // final Box<UserModel> _userBox;

//   // AuthService(this._userBox);
//   AuthService();

// // Hive box
// Future<bool> registerHiveBox(UserModel user) async {
//   // Check if username or email already exists
//   if (_userBox.values
//       .any((u) => u.username == user.username || u.email == user.email)) {
//     return false; // Username or email already exists
//   }

//   // Save the user to the box
//   await _userBox.add(user);

//   print('users box length ${_userBox.length}');

//   return true;
// }

// Future<bool> loginHiveBox(String username, String password) async {
//   // check userbox is empty or not
//   if (_userBox.isEmpty) {
//     print('No users registered!');
//     return false;
//   }

//   // Retrieve user from the box
//   final user = _userBox.values.firstWhere(
//     (user) => user.username == username && user.password == password,
//     orElse: () => UserModel('', '', '', '', ''),
//   );

//   // Check if user exists and password matches
//   if (user.username.isNotEmpty) {
//     return true; // Login successful
//   } else {
//     return false; // Login failed
//   }
// }

// Firebase
// // login
// Future loginFirebase(String email, String password) async {
//   await FirebaseAuth.instance
//       .signInWithEmailAndPassword(email: email, password: password);
// }

// // register
// Future registerFirebase(String email, String password) async {
//   await FirebaseAuth.instance
//       .createUserWithEmailAndPassword(email: email, password: password);
// }

Future getUser() async {
  await Firebase.initializeApp();
}

// }
