// part of 'auth_bloc.dart';

 //import 'package:equatable/equatable.dart';

//@immutable
// sealed class AuthEvent {}
//import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested(this.email, this.password);
}

class SignupRequested extends AuthEvent {
  final String email;
  final String password;

  const SignupRequested(this.email, this.password);
}

class GoogleLoginRequested extends AuthEvent {}

class ForgotPasswordRequested extends AuthEvent {
  final String email;

  const ForgotPasswordRequested(this.email);
}

class AuthLogoutRequested extends AuthEvent {}
