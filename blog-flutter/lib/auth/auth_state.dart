part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String? username;
  final String? mail;
  final String? password;
  final FormSubmissionStatus formStatus;
  const AuthState({
    this.username = '',
    this.password = '',
    this.mail = '',
    this.formStatus = const Initial(),
  });

  AuthState copyWith({
    String? username,
    String? password,
    String? mail,
    FormSubmissionStatus? formStatus,
  }) {
    return AuthState(
      mail: username ?? this.username,
      password: password ?? this.password,
      username: mail ?? this.mail,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [username, password, formStatus];
}
