import 'package:anakut_bank/src/features/setting/model/currency_model.dart';
import 'package:anakut_bank/src/features/setting/repository/currency_repositort.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyRepository _currencyRepository = CurrencyRepository();
  CurrencyModel? currencyModel;
  List<CurrencyModel> getCurrency = [];
  late int page;
  int rowperpage = 8;
  @override
  CurrencyBloc() : super(FetchingCurrency());

  @override
  Stream<CurrencyState> mapEventToState(CurrencyEvent event) async* {
    if (event is FetchCurrencyStarted) {
      yield FetchingCurrency();
      try {
        getCurrency.clear();
        page = 1;
        Future.delayed(Duration(microseconds: 200));
        List<CurrencyModel> _tempresult =
            await _currencyRepository.getCurrency(page: page, rowperpage: rowperpage);
        getCurrency.addAll(_tempresult);
        page++;
        print(getCurrency.length);
        yield FetchedCurrency();
      } catch (e) {
        print(e.toString());
        yield ErrorFetchingCurrency(e: e.toString());
      }
    }
  }
}
