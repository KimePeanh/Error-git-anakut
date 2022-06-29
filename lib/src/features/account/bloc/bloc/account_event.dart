part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  AccountEvent([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class FetchAccountStarted extends AccountEvent{}
