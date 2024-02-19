import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reg_event.dart';
part 'reg_state.dart';

class RegisterBloc extends Bloc<AuthEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterRequested>(_onRegisterRequested);
    on<DeleteAccountRequested>(_onDeleteAccountRequested);
  }

  void _onDeleteAccountRequested(
      DeleteAccountRequested event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    try {
      await Future.delayed(const Duration(seconds: 2), () {
        return emit(RegisterInitial());
      });
    } catch (e) {
      return emit(RegisterFailure("gagal logout"));
    }
  }

  void _onRegisterRequested(RegisterRequested event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    try {
      
      final username = event.username;
      final email = event.email;
      final password = event.password;

      final bool passwordValid =
          RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
              .hasMatch(password);

      final bool emailValid =
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(email);

      if (!passwordValid) {
        return emit(
          RegisterFailure(
              'Password tidak sesuai format: minimal 1 lower case, 1 Uppercase, 1 angka, 1 character khusus dan minimal 6 karakter.'),
        );
      }

      if (!emailValid) {
        return emit(RegisterFailure('Email tidak sesuai format contoh@xmail.co.id'));
      }

      if (username.length < 6) {
        return emit(RegisterFailure('Username harus lebih dari 6 karakter.'));
      }


      await Future.delayed(const Duration(seconds: 2), () {
        return emit(
            RegisterSuccess(uid: '$email-$password')); // nyatanya UID didapat dari BE.
      });
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
