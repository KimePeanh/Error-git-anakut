import 'package:anakut_bank/src/features/setting/blog/setting/bloc/counter_bloc/bloc/counter_bloc.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:swipe_cards/swipe_cards.dart';

class Cardd extends StatefulWidget {
  // const Card({ Key? key }) : super(key: key);
  // List<CounterModel> list;
  // CounterModel counterModel;
  // Cardd(this.list, this.counterModel);

  @override
  State<Cardd> createState() => _CarddState();
}

class _CarddState extends State<Cardd> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CounterBloc>(context).add(FetchCounterStarted());
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        if (state is FetchingCounter) {
          return Center(
            child: Container(
                width: 100,
                child: LottieBuilder.asset(
                    "assets/images/Bank/lf30_editor_bmeqpdqv.json")),
          );
        } else if (state is ErrorFetchingCounter) {
          return Container();
        }
        print("object");
        return AspectRatio(
          aspectRatio: 14.9 / 7,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount:
                  BlocProvider.of<CounterBloc>(context).getCounter.length,
              itemBuilder: (context, index) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: BlocProvider.of<CounterBloc>(context)
                        .getCounter[index]
                        .counter_balance!
                        .length,
                    itemBuilder: (context, i) {
                      double u;
                      u = double.parse(BlocProvider.of<CounterBloc>(context)
                          .getCounter[index]
                          .counter_balance![i]['amount']);
                      MoneyFormatter fm = MoneyFormatter(amount: u);
                      
                      return Container(
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.2),
                                offset: Offset(2, 2),
                                blurRadius: 5,
                              ),
                            ]
                            // image: DecorationImage(
                            //   fit: BoxFit.fitWidth,
                            //   image: AssetImage("assets/images/Bank/ba.jpg")),
                            ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                          child: Text(
                                    "Wallet",
                                    style: TextStyle(
                                        fontWeight: bold, fontFamily: 'kh'),
                                    textScaleFactor: 1.2,
                                  ))),
                                  Container(
                                      child: Text(
                                    BlocProvider.of<CounterBloc>(context)
                                        .getCounter[index]
                                        .counter_balance![i]['name'],
                                    style: TextStyle(
                                        fontWeight: bold, fontFamily: 'kh'),
                                    textScaleFactor: 1.2,
                                  ))
                                ],
                              ),
                            )),
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width * 0.95,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/Bank/Sim.png")),
                                  ),
                                ),
                              ),
                            ),
                            
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Amount : ${fm.output.nonSymbol} ${BlocProvider.of<CounterBloc>(context).getCounter[index].counter_balance![i]['code']}",
                                style: TextStyle(
                                    fontFamily: 'kh', fontWeight: bold),
                                textScaleFactor: 1.2,
                              ),
                            )),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(
                                  right: 10, bottom: 10, left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: InkWell(
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color(0xffEE1724),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "Close",
                                              style: TextStyle(
                                                  fontFamily: 'kh',
                                                  color: white),
                                              textScaleFactor: 1.1,
                                            ),
                                          ),
                                          onTap: () {
                                            // showAlertDialogServicefee(context);
                                          },
                                        )),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                            child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color(0xff00D408),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "Top Up",
                                            style: TextStyle(
                                                fontFamily: 'kh', color: white),
                                            textScaleFactor: 1.1,
                                          ),
                                        )),
                                      ],
                                    ),
                                  )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // Text(
                                  //   "Counter 1",
                                  //   style: TextStyle(fontFamily: 'kh'),
                                  //   textScaleFactor: 1.2,
                                  // )
                                ],
                              ),
                            )),
                          ],
                        ),
                      );
                    });
              }),
        );
      },
    );
  }
}
