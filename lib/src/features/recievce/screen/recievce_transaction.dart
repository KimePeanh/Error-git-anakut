import 'package:anakut_bank/src/features/recievce/bloc/bloc/history_bloc.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

HistoryBloc historyBloc = HistoryBloc();

class RecievceTransaction extends StatefulWidget {
  const RecievceTransaction({Key? key}) : super(key: key);

  @override
  State<RecievceTransaction> createState() => _RecievceTransactionState();
}

class _RecievceTransactionState extends State<RecievceTransaction> {
  RefreshController _refreshController = RefreshController();
  @override
  void initState() {
    historyBloc.add(GettingHistoryStarted());
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
          style: TextStyle(color: Colors.black, fontFamily: 'kh'),
        ),
      ),
      body: BlocConsumer(
        bloc: historyBloc,
        listener: (context, state) {
          if (state is GettedHistory) {
            _refreshController.loadComplete();
            _refreshController.refreshCompleted();
          }
          if (state is End) {
            _refreshController.loadNoData();
          }
        },
        builder: (context, state) {
          if (state is GettingHistory) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorGettingHistory) {
            return Text(state.e.toString());
          }

          return SmartRefresher(
            cacheExtent: 1,
            physics: AlwaysScrollableScrollPhysics(),
            onRefresh: () {
              historyBloc.add(GettingHistoryStarted());
            },
            onLoading: () {
              if (state is End) {
              } else {
                historyBloc.add(Reload());
              }
            },
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: historyBloc.History.length,
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
                                      "Invoice No: ANK${historyBloc.History[index].transaction_id}",
                                      style: TextStyle(
                                          fontFamily: 'kh', fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Date: ${historyBloc.History[index].create_date}",
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
                                                  '${historyBloc.History[index].amount}${historyBloc.History[index].currencytypeModel!.symbol}',
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
                                              text: 'Service fee: ',
                                              style: TextStyle(
                                                  fontFamily: 'kh',
                                                  fontSize: 14),
                                            ),
                                            TextSpan(
                                                text:
                                                    '${historyBloc.History[index].service_charge}',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.w900)),
                                          ],
                                        ),
                                      )),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Total: ',
                                              style: TextStyle(
                                                  fontFamily: 'kh',
                                                  fontSize: 14),
                                            ),
                                            TextSpan(
                                                text:
                                                    '${historyBloc.History[index].amount}${historyBloc.History[index].currencytypeModel!.symbol}',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.w900)),
                                          ],
                                        ),
                                      ))
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
