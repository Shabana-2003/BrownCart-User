import 'package:browncart_user/controller/auth_bloc/bloc/auth_bloc.dart';
import 'package:browncart_user/controller/auth_bloc/bloc/auth_event.dart';
import 'package:browncart_user/controller/auth_bloc/bloc/auth_state.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();

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
                Text('FORGOT PASSWORD', style: textforgotStyle),
                kHeight161,
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
                    ],
                  ),
                ),
                kHeight136,
                ElevatedButton(
                  onPressed: _forgotPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.5), // Set transparent color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'SEND MAIL',
                    style:
                        TextStyle(color: kWhite, fontFamily: "Gruppo-Regular"),
                  ),
                ),
              ],
            ),
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                    'Sending password reset email...',
                    style: textloginStyle,
                  )),
                );
              } else if (state is AuthSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                    state.message,
                    style: textloginStyle,
                  )),
                );
                Navigator.pop(context);
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                    state.error,
                    style: textloginStyle,
                  )),
                );
              }
            },
            child: Container(),
          ),
        ],
      ),
    );
  }

  _forgotPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      BlocProvider.of<AuthBloc>(context).add(SendPasswordReset(_email.text));
    }
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }
}
