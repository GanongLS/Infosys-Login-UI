part of 'reg_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String uid; // realnya userModel

  RegisterSuccess({required this.uid});
}

final class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure(this.error);
}

final class RegisterLoading extends RegisterState {
  final String? message;

  RegisterLoading({this.message});
}
