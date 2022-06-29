import 'package:anakut_bank/src/features/setting/model/item_loan_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/item_loan_repository.dart';

part 'loan_event.dart';
part 'loan_state.dart';

class LoanBloc extends Bloc<LoanEvent, LoanState> {
  LoanBloc() : super(LoanInitial());
  List<ItemLoanModel> item_list = [];
  int rpp = 8;
  late int page;
  ItemLoanRepository itemLoanRepository = ItemLoanRepository();

  @override
  Stream<LoanState> mapEventToState(LoanEvent event) async* {
    if (event is GetItemStarted) {
      yield Gettingitem();
      try {
        page = 1;
        item_list = await itemLoanRepository.GetItemloan(rpp: rpp, page: page);
        page++;
        yield Getteditem();
      } catch (e) {
        yield ErrorGet();
        print(e.toString());
      }
    }

    if (event is Reload) {
      yield Reloading();
      try {
        List<ItemLoanModel> _temp =
            await itemLoanRepository.GetItemloan(rpp: rpp, page: page);
        item_list.addAll(_temp);
        if (_temp.length < rpp) {
          yield End();
        } else {
          yield Getteditem();
        }
      } catch (e) {
        yield ErrorGet();
      }
    }
  }
}
