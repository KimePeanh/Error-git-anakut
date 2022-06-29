part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class Searching extends SearchState {
  final bool isInitiallySearch;
  Searching({this.isInitiallySearch = true});
}

class Searched extends SearchState {}

class ErrorSearching extends SearchState {
  final String error;
  ErrorSearching({required this.error});
}

