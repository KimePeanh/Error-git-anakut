import 'package:anakut_bank/src/features/exchnage/repository/exchange_repository.dart';
import 'package:anakut_bank/src/features/transfer/model/transfer_model.dart';
import 'package:anakut_bank/src/features/transfer/transfer_repository/transfer_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferModel? transferModel;
  List<TransferModel> namee = [];
  OverseaRepository overseaRepository = OverseaRepository();

  @override
  TransferBloc() : super(FetchingTra());
  @override
  Stream<TransferState> mapEventToState(TransferEvent event) async* {
    if (event is StartedFetchTra) {
      yield FetchingTra();
      try {
        namee.clear();
        Future.delayed(Duration(microseconds: 200));
        int page = 1;
        List<TransferModel> _temp = await overseaRepository.getname(page: page);
        namee.addAll(_temp);
        print(namee);
        page++;
        print(namee.length);
        yield FetchedTra();
      } catch (e) {
        print(e);
        yield ErrorTra(error: e.toString());
      }
    }
  }
}
