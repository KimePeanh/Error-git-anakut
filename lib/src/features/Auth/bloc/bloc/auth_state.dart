part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final String token;

  @override
  List<Object> get props => [];
  AuthState({required this.token});
}

class Authenticated extends AuthState {
  final String token;
  Authenticated({required this.token}) : super(token: token);
}

class Authenticating extends AuthState {
  Authenticating() : super(token: "");
}

class NotAuthenticated extends AuthState {
  NotAuthenticated() : super(token: "");
}

class ErrorAuthentication extends AuthState {
  ErrorAuthentication({required this.error}) : super(token: "");
  final String? error;
}

class LoggingOut extends AuthState {
  LoggingOut() : super(token: "");
}

class Loggedout extends AuthState {
  Loggedout() : super(token: "");
}
