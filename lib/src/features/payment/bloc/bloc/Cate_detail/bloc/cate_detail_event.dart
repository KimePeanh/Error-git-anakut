part of 'cate_detail_bloc.dart';

abstract class CateDetailEvent extends Equatable {
  const CateDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchCateDetailStarted extends CateDetailEvent {
  final int id;
  FetchCateDetailStarted({required this.id});
}

class RefreshCate extends CateDetailEvent {
  final int id;
  RefreshCate({required this.id});
}

class DeletePress extends CateDetailEvent {
  final int id;
  DeletePress({required this.id});
}

class EditPress extends CateDetailEvent {
  final int id;
  final String name;
  final String logo;
  final int com_id;
  final String code;

  EditPress(
      {required this.id,
      required this.name,
      required this.logo,
      required this.com_id,
      required this.code});
}
