import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: mainColor,
              statusBarIconBrightness: Brightness.light),
          //toolbarHeight: 70,
          backgroundColor: mainColor,
          elevation: 0,
          // title: Container(
          //   width: MediaQuery.of(context).size.width * 0.8,
          //   height: 40,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       color: white.withOpacity(0.3)),
          // ),
          title: Text("Help Center"),
          // bottom: TabBar(
          //   tabs: [
          //     Tab(  
          //       text: "All",
          //     ),
          //     Tab(
          //       text: "Healthy and Beauty",
          //     ),
          //     Tab(
          //       icon: Icon(Icons.ac_unit),
          //       text: "Video",
          //     ),
          //     Tab(
          //       icon: Icon(Icons.ac_unit_outlined),
          //       text: "Firefighter",
          //     ),
          //   ],
          // ),
          bottom: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    //  (_blogCategoryBloc.subCategoryList.length == 0)
                    //     ? false
                    //     : true,
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    unselectedLabelColor: white,
                    tabs: [
                      Container(
                        padding: EdgeInsets.all(1),
                        child: Tab(
                            text:
                                "All",
                      ),),
                      Container(
                        padding: EdgeInsets.all(1),
                        child: Tab(
                            text:
                                "Healthy and Beauty",
                      ),),
                      Container(
                        padding: EdgeInsets.all(1),
                        child: Tab(
                            text:
                                "Video",
                      ),),
                      Container(
                        padding: EdgeInsets.all(1),
                        child: Tab(
                            text:
                                "Share experince",
                      ),),
                      Container(
                        padding: EdgeInsets.all(1),
                        child: Tab(
                            text:
                                "Knowledge",
                      ),)
                      
                    ],
                  ),
                ),
              ),
            
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_bike),
             Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
