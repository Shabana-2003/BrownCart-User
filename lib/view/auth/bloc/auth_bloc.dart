// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthInitial()) {
//     on<AuthEvent>((event, emit) {
     
//     });
//   }
// }
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:browncart_user/controller/authcontroller.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthController authController;

  AuthBloc(this.authController) : super(AuthInitial());

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginRequested) {
      yield AuthLoading();
      try {
        await authController.loginUserWithEmailAndPassword(event.email, event.password);
        yield AuthSuccess();
      } catch (e) {
        yield AuthFailure(e.toString());
      }
    } else if (event is SignupRequested) {
      yield AuthLoading();
      try {
        await authController.createUserWithEmailAndPassword(event.email, event.password);
        yield AuthSuccess();
      } catch (e) {
        yield AuthFailure(e.toString());
      }
    } else if (event is GoogleLoginRequested) {
      yield AuthLoading();
      try {
        await authController.loginWithGoogle();
        yield AuthSuccess();
      } catch (e) {
        yield AuthFailure(e.toString());
      }
    } else if (event is ForgotPasswordRequested) {
      yield AuthLoading();
      try {
        await authController.sendPasswordResetLinkwa(event.email);
        yield AuthSuccess();
      } catch (e) {
        yield AuthFailure(e.toString());
      }
    } else if (event is AuthLogoutRequested) {
      yield AuthLoading();
      try {
        await authController.signout();
        yield AuthSuccess();
      } catch (e) {
        yield AuthFailure(e.toString());
      }
    }
  }
}
