import 'package:anakut_bank/app_localiztion.dart';
import 'package:anakut_bank/src/features/home/bloc/bloc/getshop_bloc.dart';
import 'package:anakut_bank/src/features/home/model/shop_model.dart';
import 'package:anakut_bank/src/features/transfer/screen/transferScreen.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoiceScreen extends StatefulWidget {
  //const ChoiceScreen({Key? key}) : super(key: key);
  // final ShopModel shopModel;
  // ChoiceScreen({required this.shopModel});

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  List<String> title = [
    //"AHA Cambodia",
    "Galaxy Computer",
    "K Mart",
    "ABC Book",
    "Baby Mart Cambodia",
    "Lady Skin Care",
  ];
  List<String> Imagelist = [
    //"assets/images/aha.jpg",
    "assets/images/galaxy.jpg",
    "assets/images/kmart.jpg",
    "assets/images/abcbook.jpg",
    "assets/images/baby.png",
    "assets/images/ladyskincare.jpg",
  ];
  List<String> Point = ["5 pt", "7 pt", "1 pt", "3 pt", "5 pt"];

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     systemOverlayStyle: SystemUiOverlayStyle(
    //       statusBarColor: Colors.transparent,
    //       statusBarIconBrightness: Brightness.light,
    //     ),
    //     elevation: 0,
    //     toolbarHeight: 65,
    //     backgroundColor: mainColor,
    //     leading: IconButton(
    //         onPressed: () {
    //           Navigator.pop(context);
    //         },
    //         icon: Icon(
    //           Icons.arrow_back,
    //           color: white,
    //           size: 30,
    //         )),
    //     title: Text(
    //       AppLocalizations.of(context)!.translate('send')!,
    //       style: TextStyle(
    //           fontSize: 25,
    //           color: white,
    //           fontWeight: FontWeight.bold,
    //           fontFamily: 'kh'),
    //     ),
    //     centerTitle: true,
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.only(top: 30),
    //     child: ListView.builder(
    //         scrollDirection: Axis.vertical,
    //         shrinkWrap: true,
    //         itemCount: Imagelist.length,
    //         itemBuilder: (_, index) {
    //           return InkWell(
    //             child: Container(
    //               //alignment: Alignment.center,
    //               width: MediaQuery.of(context).size.width - 20,
    //               height: 100,
    //               child: Stack(
    //                 children: [
    //                   Card(
    //                     semanticContainer: true,
    //                     //color: csblack,
    //                     clipBehavior: Clip.antiAliasWithSaveLayer,
    //                     margin: EdgeInsets.only(right: 10, left: 10, top: 10),
    //                     child: Center(
    //                       child: ListTile(
    //                         leading: Image(
    //                           fit: BoxFit.cover,
    //                           image: AssetImage(Imagelist[index]),
    //                         ),
    //                         title: Text(title[index]),
    //                         //subtitle: Text(kilo[index])
    //                         //trailing: Icon(Icons.more_vert),
    //                       ),
    //                     ),
    //                   ),
    //                   Container(
    //                     width: MediaQuery.of(context).size.width - 10,
    //                     height: 120,
    //                     padding: EdgeInsets.only(bottom: 20),
    //                     alignment: Alignment.centerRight,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                         SizedBox(
    //                           height: 5,
    //                         ),
    //                         Container(
    //                           margin: EdgeInsets.only(left: 20),
    //                           alignment: Alignment.center,
    //                           width: 50,
    //                           height: 20,
    //                           decoration: BoxDecoration(
    //                             color: mainColor,
    //                             //borderRadius: BorderRadius.only(topLeft: Radius.circular(10))
    //                           ),
    //                           child: Text(
    //                             Point[index],
    //                             style:
    //                                 TextStyle(fontFamily: 'kh', color: white),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             onTap: () {
    //               Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                       builder: (context) => TransferScreen(index, "")));
    //             },
    //           );
    //         }),
    //   ),
    // );
    //BlocProvider.of<GetshopBloc>(context).add(GetShopStarted());
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        color: mainColor,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width - 100,
                              height: 50,
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('point')!,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: white,
                                    fontFamily: 'kh'),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 90,
                          margin: EdgeInsets.only(top: 130),
                          height: 38,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.3),
                                blurRadius: 9,
                                offset: Offset(3, 6), // Shadow position
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 5),
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                fillColor: white,
                                filled: true,
                                hintStyle:
                                    TextStyle(fontFamily: 'kh', height: 1),
                                hintText: AppLocalizations.of(context)!
                                    .translate("search")!),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //   child: BlocBuilder<GetshopBloc, GetshopState>(
          //     builder: (context, state) {
          //       if (state is GettingShop) {
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       }
          //       if (state is ErrorGettingShop) {
          //         return Text(state.error.toString());
          //       }
               
          //       return ListView.builder(
          //           scrollDirection: Axis.vertical,
          //           shrinkWrap: true,
          //           itemCount:
          //               BlocProvider.of<GetshopBloc>(context).Shop.length,
          //           itemBuilder: (_, index) {
          //             return InkWell(
          //               child: Container(
          //                 //alignment: Alignment.center,
          //                 width: MediaQuery.of(context).size.width - 20,
          //                 height: 100,
          //                // child:  Text(BlocProvider.of<GetshopBloc>(context).Shop[index].name!),
          //                 child: Stack(
          //                   children: [
          //                     Card(
          //                       semanticContainer: true,
          //                       //color: csblack,
          //                       clipBehavior: Clip.antiAliasWithSaveLayer,
          //                       margin: EdgeInsets.only(
          //                           right: 10, left: 10, top: 10),
          //                       child: Center(
          //                         child: ListTile(
          //                           leading: 
          //                           // Container(
          //                           //   width: 50,
          //                           //   height: 50,
          //                           //   child: CircleAvatar(
          //                           //     backgroundColor: white,
          //                           //     backgroundImage: AssetImage("assets/images/shop.png"),)),
          //                            Image(
          //                             fit: BoxFit.cover,
          //                             image: AssetImage("assets/images/shop.png"),
          //                           ),
          //                           // leading: Image(
          //                           //   fit: BoxFit.cover,
          //                           //   image:
          //                           //       NetworkImage(BlocProvider.of<GetshopBloc>(context).Shop[index].image_url!),
          //                           // ),
          //                           title: Text(BlocProvider.of<GetshopBloc>(context).Shop[index].name!),
          //                           //subtitle: Text(kilo[index])
          //                           //trailing: Icon(Icons.more_vert),
          //                         ),
          //                       ),
          //                     ),
          //                     Container(
          //                       width: MediaQuery.of(context).size.width - 10,
          //                       height: 120,
          //                       padding: EdgeInsets.only(bottom: 20),
          //                       alignment: Alignment.centerRight,
          //                       child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         children: [
          //                           SizedBox(
          //                             height: 5,
          //                           ),
          //                           Container(
          //                             margin: EdgeInsets.only(left: 20),
          //                             alignment: Alignment.center,
          //                             width: 50,
          //                             height: 20,
          //                             decoration: BoxDecoration(
          //                               color: mainColor,
          //                               //borderRadius: BorderRadius.only(topLeft: Radius.circular(10))
          //                             ),
          //                             child: Text(
          //                               BlocProvider.of<GetshopBloc>(context).Shop[index].points!,
          //                               style: TextStyle(
          //                                   fontFamily: 'kh', color: white),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               onTap: () {
          //                 Navigator.pushReplacement(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => TransferScreen(0, "",BlocProvider.of<GetshopBloc>(context).Shop[index].points!.toString(),BlocProvider.of<GetshopBloc>(context).Shop[index].name!.toString(), "pt",
          //                         BlocProvider.of<GetshopBloc>(context).Shop[index].image_url!)));
          //               },
          //             );
          //           });
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
