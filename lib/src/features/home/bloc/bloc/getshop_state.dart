part of 'getshop_bloc.dart';

abstract class GetshopState extends Equatable {
  const GetshopState();

  @override
  List<Object> get props => [];
}

// class InitializedGetShop extends GetshopState{}

// class GetshopInitial extends GetshopState {}

// class GettingShop extends GetshopState {}

// // ignore: must_be_immutable
// class GettedShop extends GetshopState {}

// class ErrorGettingShop extends GetshopState {
//   final dynamic error;
//   ErrorGettingShop({required this.error});
// }

// class EndOfShop extends GetshopState{}

// class ErrorInitializingShop extends GetshopState {
//   final String error;
//   ErrorInitializingShop({required this.error});
// }

class GetShopInitialized extends GetshopState{}

class GetShopInitializing extends GetshopState{}

class FetchingShop extends GetshopState {}

class FetchedShop extends GetshopState{}

class EndOfShop extends GetshopState{}

class ErrorFetchingShop extends GetshopState{
  final String error;
  ErrorFetchingShop({required this.error});
}

class ErrorInitializingShop extends GetshopState {
  final String error;
  ErrorInitializingShop({required this.error});
}


