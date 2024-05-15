import 'package:browncart_user/controllers/authcontroller.dart';
import 'package:browncart_user/screens/auth/create.dart';
import 'package:browncart_user/screens/auth/forgot/forgot_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

   final _auth = AuthService();

  bool isLoading =false;

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
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
          // Background image

          Image.asset(
            'img/signup_img.jpeg', // Replace 'assets/background_image.jpg' with your image asset path
            fit: BoxFit.cover,
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 200), // Adjust the height as needed
                Text(
                  'SIGN IN TO YOUR ACCOUNT',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      fontFamily: "Gruppo-Regular"),
                ),
                SizedBox(height: 80),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller:_email,
                          decoration: InputDecoration(
                            labelText: 'Email',
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
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller:_password,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: "Gruppo-Regular"),
                            // Only show underline without any border box
                            border: InputBorder.none,
                            filled: true, // Add background color
                            fillColor:
                                Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            // You can add more validation rules here
                            return null;
                          },
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Gruppo-Regular"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPage()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.white, fontFamily: "Gruppo-Regular"),
                    ),
                  ),
                ),

                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: _login,
             
                 child:   Container(
                     child:  Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.white, fontFamily: "Gruppo-Regular"),
                    ),
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
                SizedBox(height: 60),
                  isLoading?CircularProgressIndicator():GestureDetector(
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
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: const Color.fromARGB(255, 0, 0, 0), // Customize the color as needed
    ),
    child: isLoading
        ? CircularProgressIndicator() // Show loading indicator when isLoading is true
        : Image.asset(
            'img/google_logo.webp', // Replace 'google_logo.png' with your image asset path
            width: 38, // Adjust the width of the image as needed
            height: 38, // Adjust the height of the image as needed
          ),
  ),
),

                GestureDetector(
                  onTap: () => goToSignup(context),
                  child: Text(
                    'Do you need an Account? Register',
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Gruppo-Regular"),
                  ),
                ),
                SizedBox(height: 10),

                // Add other login components below the text
              ],
            ),
          ),
        ],
      ),
    );
  }
goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  SignupScreen()),
      );


  _login() async {
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

  }
}
