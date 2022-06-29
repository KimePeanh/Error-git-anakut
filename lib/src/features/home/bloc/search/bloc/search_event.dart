part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  SearchEvent([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class SearchStarted extends SearchEvent {
  final String query;

  SearchStarted({required this.query});
}
