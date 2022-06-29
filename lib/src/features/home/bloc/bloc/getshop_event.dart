part of 'getshop_bloc.dart';

abstract class GetshopEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// class GetShopStarted extends GetshopEvent {}

class GetShopByIdStarted extends GetshopEvent {
  final int id;
  GetShopByIdStarted({required this.id});
}
class InitializeShop extends GetshopEvent {}

class FetchShop extends GetshopEvent {}

class RefreshShop extends GetshopEvent{}
class FetchAllShop extends GetshopEvent{}