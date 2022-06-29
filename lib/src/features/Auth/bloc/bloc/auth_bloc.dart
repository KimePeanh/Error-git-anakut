import 'package:anakut_bank/src/features/Auth/repository/auth_repo.dart';
import 'package:anakut_bank/src/features/login/bloc/bloc/index.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Authenticating());
  AuthRepository _authRepository = AuthRepository();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is CheckingAuthenticationStarted) {
      yield Authenticating();
      String? _token = await _authRepository.getToken();
      if (_token == null) {
        yield NotAuthenticated();
      } else {
        ApiProvider.accessToken = _token;
        print(_token);
        yield Authenticated(token: _token);
      }
    }
    if (event is AuthenticationStarted) {
      yield Authenticating();
      await _authRepository.saveToken(token: event.token);
      ApiProvider.accessToken = event.token;
      print(event.token);
      yield Authenticated(token: event.token);
    }
    if (event is LogoutPressed) {
      yield LoggingOut();
      await _authRepository.removeToken();
      ApiProvider.accessToken = "";
      await Future.delayed(Duration(seconds: 1));
      yield NotAuthenticated();
    }
  }
}
