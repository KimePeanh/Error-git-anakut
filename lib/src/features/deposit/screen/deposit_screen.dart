import 'package:anakut_bank/src/features/deposit/screen/deposit_detail.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  bool _enabled = true;
  List<String> Listname = ["Peanh Kime", "Chea Kaknika", "Sous SreyLen"];
  List<String> ID = ["ANK1294783", "ANK5494421", "ANK2334783"];
  List<String> amount = ["Wed", "May 19", "May 18"];
  List<String> date = ["05-04-2022", "14-01-2022", "13-12-2021"];
  List<String> time = ["6:24 PM", "4:50 PM", "9:12 AM"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Deposit Management",
          style: TextStyle(color: Colors.black),
        ),
      ),
      // body: Container(
      //   width: double.infinity,
      //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.max,
      //     children: <Widget>[
      //       Expanded(
      //         child: Shimmer.fromColors(
      //           baseColor: Colors.grey.shade300,
      //           highlightColor: Colors.grey.shade100,
      //           enabled: _enabled,
      //           child: ListView.builder(
      //             itemBuilder: (_, __) => Padding(
      //               padding: const EdgeInsets.only(bottom: 8.0),
      //               child: Row(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: <Widget>[
      //                   Container(
      //                     width: 48.0,
      //                     height: 48.0,
      //                     color: Colors.white,
      //                   ),
      //                   const Padding(
      //                     padding: EdgeInsets.symmetric(horizontal: 8.0),
      //                   ),
      //                   Expanded(
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: <Widget>[
      //                         Container(
      //                           width: double.infinity,
      //                           height: 8.0,
      //                           color: Colors.white,
      //                         ),
      //                         const Padding(
      //                           padding: EdgeInsets.symmetric(vertical: 2.0),
      //                         ),
      //                         Container(
      //                           width: double.infinity,
      //                           height: 8.0,
      //                           color: Colors.white,
      //                         ),
      //                         const Padding(
      //                           padding: EdgeInsets.symmetric(vertical: 2.0),
      //                         ),
      //                         Container(
      //                           width: 40.0,
      //                           height: 8.0,
      //                           color: Colors.white,
      //                         ),
      //                       ],
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             itemCount: 6,
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 8.0),
      //         child: FlatButton(
      //             onPressed: () {
      //               setState(() {
      //                 _enabled = !_enabled;
      //               });
      //             },
      //             child: Text(
      //               _enabled ? 'Stop' : 'Play',
      //               style: Theme.of(context).textTheme.button!.copyWith(
      //                   fontSize: 18.0,
      //                   color: _enabled ? Colors.redAccent : Colors.green),
      //             )),
      //       )
      //     ],
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width*0.8,
              //   child: Text("Customer", style: TextStyle(fontFamily: 'kh'),textScaleFactor: 1.1,),
              // ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: Listname.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.21,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(2, 2),
                              ),
                            ]),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.width * 0.18,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Ju_Jing_Yi.jpg'))),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 6, right: 6),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          Listname[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'kh'),
                                          textScaleFactor: 1.1,
                                        )),

                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          ID[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue.shade400,
                                              fontFamily: 'kh'),
                                          textScaleFactor: 0.8,
                                        )),
                                    // Container(
                                    //     alignment: Alignment.centerLeft,
                                    //     child: Text(
                                    //       "${time[index]}",
                                    //       style: TextStyle(
                                    //           color: Colors.black,
                                    //           fontWeight: FontWeight.bold),
                                    //       textScaleFactor: 1.2,
                                    //     )),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              amount[index],
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DepositDetail(
                                      id: index,
                                    )));
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        child: Container(
          margin: EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width * 0.16,
          height: MediaQuery.of(context).size.width * 0.16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: Icon(
            Icons.add,
            color: white,
            size: 30,
          ),
        ),
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => ApplyLoanScreen()));
        },
      ),
    );
  }
}
