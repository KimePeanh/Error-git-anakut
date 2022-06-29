part of 'mypoint_bloc.dart';

abstract class MypointEvent extends Equatable {
  const MypointEvent();

  @override
  List<Object> get props => [];
}


class GettingPointStarted extends MypointEvent{}

class Reload extends MypointEvent{}