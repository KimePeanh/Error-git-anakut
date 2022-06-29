import 'package:anakut_bank/src/features/payment/model/cate_model.dart';
import 'package:anakut_bank/src/features/payment/repository/company_categorise.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cate_detail_event.dart';
part 'cate_detail_state.dart';

class CateDetailBloc extends Bloc<CateDetailEvent, CateDetailState> {
  CateDetailBloc() : super(CateDetailInitial());

  CompanyCateRepository cateRepository = CompanyCateRepository();
  List<CateDetail> DetailList = [];
  late int page;
  int rpp = 8;

  @override
  Stream<CateDetailState> mapEventToState(CateDetailEvent event) async* {
    if (event is FetchCateDetailStarted) {
      yield FetchingCateDetail();
      try {
        DetailList.clear();
        page = 1;
        Future.delayed(Duration(microseconds: 200));
        DetailList = await cateRepository.getCatebyId(
            page: page, rrp: rpp, category_id: event.id);
        page++;
        print(DetailList.length);
        yield FetchedCateDetail();
      } catch (e) {
        print(e.toString());
        yield ErrorCateDetail();
      }
    }

    if (event is RefreshCate) {
      yield Refreshing();
      try {
        Future.delayed(Duration(microseconds: 200));
        List<CateDetail> _temp = await cateRepository.getCatebyId(
            page: page, rrp: rpp, category_id: event.id);
        DetailList.addAll(_temp);
        page++;
        if (_temp.length < rpp) {
          yield EndofCateDetail();
        } else {
          yield FetchedCateDetail();
        }
      } catch (e) {
        print(e.toString());
        yield ErrorCateDetail();
      }
    }

    if (event is DeletePress) {
      yield Deleting();
      try {
        await cateRepository.DeleteCompany(id: event.id);
        yield Deleted();
      } catch (e) {
        print(e.toString());
        yield ErrorDelete(e: e.toString());
      }
    }

    if (event is EditPress) {
      yield Editing();
      try {
        await cateRepository.EditCompany(
            id: event.id,
            company_name: event.name,
            company_logo: event.logo,
            category_id: event.com_id,
            company_code: event.code);
        yield Edited();
      } catch (e) {
        print(e.toString());
        yield ErrorEdit(e: e.toString());
      }
    }
  }
}
