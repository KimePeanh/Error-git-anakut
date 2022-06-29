import 'package:anakut_bank/src/features/payment/repository/payment_his_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_history_event.dart';
part 'create_history_state.dart';

class CreateHistoryBloc extends Bloc<CreateHistoryEvent, CreateHistoryState> {
  CreateHistoryBloc() : super(CreateHistoryInitial());
  PaymentHistoryRepository paymentHistoryRepository =
      PaymentHistoryRepository();

  @override
  Stream<CreateHistoryState> mapEventToState(CreateHistoryEvent event) async* {
    if (event is CreatePress) {
      yield CreatingHistory();
      try {
        await paymentHistoryRepository.create_history(
            counter_id: event.counter_id,
            currency_id: event.currency_id,
            amount: event.amount,
            note: event.note);
        yield CreatedHistory();
      } catch (e) {
        print(e.toString());
        yield ErrorCreateHistory(error: e.toString());
      }
    }
  }
}
