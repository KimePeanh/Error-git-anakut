import 'package:anakut_bank/src/features/Shop/screen/shopScreen.dart';
import 'package:anakut_bank/src/features/home/bloc/bloc/getshop_bloc.dart';
import 'package:anakut_bank/src/features/home/bloc/search/bloc/search_bloc.dart';
import 'package:anakut_bank/src/features/home/model/shop_model.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class Shop extends StatefulWidget {
  //const Shop({Key? key}) : super(key: key);
  //final ShopModel shopModel;

  // Shop({required this.shopModel});

  @override
  State<Shop> createState() => _ShopState();
}
List<String> cover = [
  "assets/images/Bank/interior-shot-cafe-with-chairs-near-bar-with-wooden-tables.jpg",
  "assets/images/Bank/hand-barista-making-coffee-using-coffee-machine-cafe.jpg",
  "assets/images/Bank/bookshelf-books-education-knowledge-study.jpg",
];

class _ShopState extends State<Shop> {
  bool _enabled = true;
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetshopBloc>(context).add(InitializeShop());
    // print(widget.shopModel.name);
    return BlocConsumer<GetshopBloc, GetshopState>(
      builder: (context, state) {
      if (state is GetShopInitializing) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade100,
          enabled: _enabled,
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                margin: EdgeInsets.only(bottom: 15),
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 3),
                          blurRadius: 10)
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width - 20,
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 3),
                                blurRadius: 10)
                          ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),

                    Expanded(
                        child: Container(
                      child: Row(
                        children: <Widget>[],
                      ),
                    ))
                    //Container(height: 1, color: mainColor,),
                  ],
                ),
              ),
            ),
            itemCount: BlocProvider.of<GetshopBloc>(context).Shop.length,
          ),
        );
      }
      if (state is ErrorInitializingShop) {
        return Center(
          child: Text(state.error.toString()),
        );
      }
      print("add data ${BlocProvider.of<GetshopBloc>(context).Shop.length}");
      print(state);
      return SmartRefresher(
          cacheExtent: 1,
          // cacheExtent: 500,
          physics: AlwaysScrollableScrollPhysics(),
          onRefresh: () {
            BlocProvider.of<GetshopBloc>(context).add(FetchShop());
          },
          onLoading: () {
            if (BlocProvider.of<GetshopBloc>(context).state is EndOfShop) {
            } else {
              BlocProvider.of<GetshopBloc>(context).add(FetchShop());
            }
          },
          enablePullDown: true,
          enablePullUp: true,
          controller: _refreshController,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: BlocProvider.of<GetshopBloc>(context).Shop.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    margin: EdgeInsets.only(bottom: 15),
                    //height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 3),
                              blurRadius: 10)
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width - 20,
                          //height: MediaQuery.of(context).size.height * 0.18,
                          child: BlocProvider.of<GetshopBloc>(context)
                                      .Shop[index]
                                      .cover_url ==
                                  "https://system.anakutapp.com/assets/uploads/none.jpg"
                              ? Container(
                                  // decoration: BoxDecoration(
                                  //     border: Border.all(color: Colors.red)),
                                  child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/Bank/interior-shot-cafe-with-chairs-near-bar-with-wooden-tables.jpg")))
                              : Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      BlocProvider.of<GetshopBloc>(context)
                                          .Shop[index]
                                          .cover_url!)),
                        ),
                        //Container(height: 1, color: mainColor,),
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              child: BlocProvider.of<GetshopBloc>(context)
                                          .Shop[index]
                                          .image_url ==
                                      null
                                  ? Image.asset("assets/images/shop.png")
                                  : CircleAvatar(
                                      backgroundColor: white,
                                      backgroundImage: NetworkImage(
                                          BlocProvider.of<GetshopBloc>(context)
                                              .Shop[index]
                                              .image_url!)),
                            ),
                            title: Text(
                              BlocProvider.of<GetshopBloc>(context)
                                  .Shop[index]
                                  .name!,
                              style: TextStyle(
                                  fontFamily: 'kh',
                                  fontSize: 17,
                                  fontWeight: bold),
                            ),
                            subtitle: Container(
                              child: Row(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 20,
                                        color: grey,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        BlocProvider.of<GetshopBloc>(context)
                                            .Shop[index]
                                            .distance!,
                                        style: TextStyle(
                                            fontSize: 17, fontWeight: bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    BlocProvider.of<GetshopBloc>(context)
                                            .Shop[index]
                                            .points! +
                                        " pt",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: bold,
                                        color: mainColor),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    BlocProvider.of<GetshopBloc>(context)
                                        .Shop[index]
                                        .percentage!,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: bold,
                                        color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    print(BlocProvider.of<GetshopBloc>(context).Shop[index].id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShopScreen(
                                id: BlocProvider.of<GetshopBloc>(context)
                                    .Shop[index]
                                    .id!)));
                  },
                );
              }));
    }, listener: (context, state) {
      if (state is FetchedShop) {
        _refreshController.loadComplete();
        _refreshController.refreshCompleted();
      }
      if (state is EndOfShop) {
        _refreshController.loadNoData();
      }
    });
  }
}
