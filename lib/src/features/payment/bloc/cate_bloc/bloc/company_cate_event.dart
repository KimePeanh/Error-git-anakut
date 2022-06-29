part of 'company_cate_bloc.dart';

abstract class CompanyCateEvent extends Equatable {
  const CompanyCateEvent();

  @override
  List<Object> get props => [];
}


class FetchCateStarted extends CompanyCateEvent{}

class RefreshCate extends CompanyCateEvent{}


class Loading extends CompanyCateEvent{}

