import 'dart:async';

import 'package:browncart_user/controller/authcontroller.dart';
import 'package:browncart_user/view/auth/signup_screen.dart';
import 'package:browncart_user/view/auth/forgot_page.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthController();

  bool isLoading = false;
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _email = TextEditingController();
  final _password = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully Login')),
      );
    }
  }

  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'img/signup_img.jpeg',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                kHeight200,
                const Text(
                  'SIGN IN TO YOUR ACCOUNT',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      fontFamily: "Gruppo-Regular"),
                ),
                kHeight80,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelStyle: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Gruppo-Regular"),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.2),
                          ),
                          validator: _validateEmail,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Gruppo-Regular"),
                        ),
                      ),
                      kHeight10,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: _password,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: "Gruppo-Regular"),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.2),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return 'Password must contain at least one uppercase letter';
                            }
                            if (!RegExp(r'[a-z]').hasMatch(value)) {
                              return 'Password must contain at least one lowercase letter';
                            }
                            if (!RegExp(r'[0-9]').hasMatch(value)) {
                              return 'Password must contain at least one number';
                            }
                            if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                              return 'Password must contain at least one special character';
                            }
                            return null;
                          },
                          obscureText: _obscureText,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Gruppo-Regular"),
                        ),
                      ),
                    ],
                  ),
                ),
                kHeight10,
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPage()),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.white, fontFamily: "Gruppo-Regular"),
                    ),
                  ),
                ),
                kHeight100,
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.5), // Set transparent color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Gruppo-Regular"),
                  ),
                ),
                kHeight60,
                isLoading
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await _auth.loginWithGoogle();
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator()
                              : Image.asset(
                                  'img/google_logo.webp',
                                  width: 38,
                                  height: 38,
                                ),
                        ),
                      ),
                GestureDetector(
                  onTap: () => goToSignup(context),
                  child: const Text(
                    'Do you need an Account? Register',
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Gruppo-Regular"),
                  ),
                ),
                kHeight10,
              ],
            ),
          ),
        ],
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  // _login() async {
  //   await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);
  // }
  _login() async {
    _submitForm();
    if (_formKey.currentState?.validate() ?? true) {
      await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);
    }
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text(
            'No Connection',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Gruppo-Regular"),
          ),
          content: const Text(
            'Please check your internet connectivity',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Gruppo-Regular"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text(
                'OK',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "Gruppo-Regular"),
              ),
            ),
          ],
        ),
      );
}
