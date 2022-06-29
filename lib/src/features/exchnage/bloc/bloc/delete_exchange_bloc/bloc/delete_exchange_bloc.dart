import 'package:anakut_bank/src/features/exchnage/repository/delete_exchange_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_exchange_event.dart';
part 'delete_exchange_state.dart';

class DeleteExchangeBloc
    extends Bloc<DeleteExchangeEvent, DeleteExchangeState> {
  DeleteExchangeBloc() : super(DeleteExchangeInitial());

  DeleteExRepository _deleteExRepository = DeleteExRepository();

  @override
  Stream<DeleteExchangeState> mapEventToState(
      DeleteExchangeEvent event) async* {
    if (event is DeletePress) {
      yield Deleting();
      try {
        await _deleteExRepository.DeleteExchange(id: event.id);
        yield Deleted();
      } catch (e) {
        print(e.toString());
        yield ErrorDelete(e.toString());
      }
    }
  }
}
