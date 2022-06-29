import 'package:anakut_bank/src/features/account/model/account_model.dart';
import 'package:anakut_bank/src/features/account/repository/account_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountRepository _accountRepository = AccountRepository();
  AccountModel? accountModel;

  @override
  AccountBloc() : super(FetchingAccount());

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    if (event is FetchAccountStarted) {
      yield FetchingAccount();
      try {
        Future.delayed(Duration(microseconds: 200));
        accountModel = await _accountRepository.getUserData();
        yield FetchedAccount();
      } catch (e) {
        print(e);
        yield ErrorFetchAccount(error: e.toString());
      }
    }
  }
}
