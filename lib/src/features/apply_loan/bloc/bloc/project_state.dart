part of 'project_bloc.dart';

abstract class ProjectState extends Equatable {
  const ProjectState();
  
  @override
  List<Object> get props => [];
}

class ProjectInitial extends ProjectState {}

class gettingproject extends ProjectState {}


class success extends ProjectState {}


class Errorget extends ProjectState {}
