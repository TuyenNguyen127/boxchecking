import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:lastapp/model/userModel.dart';
import 'package:lastapp/presentation/authen_page/login/login.dart';
import 'package:lastapp/service/authen/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //=====================================================================================================

  // late Box<UserModel> userBox;

  //=====================================================================================================
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  //=====================================================================================================

  @override
  void initState() {
    super.initState();

    // userBox = Hive.box<UserModel>('users');
  }

  //=====================================================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SizeUtils.width,
        height: SizeUtils.height,
        //
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Color(0xFFFDAEAE),
              ], // Define your gradient colors
            ),
          ),
          child: Container(
            child: Stack(
              children: [
                //
                Positioned(top: 50.v, child: _buildImageBackgr()),
                //
                Center(
                  // child: Positioned(
                  // top: 100.v,
                  child: _buildForm(),
                  // ),
                ),
                //
              ],
            ),
          ),
        ),
        //
      ),
    );
  }

  //=====================================================================================================

  Widget _buildImageBackgr() {
    return Container(
      width: SizeUtils.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/person_sitting.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      width: SizeUtils.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: SizeUtils.width,
            // height: SizeUtils.height * 2 / 3,
            margin: EdgeInsets.symmetric(horizontal: 40.h),
            padding: EdgeInsets.symmetric(horizontal: 40.h, vertical: 15.h),
            child: Column(
              children: [
                //
                SizedBox(height: 5.v),
                Text(
                  'Register'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                //
                SizedBox(height: 30.v),
                inputUsername(),
                //
                SizedBox(height: 30.v),
                inputEmail(),
                // password
                SizedBox(height: 30.v),
                inputPassword(),
                // confirm password
                SizedBox(height: 30.v),
                inputConfirmPassword(),
                //
                SizedBox(height: 30.v),
                inputPhoneNumber(),
                // inputButton
                SizedBox(height: 20.v),
                inputButton(),
                // link switch to page Login
                SizedBox(height: 20.v),
                linkSwitchToPageLogin(),
                //
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget inputUsername() {
    return TextField(
      controller: usernameController,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: TextStyle(color: Colors.grey),
        focusColor: Colors.black,
        hintText: 'Enter your username',
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(
          vertical: 22.v,
          horizontal: 15.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget inputEmail() {
    return TextField(
      controller: emailController,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.grey),
        focusColor: Colors.black,
        hintText: 'Enter your email',
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(
          vertical: 22.v,
          horizontal: 15.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget inputPassword() {
    return TextField(
      controller: passwordController,
      obscureText: true,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.grey),
        focusColor: Colors.black,
        hintText: 'Enter your password',
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(
          vertical: 22.v,
          horizontal: 15.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget inputConfirmPassword() {
    return TextField(
      controller: confirmPasswordController,
      obscureText: true,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Confirm password',
        labelStyle: TextStyle(color: Colors.grey),
        focusColor: Colors.black,
        hintText: 'Confirm your password',
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(
          vertical: 22.v,
          horizontal: 15.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget inputPhoneNumber() {
    return TextField(
      controller: phoneNumberController,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Phone number',
        labelStyle: TextStyle(color: Colors.grey),
        focusColor: Colors.black,
        hintText: 'Enter your phone number',
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(
          vertical: 22.v,
          horizontal: 15.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget inputButton() {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(vertical: 40.v),
        ),
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFDBBB7)),
        minimumSize: MaterialStateProperty.all(
          Size(double.infinity, 50.0),
        ),
      ),
      onPressed: () {
        // Add your authentication logic here
        onClickBtnRegister();
      },
      child: Container(
        child: Text(
          'Register',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.fSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget linkSwitchToPageForgotPassword() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot your password?',
        style: TextStyle(
          color: Colors.red,
          fontSize: 18.fSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget linkSwitchToPageLogin() {
    return Row(
      children: [
        //
        Text(
          "You don't have any account? ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.fSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        //
        GestureDetector(
          onTap: () {
            onClickBtnSwitchToPageLogin();
          },
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.red,
              fontSize: 18.fSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  //=====================================================================================================

  void onClickBtnSwitchToPageLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void onClickBtnRegister() async {
    // print('Register');

    // String username = usernameController.text.trim();
    // String email = emailController.text.trim();
    // String password = passwordController.text.trim();
    // String confirmPassword = confirmPasswordController.text.trim();
    // String phoneNumber = phoneNumberController.text.trim();

    // final userBox = Hive.box<UserModel>('users');

    // // Register a new user
    // AuthService authService = AuthService(userBox);

    // UserModel newUser = UserModel(
    //   username,
    //   email,
    //   password,
    //   confirmPassword,
    //   phoneNumber,
    // );

    // bool isRegistered = await authService.registerHiveBox(newUser);

    // if (isRegistered) {
    //   usernameController.clear();
    //   emailController.clear();
    //   passwordController.clear();
    //   confirmPasswordController.clear();
    //   phoneNumberController.clear();

    //   // Registration successful
    //   _showDelayedToast('Registration successful', 'top');
    //   onClickBtnSwitchToPageLogin();
    // } else {
    //   // Username or email already exists
    //   _showDelayedToast('Username or email already exists', 'top');
    // }
  }

  void _showDelayedToast(String text, String position) {
    if (position.toLowerCase() == 'top') {
      Fluttertoast.showToast(
        msg: text,
        // toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black26,
        textColor: Colors.white,
        fontSize: 14.fSize,
      );
    } else if (position.toLowerCase() == 'bottom') {
      Fluttertoast.showToast(
        msg: text,
        // toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black26,
        textColor: Colors.white,
        fontSize: 14.fSize,
      );
    }
  }
}
