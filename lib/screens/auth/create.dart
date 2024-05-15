import 'package:browncart_user/controllers/authcontroller.dart';
import 'package:browncart_user/screens/auth/login.dart';
import 'package:browncart_user/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   final _auth = AuthService();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
  }
  // void _login() {
  //   if (_formKey.currentState!.validate()) {
  //     // Perform login
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image

          Image.asset(
            'img/image2.png', // Replace 'assets/background_image.jpg' with your image asset path
            fit: BoxFit.cover,
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 200), // Adjust the height as needed
                Text(
                  'JOIN BROWNCART NOW',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      fontFamily: "Gruppo-Regular"),
                ),
                SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: _name,
                          decoration: InputDecoration(
                            labelText: 'Name',
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
                              return 'Please enter your name';
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
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: _email,
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
                  height: 85,
                ),

                ElevatedButton(
                  onPressed:_signup,
                 
                  child:   Container(
                    child:  Text(
                      'SIGNUP',
                      style: TextStyle(
                          color: Colors.white, fontFamily: "Gruppo-Regular"),
                    ),),
                 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.5), // Set transparent color
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 55),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Already have an account? ", style: TextStyle(
        fontFamily: "Gruppo-Regular",
        color: Color.fromARGB(255, 204, 204, 204), 
        fontSize: 15, 
      ),),
              InkWell(
                onTap: () => goToLogin(context),
                child: const Text("Login",style: TextStyle(
        fontFamily: "Gruppo-Regular",
        color: Color.fromARGB(255, 204, 204, 204), 
        fontSize: 15, 
      ),),
              )
            ]),

                // Add other login components below the text
              ],
            ),
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
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  _signup() async {
        await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
        Navigator.pop(context);
  }
}
