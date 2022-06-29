import 'package:anakut_bank/src/features/payment/bloc/bloc/payment_history_bloc.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

PaymentHistoryBloc paymentHistoryBloc = PaymentHistoryBloc();

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    paymentHistoryBloc.add(FetchPaymentHistoryStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          "History",
          style: TextStyle(color: Colors.black),
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(right: 10),
        //     child: IconButton(
        //         onPressed: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => PaymentHistory()));
        //         },
        //         icon: Icon(
        //           Icons.history,
        //           color: Colors.black,
        //         )),
        //   ),
        // ],
      ),
      // body: BlocBuilder(
      //   bloc: paymentHistoryBloc,
      //   builder: (context, state) {
      //     if (state is FetchingPaymentHistory) {
      //       return Center(
      //         child: Container(
      //             width: 100,
      //             child: LottieBuilder.asset(
      //                 "assets/images/Bank/lf30_editor_bmeqpdqv.json")),
      //       );
      //     } else if (state is ErrorPaymentHistory) {
      //       return Center(
      //         child: Text(state.e.toString()),
      //       );
      //     }
      //     return SmartRefresher(
      //       cacheExtent: 1,
      //       // cacheExtent: 500,
      //       physics: AlwaysScrollableScrollPhysics(),
      //       onRefresh: () {
      //         paymentHistoryBloc.add(Refresh());
      //       },
      //       onLoading: () {
      //         if (state is End) {
      //          // _refreshController.loadNoData();
      //         } else {
      //           paymentHistoryBloc.add(Refresh());
      //         }
      //       },
      //       enablePullDown: true,
      //       enablePullUp: true,
      //       controller: _refreshController,
      //       child: ListView.builder(
      //           shrinkWrap: true,
      //           itemCount: paymentHistoryBloc.listhistory.length,
      //           itemBuilder: (context, index) {
      //             return InkWell(
      //               child: Container(
      //                 margin:
      //                     EdgeInsets.only(left: 10, right: 10, bottom: 10),
      //                 padding: EdgeInsets.all(8),
      //                 alignment: Alignment.centerLeft,
      //                 width: width * 0.9,
      //                 // height: hieght * 0.25,
      //                 decoration: BoxDecoration(
      //                     color: white,
      //                     borderRadius: BorderRadius.circular(10),
      //                     boxShadow: [
      //                       BoxShadow(
      //                         color: grey.withOpacity(0.1),
      //                         offset: Offset(0, 1),
      //                         blurRadius: 5,
      //                       )
      //                     ]),
      //                 child: Row(
      //                   children: [
      //                     Expanded(
      //                       child: Container(
      //                         child: Column(
      //                           children: [
      //                             Container(
      //                               alignment: Alignment.centerLeft,
      //                               child: Text(
      //                                 "Invoice No: ANK{BlocProvider.of<ExpenseListingBloc>(context).expenseList[index].money_exchange_id}",
      //                                 style: TextStyle(
      //                                     fontFamily: 'kh', fontSize: 14),
      //                               ),
      //                             ),
      //                             Container(
      //                               alignment: Alignment.centerLeft,
      //                               child: Text(
      //                                 "Date: {BlocProvider.of<ExpenseListingBloc>(context).expenseList[index].create_date}",
      //                                 style: TextStyle(
      //                                     fontFamily: 'kh', fontSize: 14),
      //                               ),
      //                             ),
      //                             Container(
      //                               alignment: Alignment.centerLeft,
      //                               child: Text.rich(
      //                                 TextSpan(
      //                                   children: [
      //                                     TextSpan(
      //                                       text: 'Purchase money: ',
      //                                       style: TextStyle(
      //                                           fontFamily: 'kh',
      //                                           fontSize: 14),
      //                                     ),
      //                                     TextSpan(
      //                                         text:
      //                                             "",
      //                                         style: TextStyle(
      //                                             color: Colors.blue,
      //                                             fontWeight:
      //                                                 FontWeight.w900)),
      //                                   ],
      //                                 ),
      //                               ),
      //                             ),
      //                             Container(
      //                                 alignment: Alignment.centerLeft,
      //                                 child: Text.rich(
      //                                   TextSpan(
      //                                     children: [
      //                                       TextSpan(
      //                                         text: 'Exchange rate: ',
      //                                         style: TextStyle(
      //                                             fontFamily: 'kh',
      //                                             fontSize: 14),
      //                                       ),
      //                                       TextSpan(
      //                                           text:
      //                                               '{BlocProvider.of<ExpenseListingBloc>(context).expenseList[index].rate}',
      //                                           style: TextStyle(
      //                                               color: Colors.green,
      //                                               fontWeight:
      //                                                   FontWeight.w900)),
      //                                     ],
      //                                   ),
      //                                 )),
      //                             Container(
      //                                 alignment: Alignment.centerLeft,
      //                                 child: Text.rich(
      //                                   TextSpan(
      //                                     children: [
      //                                       TextSpan(
      //                                         text: 'Sales money: ',
      //                                         style: TextStyle(
      //                                             fontFamily: 'kh',
      //                                             fontSize: 14),
      //                                       ),
      //                                       TextSpan(
      //                                           text:
      //                                               "ddd",
      //                                           style: TextStyle(
      //                                               color: Colors.red,
      //                                               fontWeight:
      //                                                   FontWeight.w900)),
      //                                     ],
      //                                   ),
      //                                 ))
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               onTap: () {
      //                 // int id =
      //                 //     BlocProvider.of<ExpenseListingBloc>(context)
      //                 //         .expenseList[index]
      //                 //         .money_exchange_id;
      //                 // Navigator.push(
      //                 //     context,
      //                 //     MaterialPageRoute(
      //                 //         builder: (context) =>
      //                 //             NewReciept(id: id)));
      //               },
      //             );
      //           }),
      //     );
      //   },
      // )
      body: BlocConsumer(
        bloc: paymentHistoryBloc,
        listener: (context, state) {
          if (state is FetchedPaymentHistory) {
            _refreshController.loadComplete();
            _refreshController.refreshCompleted();
          }
          if (state is End) {
            _refreshController.loadNoData();
          }
        },
        builder: (context, state) {
          if (state is FetchingPaymentHistory) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorPaymentHistory) {
            return Text(state.e.toString());
          }
          return SmartRefresher(
            cacheExtent: 1,
            // cacheExtent: 500,
            physics: AlwaysScrollableScrollPhysics(),
            onRefresh: () {
              paymentHistoryBloc.add(FetchPaymentHistoryStarted());
            },
            onLoading: () {
              if (paymentHistoryBloc.state is End) {
              } else {
                paymentHistoryBloc.add(RefreshHis());
              }
            },
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: paymentHistoryBloc.listhistory.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      width: width * 0.9,
                      // height: hieght * 0.25,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: grey.withOpacity(0.1),
                              offset: Offset(0, 1),
                              blurRadius: 5,
                            )
                          ]),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Invoice No: ANK${paymentHistoryBloc.listhistory[index].id.toString()}",
                                      style: TextStyle(
                                          fontFamily: 'kh', fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Date: ${paymentHistoryBloc.listhistory[index].create_date.toString()}",
                                      style: TextStyle(
                                          fontFamily: 'kh', fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Amount: ',
                                            style: TextStyle(
                                                fontFamily: 'kh', fontSize: 14),
                                          ),
                                          TextSpan(
                                              text:
                                                  '${paymentHistoryBloc.listhistory[index].amount}${paymentHistoryBloc.listhistory[index].currencytype!.symbol}',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w900)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Fee : ',
                                              style: TextStyle(
                                                  fontFamily: 'kh',
                                                  fontSize: 14),
                                            ),
                                            TextSpan(
                                                text:
                                                    '${paymentHistoryBloc.listhistory[index].service_charge.toString()}${paymentHistoryBloc.listhistory[index].currencytype!.symbol}',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.w900)),
                                          ],
                                        ),
                                      )),
                                  // Container(
                                  //     alignment: Alignment.centerLeft,
                                  //     child: Text.rich(
                                  //       TextSpan(
                                  //         children: [
                                  //           TextSpan(
                                  //             text: 'Sales money: ',
                                  //             style: TextStyle(
                                  //                 fontFamily: 'kh',
                                  //                 fontSize: 14),
                                  //           ),
                                  //           TextSpan(
                                  //               text:
                                  //                   '${BlocProvider.of<ExpenseListingBloc>(context).expenseList[index].amount_out} ${BlocProvider.of<ExpenseListingBloc>(context).expenseList[index].currencyOutModel!.code}',
                                  //               style: TextStyle(
                                  //                   color: Colors.red,
                                  //                   fontWeight:
                                  //                       FontWeight
                                  //                           .w900)),
                                  //         ],
                                  //       ),
                                  //     ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      // int id =
                      //     BlocProvider.of<ExpenseListingBloc>(context)
                      //         .expenseList[index]
                      //         .money_exchange_id;
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             NewReciept(id: id)));
                    },
                  );
                }),
          );
        },
      ),
    );
  }
}
