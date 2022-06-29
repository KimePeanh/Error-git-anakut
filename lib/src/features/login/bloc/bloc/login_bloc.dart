import 'package:anakut_bank/src/features/login/model/login_model.dart';
import 'package:anakut_bank/src/features/login/repository/login_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository _loginRepository = LoginRepository();
  LoginGoogleRepository _googleRepository = LoginGoogleRepository();
  UserModel? userModel;
  @override
  LoginBloc() : super(Initializing());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginPressed) {
      yield Logging();
      try {
        Future.delayed(Duration(microseconds: 200));
        final UserModel userModel = await _loginRepository.login(
            phone: event.phoneNumber, password: event.password);
        yield Logged(userModel: userModel);
      } catch (e) {
        print(e);
        yield ErrorLogin(error: e.toString());
      }
    }
    if (event is GoogleloginPress) {
      yield Logging();
      try {
        Future.delayed(Duration(microseconds: 200));
        print(event.token);
        final LoginResponModel loginResponModel  =
            await _googleRepository.loginGoogle(token: event.token);
        yield Googlelog(loginResponModel: loginResponModel);
      } catch (e) {
        print(e);
        yield ErrorLogin(error: e.toString());
      }
    }
  }
}
