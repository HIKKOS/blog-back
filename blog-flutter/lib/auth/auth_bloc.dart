import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog/utils/preferences.dart';
import 'package:blog/utils/repository.interface.dart';
import 'package:equatable/equatable.dart';
import 'package:blog/config/consts/submission_status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<CorreoChanged>(_onUserNameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<OnLogIn>(_onLogIn);
    on<OnLogOut>(_onLogOut);
    on<ClearLoginFields>(_onClearLoginFields);
  }
  _onUserNameChanged(CorreoChanged event, Emitter<AuthState> emit) {
    final newState = state.copyWith(mail: event.correo);
    emit(newState);
  }

  _onPasswordChanged(PasswordChanged event, Emitter<AuthState> emit) {
    final newState = state.copyWith(password: event.password);
    emit(newState);
  }

  _onLogIn(OnLogIn event, Emitter<AuthState> emit) async {
    emit(state.copyWith(formStatus: const Submitting()));
    final repository = event.authRepository;

    final result =
        await repository.login(email: state.mail!, password: state.password!);
    result.when(
      success: (data) {
        emit(state.copyWith(formStatus: Success(result: data)));
      },
      failure: (error) {
        emit(state.copyWith(formStatus: Failed(error)));
      },
    );
  }

  _onRegister(OnRegister event, Emitter<AuthState> emit) async {
    emit(state.copyWith(formStatus: const Submitting()));
    final repository = event.authRepository;

    final result = await repository.register(
        userName: state.mail!, email: state.mail!, password: state.password!);
    result.when(
      success: (data) {
        emit(state.copyWith(formStatus: Success(result: data)));
      },
      failure: (error) {
        emit(state.copyWith(formStatus: Failed(error)));
      },
    );
  }

  _onLogOut(OnLogOut event, Emitter<AuthState> emit) async {
    await await Future.delayed(const Duration(seconds: 1));
    Preferences.isUserLogged = false;
    Preferences.apiKey = null;
    Preferences.databaseId = null;

    emit(const AuthState());
  }

  _onClearLoginFields(ClearLoginFields event, Emitter<AuthState> emit) {
    emit(const AuthState());
  }
}
