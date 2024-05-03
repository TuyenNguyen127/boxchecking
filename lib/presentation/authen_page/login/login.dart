import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:lastapp/model/userModel.dart';
import 'package:lastapp/presentation/authen_page/forgot_pass/forgot_pass.dart';
import 'package:lastapp/presentation/authen_page/register/register.dart';
import 'package:lastapp/presentation/home_container/home_container_screen.dart';

import '../../../service/authen/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //=====================================================================================================

  // late Box<UserModel> userBox;

  //=====================================================================================================
  final _formKey = GlobalKey<FormState>();
  final accountController = TextEditingController();
  final passwordController = TextEditingController();

  String _accountErrMsg = '';
  String _passwordErrMsg = '';

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
                Positioned(
                  top: 300.v,
                  child: _buildForm(),
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
                  'Login'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                //
                SizedBox(height: 30.v),
                inputAccount(),
                // password
                SizedBox(height: 30.v),
                inputPassword(),
                // link switch to page Forgot password
                SizedBox(height: 20.v),
                linkSwitchToPageForgotPassword(),
                // inputButton
                SizedBox(height: 20.v),
                inputButton(),
                // link switch to page Register
                SizedBox(height: 20.v),
                linkSwitchToPageRegister(),
                //
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget inputAccount() {
    return TextField(
      controller: accountController,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Account',
        labelStyle: TextStyle(color: Colors.grey),
        focusColor: Colors.black,
        hintText: 'Enter email or username',
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
        hintText: 'Enter the password',
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
        onClickBtnLogin();
      },
      child: Container(
        child: Text(
          'Login',
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
      onTap: () {
        onClickBtnSwitchToPageForgotPassword();
      },
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

  Widget linkSwitchToPageRegister() {
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
            onClickBtnSwitchToPageRegister();
          },
          child: Text(
            'Register',
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

  void onClickBtnSwitchToPageForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
    );
  }

  void onClickBtnSwitchToPageRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  bool checkValidateLogin() {
    return true;
  }

  void onClickBtnLogin() async {
    if (checkValidateLogin()) {
      // Login
      final userBox = Hive.box<UserModel>('users');
      AuthService authService = AuthService(userBox);

      String username = accountController.text.trim();
      String password = passwordController.text.trim();

      bool isLoggedIn = await authService.login(username, password);

      if (isLoggedIn) {
        // Login successful
        accountController.clear();
        passwordController.clear();

        _showDelayedToast('Login successful', 'top');

        switchToHomeContainerScreen();
      } else {
        // Invalid username or password
        _showDelayedToast('Invalid username or password', 'top');
      }

      // Reset error message
      setState(() {
        _accountErrMsg = '';
        _passwordErrMsg = '';
      });
    } else {
      // // Form is not valid, set error message
      // setState(() {
      //   _errorMessage = 'Please fill all fields';
      // });
      _showDelayedToast('You should type enough fields', 'top');
    }
  }

  void switchToHomeContainerScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeContainerScreen()),
    );
  }

  void _showDelayedToast(String text, String position) {
    if (position.toLowerCase() == 'top') {
      Fluttertoast.showToast(
        msg: text,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black26,
        textColor: Colors.white,
        fontSize: 14.fSize,
      );
    } else if (position.toLowerCase() == 'bottom') {
      Fluttertoast.showToast(
        msg: text,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black26,
        textColor: Colors.white,
        fontSize: 14.fSize,
      );
    }
  }
}
