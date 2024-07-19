import 'package:browncart_user/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:browncart_user/controller/auth_bloc/bloc/auth_bloc.dart';
import 'package:browncart_user/controller/auth_bloc/bloc/auth_event.dart';
import 'package:browncart_user/controller/auth_bloc/bloc/auth_state.dart';
import 'package:browncart_user/view/auth/login_screen.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

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

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'img/image2.png',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                kHeight200,
                Text('JOIN BROWNCART NOW', style: textSignupHeadingStyle),
                kHeight50,
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
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kWhite),
                            ),
                            labelStyle: TextStyle(
                                color: kWhite, fontFamily: "Gruppo-Regular"),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.2),
                          ),
                          validator: _validateEmail,
                          style: TextStyle(
                              color: kWhite, fontFamily: "Gruppo-Regular"),
                        ),
                      ),
                      kHeight10,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: _password,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: kWhite, fontFamily: "Gruppo-Regular"),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.2),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kWhite),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: kWhite,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          obscureText: _obscureText,
                          style: TextStyle(
                              color: kWhite, fontFamily: "Gruppo-Regular"),
                        ),
                      ),
                      kHeight10,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: _confirmPassword,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                                color: kWhite, fontFamily: "Gruppo-Regular"),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.2),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kWhite),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: kWhite,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password again';
                            } else if (value != _password.text) {
                              return "Your Password is Incorrect";
                            }
                            return null;
                          },
                          style: TextStyle(
                              color: kWhite, fontFamily: "Gruppo-Regular"),
                        ),
                      ),
                    ],
                  ),
                ),
                kHeight85,
                ElevatedButton(
                  onPressed: _signup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'SIGNUP',
                    style:
                        TextStyle(color: kWhite, fontFamily: "Gruppo-Regular"),
                  ),
                ),
                kHeight55,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Already have an account? ",
                      style: textAlreadyHaveAccountStyle),
                  InkWell(
                    onTap: () => goToLogin(context),
                    child: Text("Login", style: textLoginButtonStyle),
                  )
                ]),
              ],
            ),
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Signing up...')),
                );
              } else if (state is AuthSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
                goToHome(context);
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            child: Container(),
          ),
        ],
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavBar()),
      );

  _signup() {
    if (_formKey.currentState?.validate() ?? false) {
      BlocProvider.of<AuthBloc>(context).add(SignUpWithEmailPassword(
        email: _email.text,
        password: _password.text,
      ));
    }
  }
}
