import 'dart:developer';

import 'package:anakut_bank/src/features/home/model/shop_model.dart';
import 'package:anakut_bank/src/features/home/repository/getShop_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'getshop_event.dart';
part 'getshop_state.dart';

class GetshopBloc extends Bloc<GetshopEvent, GetshopState> {
  GetshopBloc() : super(GetShopInitializing());
  GetShopRepository _getShopRepository = GetShopRepository();
  ShopModel? shopModel;
  List<ShopModel> Shop = [];
  List<ShopModel> ShopById = [];
  late int page;
  int rowperpage = 8;

  @override
  Stream<GetshopState> mapEventToState(GetshopEvent event) async* {
    if (event is InitializeShop) {
      yield GetShopInitializing();
      try {
        page = 1;
        Shop = await _getShopRepository.GetShop(
            page: page, rowperpage: rowperpage);
        page++;
        print(page.toString());
        print(rowperpage.toString());
        print(Shop.length);
        yield GetShopInitialized();
      } catch (e) {
        print(e.toString());
        yield ErrorInitializingShop(error: e.toString());
      }
    }
    if (event is FetchAllShop) {
      yield GetShopInitializing();
      try {
        page = 1;
        Shop = await _getShopRepository.GetShop(page: page, rowperpage: 300);
        page++;
        print(page.toString());
        print(rowperpage.toString());
        print(Shop.length);
        yield GetShopInitialized();
      } catch (e) {
        print(e.toString());
        yield ErrorInitializingShop(error: e.toString());
      }
    }

    if (event is FetchShop) {
      yield FetchingShop();
      try {
        print(page);
        List<ShopModel> _temp = await _getShopRepository.GetShop(
            page: page, rowperpage: rowperpage);
        Shop.addAll(_temp);
        print(Shop.length);
        page++;
        print(page.toString());
        print(rowperpage.toString());
        print(Shop.length);
        if (_temp.length < rowperpage) {
          print(Shop.length);
          yield EndOfShop();
        } else {
          yield FetchedShop();
        }
        //yield FetchedShop();
      } catch (e) {
        print(e.toString());
        yield ErrorInitializingShop(error: e.toString());
      }
    }
    if (event is RefreshShop) {
      yield FetchingShop();
      try {
        print(page);
        if (Shop.length != 0) {
          Shop.clear();
        }
        page = 1;
        List<ShopModel> _temp = await _getShopRepository.GetShop(
            page: page, rowperpage: rowperpage);
        Shop.addAll(_temp);
        print(Shop.length);
        page++;
        print(page.toString());
        print(rowperpage.toString());
        print(Shop.length);
        yield FetchedShop();
        //yield FetchedShop();
      } catch (e) {
        print(e.toString());
        yield ErrorInitializingShop(error: e.toString());
      }
    }
  }
  // @override
  // Stream<GetshopState> mapEventToState(GetshopEvent event) async* {
  //   if (event is GetShopStarted) {
  //     yield GettingShop();
  //     try {
  //       Shop.clear();
  //       page = 1;
  //       Future.delayed(Duration(milliseconds: 200));
  //       List<ShopModel> _tempResult = await _getShopRepository.GetShop(
  //           page: page, rowperpage: rowperpage);
  //       Shop.addAll(_tempResult);
  //       page++;
  //       print(Shop.length);
  //       print("jjjjjjjjjjjjjjjjjjjj");
  //       yield GettedShop();
  //     } catch (e) {
  //       print(e);
  //       yield ErrorGettingShop(error: e);
  //     }
  //   }

  //   if (event is GetShopByIdStarted) {
  //     yield GettingShop();
  //     try {
  //       //ShopById.clear();
  //       Future.delayed(Duration(milliseconds: 200));
  //       print(event.id);
  //       shopModel = await _getShopRepository.getShopById(id: event.id);

  //       print(shopModel!.name);
  //       yield GettedShop();
  //     } catch (e) {
  //       log(e.toString());
  //       print(e);
  //       yield ErrorGettingShop(error: e.toString());
  //     }
  //   }
  // }
}
