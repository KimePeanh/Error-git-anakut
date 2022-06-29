import 'package:anakut_bank/src/features/cash_out/model/transaction_cash_out_model.dart';
import 'package:anakut_bank/src/features/cash_out/repository/transaction_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_cashout_event.dart';
part 'transaction_cashout_state.dart';

class TransactionCashoutBloc
    extends Bloc<TransactionCashoutEvent, TransactionCashoutState> {
  TransactionCashoutBloc() : super(TransactionCashoutInitial());
  TransactionCashOutRepository transactionCashOutRepository =
      TransactionCashOutRepository();
  late int page;
  int rpp = 8;
  List<TransactionModel> transaction = [];

  @override
  Stream<TransactionCashoutState> mapEventToState(
      TransactionCashoutEvent event) async* {
    if (event is FetchTransactionStarted) {
      yield FetchingTransaction();
      try {
        page = 1;
        transaction.clear();
        Future.delayed(Duration(microseconds: 200));
        transaction = await transactionCashOutRepository.GetTransaction(
            page: page, rpp: rpp);
        page++;
        yield FetchedTransaction();
      } catch (e) {
        yield ErrorFetchTransaction(e: e.toString());
        print(e.toString());
      }
    }

    if (event is Reload) {
      yield Refreshing();
      try {
        Future.delayed(Duration(microseconds: 200));
        List<TransactionModel> _temp =
            await transactionCashOutRepository.GetTransaction(
                page: page, rpp: rpp);
        transaction.addAll(_temp);
        if (_temp.length < rpp){
          yield EndOfTransaction();
        }else{
          yield FetchedTransaction();
        }
      } catch (e) {
        yield ErrorFetchTransaction(
          e: e.toString()
        );
        print(e.toString());
      }
    }
  }
}
