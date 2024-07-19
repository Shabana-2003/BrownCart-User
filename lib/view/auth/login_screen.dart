import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:browncart_user/controller/auth_bloc/bloc/auth_bloc.dart';
import 'package:browncart_user/controller/auth_bloc/bloc/auth_event.dart';
import 'package:browncart_user/controller/auth_bloc/bloc/auth_state.dart';
import 'package:browncart_user/view/widgets/showDialogBox_internet.dart';
import 'package:browncart_user/view/auth/signup_screen.dart';
import 'package:browncart_user/view/auth/forgot_page.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthBloc _authBloc = AuthBloc();

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
      _authBloc.add(LoginWithEmailPassword(_email.text, _password.text));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _authBloc.close();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            setState(() {
              isLoading = true;
            });
          } else if (state is AuthSuccess) {
            setState(() {
              isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is AuthFailure) {
            setState(() {
              isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Scaffold(
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
                    Text('SIGN IN TO YOUR ACCOUNT', style: textloginStyle),
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
                              style: TextStyle(
                                  color: kWhite, fontFamily: "Gruppo-Regular"),
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
                                builder: (context) =>const ForgotPage()),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: kWhite, fontFamily: "Gruppo-Regular"),
                        ),
                      ),
                    ),
                    kHeight100,
                    ElevatedButton(
                      onPressed: _submitForm, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: kWhite, fontFamily: "Gruppo-Regular"),
                      ),
                    ),
                    kHeight60,
                    isLoading
                        ?  CircularProgressIndicator(color: kBrown,)
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isLoading = true;
                              });
                              _authBloc.add(LoginWithGoogle());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: kBlack,
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
                      child: Text(
                        'Do you need an Account? Register',
                        style: TextStyle(
                            color: kWhite, fontFamily: "Gruppo-Regular"),
                      ),
                    ),
                    kHeight10,
                  ],
                ),
              ),
              const ShowDialogBox(),
            ],
          ),
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>const SignupScreen()),
      );
}
