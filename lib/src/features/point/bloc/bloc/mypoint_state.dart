part of 'mypoint_bloc.dart';

abstract class MypointState extends Equatable {
  const MypointState();
  
  @override
  List<Object> get props => [];
}

class MypointInitial extends MypointState {}

class GettingPoint extends MypointState {}

class GettedPoint extends MypointState {}

class ErrorGetPoint extends MypointState {
  final String e;
  ErrorGetPoint({required this.e});
}

class Reloading extends MypointState{}

class End extends MypointState{}