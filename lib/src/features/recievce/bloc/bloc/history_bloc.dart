import 'package:anakut_bank/src/features/recievce/model/transaction_history_model.dart';
import 'package:anakut_bank/src/features/recievce/repository/transaction_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial());
  late int page;
  int rpp = 8;
  List<TransctionHistoryModel> History = [];
  TransactionRepository transactionRepository = TransactionRepository();

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async*{
    if (event is GettingHistoryStarted){
      yield GettingHistory();
      try{
        History.clear();
        page = 1;
        Future.delayed(Duration(microseconds: 200));
        History = await transactionRepository.getTransacIn(page: page, rpp: rpp);
        page++;
        yield GettedHistory();
      }catch(e){
        print(e.toString());
        yield ErrorGettingHistory(e: e.toString());
      }
    }

    if (event is Reload){
      yield loading();
    try{
      Future.delayed(Duration(microseconds: 200));
      List<TransctionHistoryModel> _temp = await transactionRepository.getTransacIn(page: page, rpp: rpp);
      History.addAll(_temp);
      page++;
      if (rpp < History.length){
        yield End();
      }else{
        yield GettedHistory();
      }
    }catch(e){
      yield ErrorGettingHistory(e: e.toString());
    }
    }
  } 
  
  
}
