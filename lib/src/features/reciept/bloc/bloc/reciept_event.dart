part of 'reciept_bloc.dart';

abstract class RecieptEvent extends Equatable {
  const RecieptEvent();

  @override
  List<Object> get props => [];
}

class FetchRecieptEven extends RecieptEvent {
  final int id;
  FetchRecieptEven({required this.id});
}
