part of 'cate_detail_bloc.dart';

abstract class CateDetailState extends Equatable {
  const CateDetailState();

  @override
  List<Object> get props => [];
}

class CateDetailInitial extends CateDetailState {}

class FetchingCateDetail extends CateDetailState {}

class ErrorCateDetail extends CateDetailState {}

class FetchedCateDetail extends CateDetailState {}

class EndofCateDetail extends CateDetailState {}

class Refreshing extends CateDetailState {}

class Deleting extends CateDetailState {}

class Deleted extends CateDetailState {}

class ErrorDelete extends CateDetailState {
  final String e;
  ErrorDelete({required this.e});
}

class Editing extends CateDetailState {}

class Edited extends CateDetailState {}

class ErrorEdit extends CateDetailState {
  final String e;
  ErrorEdit({required this.e});
}
