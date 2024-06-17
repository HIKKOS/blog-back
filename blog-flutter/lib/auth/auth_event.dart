part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class CorreoChanged extends AuthEvent {
  final String? correo;
  const CorreoChanged({this.correo});
}

class PasswordChanged extends AuthEvent {
  final String? password;
  const PasswordChanged({this.password});
}

class OnLogIn<T> extends AuthEvent {
  final IAuthReposotory<T> authRepository;
  const OnLogIn({required this.authRepository});
}

class OnLogOut extends AuthEvent {
  const OnLogOut();
}

class ClearLoginFields extends AuthEvent {
  const ClearLoginFields();
}

class SubmittedFailed extends AuthEvent {
  final FormSubmissionStatus formStatus;
  final Exception exception;
  SubmittedFailed(this.exception) : formStatus = Failed(exception);
}
