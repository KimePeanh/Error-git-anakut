import 'package:anakut_bank/app_localiztion.dart';
import 'package:anakut_bank/src/features/home/bloc/bloc/getshop_bloc.dart';
import 'package:anakut_bank/src/features/point/bloc/bloc/mypoint_bloc.dart';
import 'package:anakut_bank/src/features/point/screen/showpoint.dart';
import 'package:anakut_bank/src/shared/widgets/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

MypointBloc mypointBloc = MypointBloc();

class PointScreen extends StatefulWidget {
  const PointScreen({Key? key}) : super(key: key);

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  final RefreshController _refreshController = RefreshController();
  List<String> logo = [
    "assets/images/galaxy.jpg",
    "assets/images/galaxy.jpg",
    "assets/images/galaxy.jpg",
    "assets/images/galaxy.jpg",
  ];
  List<double> allpoint = [];
  double allPoint = 0;
  @override
  Widget build(BuildContext context) {
    allpoint.clear();
    allPoint = 0;
    mypointBloc.add(GettingPointStarted());
    var size = MediaQuery.of(context).size;
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    final double itemHeight = (size.height - kToolbarHeight - 35) / 3;
    final double itemWidth = size.width / 1.5;
    //BlocProvider.of<GetshopBloc>(context).add(GetShopStarted());
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: mainColor,
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //       statusBarColor: mainColor,
        //       statusBarIconBrightness: Brightness.light),
        //   title: Text(
        //     "My Point",
        //     style: TextStyle(fontFamily: 'kh'),
        //   ),
        //   centerTitle: true,
        // ),
        body: BlocConsumer(
      bloc: mypointBloc,
      listener: (context, state) {
        if (state is GettedPoint) {
          _refreshController.loadComplete();
          _refreshController.refreshCompleted();
        }
        if (state is End) {
          _refreshController.loadNoData();
        }
      },
      builder: (context, state) {
        if (state is GettingPoint) {
          allpoint.clear();
          allPoint = 0;
          return Center(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    APPBAR(context),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 25),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 70,
                              padding: EdgeInsets.only(left: 10),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                    color: white,
                                  )),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width - 100,
                              height: 70,
                              child: Text(
                                "My Point",
                                style: TextStyle(
                                    color: white,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'kh'),
                                textScaleFactor: 1.3,
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 70,
                              padding: EdgeInsets.only(right: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 85),
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 180,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.2),
                                offset: Offset(2, 2),
                                blurRadius: 5,
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 38,
                  decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: grey.withOpacity(0.3),
                      //     blurRadius: 9,
                      //     offset: Offset(3, 6), // Shadow position
                      //   ),
                      // ],
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
                        hintStyle: TextStyle(fontFamily: 'kh', height: 1),
                        hintText:
                            AppLocalizations.of(context)!.translate("search")!),
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (itemWidth / itemHeight),
                      ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.2),
                                  offset: Offset(2, 2),
                                  blurRadius: 5,
                                ),
                              ]),
                        );
                      }),
                )
              ],
            ),
          );
        } else if (state is ErrorGetPoint) {
          return Container();
        }
        allpoint.length != 0
            ? allpoint.clear()
            : mypointBloc.totalpoint.forEach((element) {
                allpoint.add(double.parse(element.point));
              });
        for (int i = 0; i < allpoint.length; i++) {
          allPoint += allpoint[i];
        }
        print(allpoint.length.toString() + "ooo");
        print(allPoint.toString());
        return Center(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  APPBAR(context),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 25),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 70,
                            padding: EdgeInsets.only(left: 10),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: white,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width - 100,
                            height: 70,
                            child: Text(
                              "My Point",
                              style: TextStyle(
                                  color: white,
                                  //fontWeight: FontWeight.bold,
                                  fontFamily: 'kh'),
                              textScaleFactor: 1.3,
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 70,
                            padding: EdgeInsets.only(right: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 85),
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 180,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: grey.withOpacity(0.2),
                              offset: Offset(2, 2),
                              blurRadius: 5,
                            ),
                          ],
                          // image: DecorationImage(
                          //     fit: BoxFit.cover,
                          //     image:
                          //         AssetImage("assets/images/Bank/wallet.jpg"))
                                  ),
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width * 0.95,
                                height: 180,
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Point Card",
                                  style: TextStyle(
                                      fontFamily: 'kh',
                                      fontWeight: bold,
                                      ),
                                  textScaleFactor: 1.2,
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                height: 180,
                                alignment: Alignment.center,
                                child: Text(
                                  allPoint.toString() + " points",
                                  style: TextStyle(
                                      fontWeight: bold, color: mainColor),
                                  textScaleFactor: 2,
                                ),
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 38,
                decoration: BoxDecoration(),
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
                      hintStyle: TextStyle(fontFamily: 'kh', height: 1),
                      hintText:
                          AppLocalizations.of(context)!.translate("search")!),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SmartRefresher(
                  controller: _refreshController,
                  cacheExtent: 1,
                  // cacheExtent: 500,
                  physics: AlwaysScrollableScrollPhysics(),
                  onRefresh: () {
                    mypointBloc.add(GettingPointStarted());
                  },
                  onLoading: () {
                    if (mypointBloc.state is End) {
                    } else {
                      allpoint.clear();
                      allPoint = 0;
                      mypointBloc.add(Reload());
                    }
                  },

                  enablePullDown: true,
                  enablePullUp: true,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (itemWidth / itemHeight),
                      ),
                      itemCount: mypointBloc.list_point.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.2),
                                  offset: Offset(2, 2),
                                  blurRadius: 5,
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  mypointBloc.list_point[index].image_url ==
                                          null
                                      ? Image(
                                          width: 80,
                                          height: 80,
                                          image: AssetImage(
                                              "assets/images/shops.png"))
                                      : Image(
                                          width: 80,
                                          height: 80,
                                          image: NetworkImage(mypointBloc
                                              .list_point[index].image_url!)),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    mypointBloc.list_point[index].name,
                                    style: TextStyle(fontFamily: 'kh'),
                                  ),
                                ],
                              )),
                              Container(
                                height: 30,
                                color: mainColor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      mypointBloc.list_point[index].point +
                                          " point",
                                      style: TextStyle(
                                          color: white,
                                          fontFamily: 'kh',
                                          fontWeight: bold),
                                      textScaleFactor: 1,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
