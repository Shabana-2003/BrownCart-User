import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  AuthBloc() : super(AuthInitial()) {

    // on<LoginWithEmailPassword>((event, emit) async {
    //   emit(AuthLoading());
    //   try {
    //     await _auth.signInWithEmailAndPassword(email: event.email, password: event.password);
    //     emit(const AuthSuccess("Login Successful"));
    //   } on FirebaseAuthException catch (e) {
    //     emit(AuthFailure(e.message ?? "An error occurred"));
    //   } catch (e) {
    //     emit(const AuthFailure("An unexpected error occurred"));
    //   }
    // });
    on<LoginWithEmailPassword>((event, emit) async {
  emit(AuthLoading());
  try {
    await _auth.signInWithEmailAndPassword(email: event.email, password: event.password);
    emit(const AuthSuccess("Login Successful"));
  } on FirebaseAuthException catch (e) {
    emit(AuthFailure(e.message ?? "An error occurred"));
  } catch (e) {
    emit(const AuthFailure("An unexpected error occurred"));
  }
});


    on<LoginWithGoogle>((event, emit) async {
      emit(AuthLoading());
      try {
        final googleUser = await GoogleSignIn().signIn();
        final googleAuth = await googleUser?.authentication;
        final cred = GoogleAuthProvider.credential(
            idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
        await _auth.signInWithCredential(cred);
        emit(const AuthSuccess("Login with Google Successful"));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignUpWithEmailPassword>((event, emit) async {
      emit(AuthLoading());
      try {
        await _auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(const AuthSuccess("SignUp Successful"));
      } on FirebaseAuthException catch (e) {
        emit(AuthFailure(e.message ?? "An error occurred"));
      }
    });
    
    on<SendPasswordReset>((event, emit) async {
      emit(AuthLoading());
      try {
        await _auth.sendPasswordResetEmail(email: event.email);
        emit(const AuthSuccess("Password Reset Email Sent"));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    // on<SignOut>((event, emit) async {
    //   emit(AuthLoading());
    //   try {
    //     await _auth.signOut();
    //     emit(const AuthSuccess("SignOut Successful"));
    //   } catch (e) {
    //     emit(AuthFailure(e.toString()));
    //   }
    // });
    on<SignOut>((event, emit) async {
      emit(AuthLoading());
      try {
        await _auth.signOut();
        emit(const AuthSuccess("Sign-Out Successful"));
      } on FirebaseAuthException catch (e) {
        emit(AuthFailure(e.message ?? "An error occurred"));
      } catch (e) {
        emit(const AuthFailure("An unexpected error occurred"));
      }
    });
  
  }
}
