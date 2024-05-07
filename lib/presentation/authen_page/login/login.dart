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

  final _controller = TextEditingController();

  String _accountErrMsg = '';
  String _passwordErrMsg = '';

  String _emailErrorText = '';

  bool notifyBelowInputAcc = false;
  bool notifyBelowInputPass = false;

  //=====================================================================================================
  // void _submit() {
  //   // if there is no error text
  //   if (_errorText == null) {
  //     // notify the parent widget via the onSubmit callback
  //     widget.onSubmit(_controller.value.text);
  //   }
  // }

  // void _validateEmail(String value) {
  //   if (value.isEmpty) {
  //     setState(() {
  //       notifyBelowInputAcc = true;
  //       _emailErrorText = 'Email is required';
  //     });
  //   } else if (!isEmailValid(value)) {
  //     setState(() {
  //       notifyBelowInputAcc = true;
  //       _emailErrorText = 'Enter a valid email address';
  //     });
  //   } else {
  //     setState(() {
  //       notifyBelowInputAcc = false;
  //       _emailErrorText = '';
  //     });
  //   }
  // }

  // bool isEmailValid(String email) {
  //   // Basic email validation using regex
  //   // You can implement more complex validation if needed
  //   return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  // }

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     // Form is valid, proceed with your logic here
  //     // For this example, we will simply print the email
  //     print('Email: ${accountController.text}');
  //   }
  // }

  //=====================================================================================================

  @override
  void dispose() {
    super.dispose();

    accountController.dispose();
    passwordController.dispose();

    // _controller.dispose();
  }

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

  // Widget _buildNewForm() {
  //   return ValueListenableBuilder(
  //     // Note: pass _controller to the animation argument
  //     valueListenable: _controller,
  //     builder: (context, TextEditingValue value, __) {
  //       // this entire widget tree will rebuild every time
  //       // the controller value changes
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: [
  //           //
  //           inputAccount(),
  //           //
  //           inputPassword(),
  //           //
  //           inputButton(),
  //           //
  //         ],
  //       );
  //     },
  //   );
  // }

  Widget _buildForm() {
    return Container(
      width: SizeUtils.width,
      child: Form(
        // key: _formKey,
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
                  // account
                  SizedBox(height: 30.v),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                      inputAccount(),
                      //
                      notifyBelowInputAcc
                          ? Column(
                              children: [
                                SizedBox(height: 5.v),
                                Text(
                                  _accountErrMsg,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15.fSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 10.v),
                              ],
                            )
                          : Text(''),
                    ],
                  ),
                  // password
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                      inputPassword(),
                      //
                      notifyBelowInputPass
                          ? Column(
                              children: [
                                SizedBox(height: 5.v),
                                Text(
                                  _passwordErrMsg,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15.fSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 15.v),
                              ],
                            )
                          : Text(''),
                      //
                    ],
                  ),
                  // link switch to page Forgot password
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
      ),
    );
  }

  Widget inputAccount() {
    return TextFormField(
      // onChanged: _validateEmail,
      // validator: (value) => _emailErrorText,
      keyboardType: TextInputType.emailAddress,
      controller: accountController,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Account',
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
    return TextFormField(
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
      onPressed: () {
        // Add your authentication logic here
        // onClickBtnLogin();
      },
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

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please fill your email';
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please fill your password';
    }

    return null;
  }

  bool checkValidateLogin(String email, String password) {
    if (!notifyBelowInputPass && !notifyBelowInputAcc) {
      return true;
    }

    return false;
  }

  void onClickBtnLogin() async {
    String account = accountController.text.trim();
    String password = passwordController.text.trim();

    // if (_formKey.currentState!.validate()) {
    if (checkValidateLogin(account, password)) {
      // Login
      // final userBox = Hive.box<UserModel>('users');
      // AuthService authService = AuthService();
      // await authService.loginFirebase(account, password);

      _showDelayedToast('Login successful', 'top');

      // Reset error message
      setState(() {
        _accountErrMsg = '';
        _passwordErrMsg = '';
      });
    } else {
      _showDelayedToast('Please check your all information', 'top');
    }
  }

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

  // void switchToHomeContainerScreen() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => HomeContainerScreen()),
  //   );
  // }

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
