import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Perform login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image

          Image.asset(
            'img/image.png', // Replace 'assets/background_image.jpg' with your image asset path
            fit: BoxFit.cover,
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 200), // Adjust the height as needed
                Text(
                  'FORGOT PASSWORD',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      fontFamily: "Gruppo-Regular"),
                ),
                SizedBox(height: 161),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'OTP',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: "Gruppo-Regular"),

                            filled: true, // Add background color
                            fillColor:
                                Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                            // Only show underline without any border box
                            // border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // You can add more validation rules here
                            return null;
                          },
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Gruppo-Regular"),
                        ),
                      ),
                      //  SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(
                  height: 136,
                ),

                ElevatedButton(
                  onPressed: _login,
                  child: Text(
                    'VERIFY',
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Gruppo-Regular"),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.5), // Set transparent color
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // Add other login components below the text
              ],
            ),
          ),
        ],
      ),
    );
  }
}
