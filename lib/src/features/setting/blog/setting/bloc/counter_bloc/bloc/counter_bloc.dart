import 'package:anakut_bank/src/features/setting/model/counter_model.dart';
import 'package:anakut_bank/src/features/setting/repository/counter_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterRepository _counterRepository = CounterRepository();
  CounterModel? counterModel;
  Counter_Balance_Model? counter_balance_model;
  List<CounterModel> getCounter = [];
  List<Counter_Balance_Model> getCounterBalance = [];
  @override
  CounterBloc() : super(CounterInitial());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is FetchCounterStarted) {
      yield FetchingCounter();
      try {
        int page = 1;
        getCounter.clear();
        Future.delayed(Duration(microseconds: 200));
        List<CounterModel> _temp =
            await _counterRepository.getCounter(page: page);
        getCounter.addAll(_temp);
        // List<Counter_Balance_Model> _bal =
        //     await _counterRepository.getCounterBalance(page: page);
        // getCounterBalance.addAll(_bal);
        print(getCounter.length);
        //  print(getCounterBalance.length);
        page++;
        yield FetchedCounter();
      } catch (e) {
        print(e.toString());
        yield ErrorFetchingCounter(e: e.toString());
      }
    }
  }
}
