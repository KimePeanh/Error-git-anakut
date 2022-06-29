import 'package:anakut_bank/src/features/payment/model/cate_model.dart';
import 'package:anakut_bank/src/features/payment/repository/company_categorise.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'company_cate_event.dart';
part 'company_cate_state.dart';

class CompanyCateBloc extends Bloc<CompanyCateEvent, CompanyCateState> {
  CompanyCateBloc() : super(FetchingCate());

  CompanyCateRepository cateRepository = CompanyCateRepository();
  List<CompanyCateModel> Cate = [];
  late int page;
  int rowperpage = 12;

  @override
  Stream<CompanyCateState> mapEventToState(CompanyCateEvent event) async* {
    if (event is FetchCateStarted) {
      yield FetchingCate();
      try {
        Cate.clear();
        page = 1;

        Future.delayed(Duration(microseconds: 200));

        Cate = await cateRepository.getCompanyCate(page: page, rpp: rowperpage);
        print(Cate.length);
        page++;
        yield FetchedCate();
      } catch (e) {
        print(e.toString());
        yield ErrorFetchCate(e: e.toString());
      }
    }

    if (event is RefreshCate) {
      yield Refreshing();
      try {
        Future.delayed(Duration(microseconds: 200));
        List<CompanyCateModel> _temp =
            await cateRepository.getCompanyCate(page: page, rpp: rowperpage);
        Cate.addAll(_temp);
        page++;
        print(Cate.length);
        if (_temp.length < rowperpage) {
          yield EndCate();
        } else {
          yield FetchedCate();
        }
      } catch (e) {
        print(e.toString());
        yield ErrorFetchCate(e: e.toString());
      }
    }
    if (event is Loading) {
      yield loading();
      try {
        Future.delayed(Duration(microseconds: 200));
        page = 1;
        Cate.clear();
        List<CompanyCateModel> _temp =
            await cateRepository.getCompanyCate(page: page, rpp: rowperpage);
        Cate.addAll(_temp);
        page++;
        yield FetchedCate();
      } catch (e) {
        print(e.toString());
        yield ErrorFetchCate(e: e.toString());
      }
    }
  }
}
