import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  void _onLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 2), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      return emit(AuthFailure("gagal logout"));
    }
  }

  void _onLoginRequested(AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final username = event.username;
      final password = event.password;

      final bool passwordValid =
          RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
              .hasMatch(password);

      if (username.length < 6) {
        return emit(AuthFailure('Username harus lebih dari 6 karakter.'));
      }

      if (!passwordValid) {
        return emit(
          AuthFailure(
              'Password tidak sesuai format: minimal 1 lower case, 1 Uppercase, 1 angka, 1 character khusus dan minimal 6 karakter.'),
        );
      }

      await Future.delayed(const Duration(seconds: 2), () {
        return emit(
            AuthSuccess(uid: '$username-$password')); // nyatanya UID didapat dari BE.
      });
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
