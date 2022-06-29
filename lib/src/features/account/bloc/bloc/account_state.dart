part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class FetchingAccount extends AccountState {}

class FetchedAccount extends AccountState {}

class ErrorFetchAccount extends AccountState {
  final String error;
  ErrorFetchAccount({required this.error});
}
