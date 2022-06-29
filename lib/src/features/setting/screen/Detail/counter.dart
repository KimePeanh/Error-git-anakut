import 'package:anakut_bank/src/features/setting/blog/setting/bloc/counter_bloc/bloc/counter_bloc.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:money_formatter/money_formatter.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  List<String> name = ["Counter 1", "Counter 2"];

  List<String> image = ["assets/images/anakut.jpg", "assets/images/anakut.jpg"];

  List<String> currency = ["USD", "KHR", "THB"];

  List<String> amount = [
    "12000",
    "3400000",
    "854000",
  ];
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CounterBloc>(context).add(FetchCounterStarted());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          "Counter",
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff029E24),
        ),
        child: Icon(
          Icons.add,
          color: white,
          size: 30,
        ),
      ),
      // body: ListView.builder(
      //     shrinkWrap: true,
      //     itemCount: 2,
      //     itemBuilder: (context, index) {
      //       return Container(
      //         padding: EdgeInsets.all(8),
      //         margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      //         width: MediaQuery.of(context).size.width * 0.9,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(10),
      //           color: white,
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey.shade200,
      //               offset: Offset(2,2),
      //               blurRadius: 1
      //             )
      //           ]
      //         ),
      //         child: Column(
      //           children: <Widget>[
      //             Container(
      //               width: MediaQuery.of(context).size.width * 0.9,
      //               height: MediaQuery.of(context).size.height * 0.15,
      //               child: Image(
      //                 //fit: ,
      //                 image: AssetImage(image[index]),
      //               ),
      //             ),
      //             Row(
      //               children: <Widget>[
      //                 Expanded(
      //                     child: Container(
      //                   child: Column(
      //                     children: [
      //                       Container(
      //                         alignment: Alignment.centerRight,
      //                         child: Text(
      //                           currency[0],
      //                           style:
      //                               TextStyle(fontWeight: bold, fontFamily: 'kh'),
      //                           textScaleFactor: 1.1,
      //                         ),
      //                       ),
      //                       Container(
      //                         alignment: Alignment.centerRight,
      //                         child: Text(
      //                           currency[1],
      //                           style:
      //                               TextStyle(fontWeight: bold, fontFamily: 'kh'),
      //                           textScaleFactor: 1.1,
      //                         ),
      //                       ),
      //                       Container(
      //                         alignment: Alignment.centerRight,
      //                         child: Text(
      //                           currency[2],
      //                           style:
      //                               TextStyle(fontWeight: bold, fontFamily: 'kh'),
      //                           textScaleFactor: 1.1,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 )),
      //                 SizedBox(width: 80,),
      //                 Expanded(
      //                     child: Container(

      //                   child: Column(
      //                     children: [
      //                       Container(
      //                         alignment: Alignment.centerLeft,
      //                           child: Text(
      //                         amount[0],
      //                         style:
      //                             TextStyle(fontWeight: bold, fontFamily: 'kh'),
      //                         textScaleFactor: 1.1,
      //                       )),
      //                       Container(
      //                         alignment: Alignment.centerLeft,
      //                           child: Text(
      //                         amount[1],
      //                         style:
      //                             TextStyle(fontWeight: bold, fontFamily: 'kh'),
      //                         textScaleFactor: 1.1,
      //                       )),
      //                       Container(
      //                         alignment: Alignment.centerLeft,
      //                           child: Text(
      //                         amount[2],
      //                         style:
      //                             TextStyle(fontWeight: bold, fontFamily: 'kh'),
      //                         textScaleFactor: 1.1,
      //                       )),
      //                     ],
      //                   ),
      //                 ))
      //               ],
      //             )
      //           ],
      //         ),
      //       );
      //     }),

      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is FetchingCounter) {
            return Center(
              child: Container(
                  width: 100,
                  child: LottieBuilder.asset(
                      "assets/images/Bank/lf30_editor_bmeqpdqv.json")),
            );
          } else if (state is ErrorFetchingCounter) {
            return Text(state.e.toString());
          }

          return ListView.builder(
              shrinkWrap: true,
              itemCount:
                  BlocProvider.of<CounterBloc>(context).getCounter.length,
              itemBuilder: (context, index) {
                // for (int i = 0;
                //     i <
                //         BlocProvider.of<CounterBloc>(context)
                //             .getCounter[index]
                //             .counter_balance!
                //             .length;
                //     i++) {
                //   return Container();
                // }
                // print("object");
                //   print(BlocProvider.of<CounterBloc>(context).getCounter[index].counter_balance!.length);
                return Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.all(10),
                  //height: MediaQuery.of(context).size.height*0.2,
                  // color: mainColor,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(2, 2),
                            blurRadius: 1)
                      ]),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.12,
                              child: Image(
                                image: AssetImage(
                                    "assets/images/Bank/addphoto.png"),
                              )),
                          Text(
                            BlocProvider.of<CounterBloc>(context)
                                .getCounter[index]
                                .name!,
                            style:
                                TextStyle(fontFamily: 'kh', fontWeight: bold),
                            textScaleFactor: 1.2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomRight,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      BlocProvider.of<CounterBloc>(context)
                                          .getCounter[index]
                                          .counter_balance!
                                          .length,
                                  itemBuilder: (context, i) {
                                    return Text(
                                      BlocProvider.of<CounterBloc>(context)
                                          .getCounter[index]
                                          .counter_balance![i]['name'],
                                      style: TextStyle(
                                          fontFamily: 'kh',
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.end,
                                      textScaleFactor: 1.1,
                                    );
                                  }),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomRight,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      BlocProvider.of<CounterBloc>(context)
                                          .getCounter[index]
                                          .counter_balance!
                                          .length,
                                  itemBuilder: (context, i) {
                                    double u;
                                    u = double.parse(
                                        BlocProvider.of<CounterBloc>(context)
                                            .getCounter[index]
                                            .counter_balance![i]['amount']);
                                    MoneyFormatter fm =
                                        MoneyFormatter(amount: u);
                                    return Text(
                                      fm.output.nonSymbol,
                                      style: TextStyle(
                                          fontFamily: 'kh',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blue),
                                      textAlign: TextAlign.start,
                                      textScaleFactor: 1.1,
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 40,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xffEE1724),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Close",
                                style:
                                    TextStyle(color: white, fontFamily: 'kh'),
                                textScaleFactor: 1,
                              ),
                            )),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xff00D408),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Top Up",
                                style:
                                    TextStyle(color: white, fontFamily: 'kh'),
                                textScaleFactor: 1,
                              ),
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
