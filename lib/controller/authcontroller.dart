import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController{
  final _auth = FirebaseAuth.instance;

  

    Future<void> sendPasswordResetLinkwa(String email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());
    }
  }


  Future<UserCredential?> loginWithGoogle() async{
    try{
  final googleUser = await GoogleSignIn().signIn();
  final googleAuth = await googleUser?.authentication;
  final cred = GoogleAuthProvider.credential(idToken: googleAuth?.idToken,accessToken: googleAuth?.accessToken);

  return await _auth.signInWithCredential(cred);
    }catch(e){
        print(e.toString());
    }
    return null;
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch(e){
      exceptionHandler(e.code);
    }catch (e) {
      log("Something went wrong");
    }
    return null;
  }

  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    }on FirebaseAuthException catch(e){
      exceptionHandler(e.code);
    } catch (e) {
      log("Something went wrong");
    }
    return null;
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Something went wrong");
    }
  }
}

exceptionHandler(String code){
  switch (code){
    case "invalid-credential":
    log("Your login credentials are invalid");
    case "week-password":
    log("your password must be at least 8 charecter");
    case "email-already-in-use":
    log("user already exists");
    default: log("Somthing went wrong");

  }
}

