part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class Initializing extends LoginState {}

class Logged extends LoginState {
  final UserModel userModel;
  Logged({required this.userModel});
}

class Googlelog extends LoginState {
  final LoginResponModel loginResponModel;
  // final String token;
  // final String veryStatus;
  Googlelog({required this.loginResponModel});
}

class Logging extends LoginState {}

class ErrorLogin extends LoginState {
  final dynamic error;
  ErrorLogin({@required this.error});
}
