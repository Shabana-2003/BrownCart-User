import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  
  @override
  List<Object> get props => [];
}

class LoginWithEmailPassword extends AuthEvent {
  final String email;
  final String password;

  const LoginWithEmailPassword(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class LoginWithGoogle extends AuthEvent {
  @override
  List<Object> get props => [];
}

class SignUpWithEmailPassword extends AuthEvent {
  final String email;
  final String password;

  const SignUpWithEmailPassword({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SendPasswordReset extends AuthEvent {
  final String email;

  const SendPasswordReset(this.email);

  @override
  List<Object> get props => [email];
}

class SignOut extends AuthEvent {
  @override
  List<Object> get props => [];
}
