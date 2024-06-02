import 'package:browncart_user/controller/authcontroller.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = AuthController();
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

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully Login')),
      );
    }
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
                const Text(
                  'FORGOT PASSWORD',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      fontFamily: "Gruppo-Regular"),
                ),
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
                  child: const Text(
                    'SEND MAIL',
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Gruppo-Regular"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _forgotPassword() async {
    _submitForm();
    if (_formKey.currentState?.validate() ?? true) {
      await _auth.sendPasswordResetLinkwa(_email.text);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("An email for password has been sent to your email")));
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }
}
