// ignore_for_file: unnecessary_null_comparison

import 'package:anakut_bank/app_localiztion.dart';
import 'package:anakut_bank/src/features/Shop/screen/shopScreen.dart';
import 'package:anakut_bank/src/features/home/bloc/bloc/getshop_bloc.dart';
import 'package:anakut_bank/src/features/home/screen/each_shop.dart';
import 'package:anakut_bank/src/features/menu/screen/shrimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants/app_constants.dart';
import 'marketplace.dart';

class Contents extends StatefulWidget {
  const Contents({Key? key}) : super(key: key);

  @override
  _ContentsState createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  final RefreshController _refreshController = RefreshController();
  List<String> MarketplaceImage = [
    "assets/images/aha.jpg",
    "assets/images/mall.jpg",
    "assets/images/phsarworld.jpg",
    "assets/images/fardin.jpg",
  ];
  List<String> MakrtplaceTittle = [
    "AHA",
    "Phsarmall",
    "Phsarworld",
    "Fardin Express",
  ];
  List<String> Link = [
    "https://play.google.com/store/apps/details?id=com.ahacambodia.anakutdigital",
    "https://play.google.com/store/apps/details?id=com.phsarmall.anakutdigital",
    "https://play.google.com/store/apps/details?id=com.phsarworld.anakutdigital",
    "https://play.google.com/store/apps/details?id=com.fardinexpress.anakutdigital"
  ];
  var CURRENCY_CODES = ["Nearby", "Discount", "Point"];
  String currency = "Nearby";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 30),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: white,
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.2),
            blurRadius: 14,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                  //color: Color(0xffFEF2D5),
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.translate('marketplace')!,
                    style: TextStyle(
                      fontFamily: 'kh',
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                MarketPlace(),
                SizedBox(
                  height: 5,
                ),
                Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.translate('earn')!,
                              style: TextStyle(fontFamily: 'kh'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Stack(children: [
                            PopupMenuButton(
                              onSelected: (c) {
                                setState(() {
                                  currency = c.toString();
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(currency),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                              itemBuilder: (context) => CURRENCY_CODES
                                  .map((c) =>
                                      PopupMenuItem(value: c, child: Text(c)))
                                  .toList(),
                            ),
                          ]),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Expanded(
            child: Shop(),
          )
        ],
      ),
    );
    // BlocProvider.of<GetshopBloc>(context).add(InitializeShop());
    return BlocBuilder<GetshopBloc, GetshopState>(builder: (context, state) {
      if (state is FetchingShop || state is GetShopInitializing) {
        return Container(
          padding: EdgeInsets.only(top: 10, bottom: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: white,
            boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.2),
                blurRadius: 14,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Container(
                      //color: Color(0xffFEF2D5),
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.translate('marketplace')!,
                        style: TextStyle(
                          fontFamily: 'kh',
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    MarketPlace(),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('earn')!,
                                  style: TextStyle(fontFamily: 'kh'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Stack(children: [
                                PopupMenuButton(
                                  onSelected: (c) {
                                    setState(() {
                                      currency = c.toString();
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(currency),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                  itemBuilder: (context) => CURRENCY_CODES
                                      .map((c) => PopupMenuItem(
                                          value: c, child: Text(c)))
                                      .toList(),
                                ),
                              ]),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
        );
      } else if (state is GetShopInitialized || state is FetchedShop) {
        return Container(
          padding: EdgeInsets.only(top: 10, bottom: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: white,
            boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.2),
                blurRadius: 14,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Container(
                      //color: Color(0xffFEF2D5),
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.translate('marketplace')!,
                        style: TextStyle(
                          fontFamily: 'kh',
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    MarketPlace(),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('earn')!,
                                  style: TextStyle(fontFamily: 'kh'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Stack(children: [
                                PopupMenuButton(
                                  onSelected: (c) {
                                    setState(() {
                                      currency = c.toString();
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(currency),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                  itemBuilder: (context) => CURRENCY_CODES
                                      .map((c) => PopupMenuItem(
                                          value: c, child: Text(c)))
                                      .toList(),
                                ),
                              ]),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Shop(),
              )
            ],
          ),
        );
      }
      return Text("data");
    });

    //BlocProvider.of<GetshopBloc>(context).add(InitializeShop());
    // return BlocListener<GetshopBloc, GetshopState>(listener: (c, state) {

    // });
    // return BlocBuilder<GetshopBloc, GetshopState>(builder: (context, state) {
    //   print(state);
    //   if (state is FetchedShop || state is GetShopInitialized) {
    //     // _refreshController.loadComplete();
    //     //   _refreshController.refreshCompleted();
    //     return Container(
    //       padding: EdgeInsets.only(top: 10, bottom: 30),
    //       width: MediaQuery.of(context).size.width,
    //       height: MediaQuery.of(context).size.height - 150,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    //         color: white,
    //         boxShadow: [
    //           BoxShadow(
    //             color: grey.withOpacity(0.2),
    //             blurRadius: 14,
    //             offset: Offset(0, -5),
    //           ),
    //         ],
    //       ),
    //       child: Column(
    //         children: <Widget>[
    //           SingleChildScrollView(
    //             physics: NeverScrollableScrollPhysics(),
    //             child: Column(
    //               children: <Widget>[
    //                 Container(
    //                   //color: Color(0xffFEF2D5),
    //                   padding: EdgeInsets.only(left: 20),
    //                   alignment: Alignment.centerLeft,
    //                   child: Text(
    //                     AppLocalizations.of(context)!.translate('marketplace')!,
    //                     style: TextStyle(
    //                       fontFamily: 'kh',
    //                     ),
    //                     textAlign: TextAlign.start,
    //                   ),
    //                 ),
    //                 MarketPlace(),
    //                 SizedBox(
    //                   height: 5,
    //                 ),
    //                 Container(
    //                     padding: EdgeInsets.only(left: 20, right: 20),
    //                     alignment: Alignment.center,
    //                     child: Row(
    //                       children: [
    //                         Expanded(
    //                           child: Container(
    //                             alignment: Alignment.centerLeft,
    //                             child: Text(
    //                               AppLocalizations.of(context)!
    //                                   .translate('earn')!,
    //                               style: TextStyle(fontFamily: 'kh'),
    //                             ),
    //                           ),
    //                         ),
    //                         Expanded(
    //                           child: Stack(children: [
    //                             PopupMenuButton(
    //                               onSelected: (c) {
    //                                 setState(() {
    //                                   currency = c.toString();
    //                                 });
    //                               },
    //                               child: Row(
    //                                 mainAxisAlignment: MainAxisAlignment.end,
    //                                 children: <Widget>[
    //                                   Text(currency),
    //                                   Icon(Icons.arrow_drop_down)
    //                                 ],
    //                               ),
    //                               itemBuilder: (context) => CURRENCY_CODES
    //                                   .map((c) => PopupMenuItem(
    //                                       value: c, child: Text(c)))
    //                                   .toList(),
    //                             ),
    //                           ]),
    //                         ),
    //                       ],
    //                     )),
    //               ],
    //             ),
    //           ),
    //           Expanded(
    //             child: Shop(),
    //           //     child: SingleChildScrollView(
    //           //   child: Column(
    //           //     children: [
    //           //       SmartRefresher(
    //           //         cacheExtent: 1,
    //           //         // cacheExtent: 500,
    //           //         physics: AlwaysScrollableScrollPhysics(),
    //           //         onRefresh: () {
    //           //           BlocProvider.of<GetshopBloc>(context)
    //           //               .add(InitializeShop());
    //           //         },
    //           //         onLoading: () {
    //           //           if (BlocProvider.of<GetshopBloc>(context).state
    //           //               is EndOfShop) {
    //           //           } else {
    //           //             BlocProvider.of<GetshopBloc>(context)
    //           //                 .add(FetchShop());
    //           //           }
    //           //         },
    //           //         enablePullDown: true,
    //           //         enablePullUp: true,
    //           //         controller: _refreshController,
    //           //         child: ListView.builder(
    //           //             physics: NeverScrollableScrollPhysics(),
    //           //             scrollDirection: Axis.vertical,
    //           //             shrinkWrap: true,
    //           //             itemCount:
    //           //                 BlocProvider.of<GetshopBloc>(context).Shop.length,
    //           //             itemBuilder: (context, index) {
    //           //               print(
    //           //                   "lenght ${BlocProvider.of<GetshopBloc>(context).Shop.length}");
    //           //               return Shop(
    //           //                   shopModel: BlocProvider.of<GetshopBloc>(context)
    //           //                       .Shop[index]);
    //           //               //return Container();
    //           //             }),
    //           //       )
    //           //       // ListView.builder(
    //           //       //     physics: NeverScrollableScrollPhysics(),
    //           //       //     scrollDirection: Axis.vertical,
    //           //       //     shrinkWrap: true,
    //           //       //     itemCount:
    //           //       //         BlocProvider.of<GetshopBloc>(context).Shop.length,
    //           //       //     itemBuilder: (context, index) {
    //           //       //       print(
    //           //       //           "lenght ${BlocProvider.of<GetshopBloc>(context).Shop.length}");
    //           //       //       return Shop(
    //           //       //           shopModel: BlocProvider.of<GetshopBloc>(context)
    //           //       //               .Shop[index]);
    //           //       //       //return Container();
    //           //       //     }),
    //           //     ],
    //           //   ),
    //           // )
    //           )
    //         ],
    //       ),
    //     );
    //   } else if (state is ErrorFetchingShop) {
    //     return Text(state.error.toString());
    //   }
    //   return Container(
    //     padding: EdgeInsets.only(top: 10, bottom: 30),
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height - 150,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    //       color: white,
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.grey.shade300.withOpacity(0.5),
    //           spreadRadius: 5,
    //           blurRadius: 6,
    //           offset: Offset(0, 4),
    //         ),
    //       ],
    //     ),
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           Container(
    //             //color: Color(0xffFEF2D5),
    //             padding: EdgeInsets.only(left: 20),
    //             alignment: Alignment.centerLeft,
    //             child: Text(
    //               AppLocalizations.of(context)!.translate('marketplace')!,
    //               style: TextStyle(
    //                 fontFamily: 'kh',
    //               ),
    //               textAlign: TextAlign.start,
    //             ),
    //           ),
    //           Container(
    //             height: 100,
    //             color: Color(0xffFEF2D5),
    //             //color: mainColor,
    //             child: Card(
    //               semanticContainer: true,
    //               //color: csblack,
    //               color: white,
    //               clipBehavior: Clip.antiAliasWithSaveLayer,
    //               child: ListView.builder(
    //                   scrollDirection: Axis.horizontal,
    //                   shrinkWrap: true,
    //                   itemCount: MarketplaceImage.length,
    //                   itemBuilder: (context, index) {
    //                     return Row(
    //                       children: [
    //                         Container(
    //                           width: 110,
    //                           //color: Color(0xffFEF2D5),
    //                           child: Column(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             children: [
    //                               Image(
    //                                   width: 40,
    //                                   height: 40,
    //                                   image:
    //                                       AssetImage(MarketplaceImage[index])),
    //                               Text(
    //                                 MakrtplaceTittle[index],
    //                                 style: TextStyle(fontFamily: 'kh'),
    //                               )
    //                             ],
    //                           ),
    //                         ),
    //                         Container(
    //                           width: 1,
    //                           height: 60,
    //                           color: Colors.grey.shade200,
    //                         )
    //                       ],
    //                     );
    //                   }),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 5,
    //           ),
    //           Container(
    //               padding: EdgeInsets.only(left: 20),
    //               alignment: Alignment.centerLeft,
    //               child: Text(
    //                 AppLocalizations.of(context)!.translate('earn')!,
    //                 style: TextStyle(fontFamily: 'kh'),
    //               )),
    //           Loadinggg()
    //         ],
    //       ),
    //     ),
    //   );
    // });
  }
}
