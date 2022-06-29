import 'package:anakut_bank/src/features/reciept/model/reciept_model.dart';
import 'package:anakut_bank/src/features/reciept/repository/reciept_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reciept_event.dart';
part 'reciept_state.dart';

class RecieptBloc extends Bloc<RecieptEvent, RecieptState> {
  @override
  RecieptBloc() : super(RecieptInitial());
   RecieptModel? recieptModel;
  // RecieptModel? recieptModel;
  RecieptRepository _recieptRepository = RecieptRepository();

  @override
  Stream<RecieptState> mapEventToState(RecieptEvent event) async* {
    if (event is FetchRecieptEven) {
      yield FetchingReciept();
      try {
        Future.delayed(Duration(microseconds: 200));
        recieptModel = await _recieptRepository.getRecieptbyId(id: event.id);
        print(recieptModel);

        yield FetchedREciept();
      } catch (e) {
        print(e.toString());
        yield ErrorFetchReceipt(e: e.toString());
      }
    }
  }
}
