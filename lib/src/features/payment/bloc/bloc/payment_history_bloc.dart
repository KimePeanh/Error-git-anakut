import 'package:anakut_bank/src/features/payment/model/payment_history_model.dart';
import 'package:anakut_bank/src/features/payment/repository/payment_his_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_history_event.dart';
part 'payment_history_state.dart';

class PaymentHistoryBloc
    extends Bloc<PaymentHistoryEvent, PaymentHistoryState> {
  PaymentHistoryBloc() : super(PaymentHistoryInitial());

  PaymentHistoryRepository _paymentHistoryRepository =
      PaymentHistoryRepository();
  List<PaymentHistoryModel> listhistory = [];
  late int page;
  int rowperpage = 8;

  @override
  Stream<PaymentHistoryState> mapEventToState(
      PaymentHistoryEvent event) async* {
    // if (event is FetchPaymentHistoryStarted) {
    //   yield FetchingPaymentHistory();
    //   try {
    //     listhistory.clear();
    //     page = 1;
    //     Future.delayed(Duration(microseconds: 200));
    //     List<PaymentHistoryModel> _temp = await _paymentHistoryRepository
    //         .getPaymentHistory(page: page, rowperpage: rowperpage);
    //     listhistory.addAll(_temp);
    //     page++;
    //     print(listhistory.length);
    //     yield FetchedPaymentHistory();
    //   } catch (e) {
    //     print(e.toString());
    //     yield ErrorPaymentHistory(e: e.toString());
    //   }
    // }
    // if (event is Refresh) {
    //   yield Refreshing();
    //   try {
    //     Future.delayed(Duration(microseconds: 200));
    //     List<PaymentHistoryModel> _temp = await _paymentHistoryRepository
    //         .getPaymentHistory(page: page, rowperpage: rowperpage);
    //     listhistory.addAll(_temp);
    //     print(rowperpage);
    //     print(listhistory.length);
    //     page++;
    //     if (_temp.length < rowperpage) {
    //       yield End();
    //     } else {
    //       yield FetchedPaymentHistory();
    //     }
    //   } catch (e) {
    //     print(e.toString());
    //     yield ErrorPaymentHistory(e: e.toString());
    //   }
    // }

    if (event is FetchPaymentHistoryStarted) {
      yield FetchingPaymentHistory();
      try {
        listhistory.clear();
        page = 1;
        List<PaymentHistoryModel> _temp = await _paymentHistoryRepository.getPaymentHistory(
            page: page, rowperpage: rowperpage);
        listhistory.addAll(_temp);
        page++;
        yield FetchedPaymentHistory();
      } catch (e) {
        print(e.toString());
        yield ErrorPaymentHistory(e: e.toString());
      }
    }
    if (event is RefreshHis) {
      yield Refreshing();
      try {
        List<PaymentHistoryModel> _temp = await _paymentHistoryRepository
            .getPaymentHistory(page: page, rowperpage: rowperpage);
        listhistory.addAll(_temp);
        page++;
        if (_temp.length < rowperpage) {
          yield End();
        } else {
          yield FetchedPaymentHistory();
        }
      } catch (e) {
        print(e.toString());
        yield ErrorPaymentHistory(e: e.toString());
      }
    }
  }
}
