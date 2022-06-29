
import 'package:anakut_bank/src/features/cash_out/repository/transaction_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_cashout_event.dart';
part 'create_cashout_state.dart';

class CreateCashoutBloc extends Bloc<CreateCashoutEvent, CreateCashoutState> {
  CreateCashoutBloc() : super(CreateCashoutInitial());
  TransactionCashOutRepository transactionCashOutRepository =
      TransactionCashOutRepository();

  @override
  Stream<CreateCashoutState> mapEventToState(CreateCashoutEvent event) async* {
    if (event is CreatePress) {
      yield CreatingCashout();
      try {
        Future.delayed(Duration(microseconds: 200));
        await transactionCashOutRepository.CreateCashout(
            currency_id: event.currency_id,
            transaction_reference: event.transaction_reference,
            amount: event.amount,
            sender_phone: event.sender_phone,
            receiver_phone: event.receiver_phone);
        yield CreatedCashout();
      } catch (e) {
        print(e.toString());
        yield ErrorCreateCashout(e: e.toString());
      }
    }
  }
}
