part of 'reg_bloc.dart';

@immutable
sealed class AuthEvent {}

final class RegisterRequested extends AuthEvent {
  final String username;
  final String email;
  final String password;

  RegisterRequested({
    required this.username,
    required this.email,
    required this.password,
  });
}

final class DeleteAccountRequested extends AuthEvent {}
