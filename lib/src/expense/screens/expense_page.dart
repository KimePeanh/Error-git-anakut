import 'package:anakut_bank/app_localiztion.dart';
import 'package:anakut_bank/src/expense/bloc/expense_listing_bloc.dart';
import 'package:anakut_bank/src/expense/bloc/expense_listing_event.dart';
import 'package:anakut_bank/src/expense/bloc/expense_listing_state.dart';
import 'package:anakut_bank/src/features/exchnage/bloc/bloc/delete_exchange_bloc/bloc/delete_exchange_bloc.dart';
import 'package:anakut_bank/src/features/exchnage/bloc/edit_bloc/bloc/edit_bloc.dart';
import 'package:anakut_bank/src/features/exchnage/model/exchnage_model.dart';
import 'package:anakut_bank/src/features/expense/bloc/expense_listing_bloc.dart';
import 'package:anakut_bank/src/features/login/screen/dialog.dart';
import 'package:anakut_bank/src/features/reciept/screen/reciept.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:anakut_bank/src/utils/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'edit_exchange_screen.dart';

ExpenseListingBloc expenseListingBloc = ExpenseListingBloc();
DeleteExchangeBloc deleteExchangeBloc = DeleteExchangeBloc();
EditBloc editBloc = EditBloc();

class ExpensePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ExpenseListingBloc()
          ..add(InitializeExpenseList(dateRange: "This week")),
        child: ExpenseBody());
  }
}

class ExpenseBody extends StatelessWidget {
  final RefreshController _refreshController = RefreshController();
  String? val;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hieght = MediaQuery.of(context).size.width;
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
      ),
      body: BlocConsumer<ExpenseListingBloc, ExpenseListingState>(
        listener: (context, state) {
          if (state is InitializedExpenseList || state is FetchedExpenseList) {
            _refreshController.loadComplete();
            _refreshController.refreshCompleted();
          }
          if (state is EndOfExpenseList) {
            _refreshController.loadNoData();
          }
        },
        builder: (c, state) {
          // RepositoryProvider.of<helper>(context)
          //     .handleState(state: state, context: context);
          if (state is InitializingExpenseList) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorFetchingExpenseList) {
            return Container();
          }
          print(
              BlocProvider.of<ExpenseListingBloc>(context).expenseList.length);

          print(state.toString());
          return BlocListener(
            bloc: deleteExchangeBloc,
            listener: (context, state) {
              if (state is Deleting) {
                loadingDialogs(context);
              } else if (state is ErrorDelete) {
                Navigator.pop(context);
              } else if (state is Deleted) {
                Navigator.pop(context);
                BlocProvider.of<ExpenseListingBloc>(context)
                    .add(InitializeExpenseList(dateRange: val));
              }
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: DropdownButton<String>(
                    hint: Text(
                      BlocProvider.of<ExpenseListingBloc>(context)
                              .dateRange!
                              .contains("to")
                          ? BlocProvider.of<ExpenseListingBloc>(context)
                              .dateRange!
                          : BlocProvider.of<ExpenseListingBloc>(context)
                              .dateRange!,
                      textScaleFactor: 1,
                    ),
                    items: [
                      'Today',
                      'This week',
                      'This month',
                      'This year',
                      "Custom"
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value == "Custom") {
                        showPickerDateRange(context);
                      } else
                        BlocProvider.of<ExpenseListingBloc>(context)
                            .add(InitializeExpenseList(dateRange: value));
                      val = value;
                    },
                  ),
                ),
                Expanded(
                  child: SmartRefresher(
                    physics: AlwaysScrollableScrollPhysics(),
                    onRefresh: () async {
                      // BlocProvider.of<ExpenseListingBloc>(context).add(
                      //     InitializeExpenseList(
                      //         dateRange: BlocProvider.of<ExpenseListingBloc>(context)
                      //             .dateRange));
                      await Future.delayed(Duration(seconds: 1));

                      _refreshController.refreshCompleted();
                    },
                    onLoading: () {
                      if (BlocProvider.of<ExpenseListingBloc>(context).state
                          is EndOfExpenseList) {
                      } else {
                        BlocProvider.of<ExpenseListingBloc>(context)
                            .add(FetchExpenseList(arg: null));
                      }
                    },
                    enablePullDown: true,
                    enablePullUp: true,
                    controller: _refreshController,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: BlocProvider.of<ExpenseListingBloc>(context)
                            .expenseList
                            .length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
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
                                              "Invoice No: ANK${BlocProvider.of<ExpenseListingBloc>(context).expenseList[index].money_exchange_id}",
                                              style: TextStyle(
                                                  fontFamily: 'kh',
                                                  fontSize: 14),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Date: ${BlocProvider.of<ExpenseListingBloc>(context).expenseList[index].create_date}",
                                              style: TextStyle(
                                                  fontFamily: 'kh',
                                                  fontSize: 14),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Purchase money: ',
                                                    style: TextStyle(
                                                        fontFamily: 'kh',
                                                        fontSize: 14),
                                                  ),
                                                  TextSpan(
                                                      text:
                                                          '${BlocProvider.of<ExpenseListingBloc>(context).expenseList[index].amount_in} ${BlocProvider.of<ExpenseListingBloc>(context).expenseList[index].currencyInModel!.code}',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w900)),
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
                                                      text: 'Exchange rate: ',
                                                      style: TextStyle(
                                                          fontFamily: 'kh',
                                                          fontSize: 14),
                                                    ),
                                                    TextSpan(
                                                        text:
                                                            '${BlocProvider.of<ExpenseListingBloc>(context).expenseList[index].rate}',
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900)),
                                                  ],
                                                ),
                                              )),
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Sales money: ',
                                                      style: TextStyle(
                                                          fontFamily: 'kh',
                                                          fontSize: 14),
                                                    ),
                                                    TextSpan(
                                                        text:
                                                            '${BlocProvider.of<ExpenseListingBloc>(context).expenseList[index].amount_out} ${BlocProvider.of<ExpenseListingBloc>(context).expenseList[index].currencyOutModel!.code}',
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900)),
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   width: 80,
                                  //   height: 90,
                                  //   child: Column(
                                  //     children: [
                                  //       Expanded(
                                  //           child: InkWell(
                                  //         child: Container(
                                  //           width: 45,
                                  //           height: 45,
                                  //           decoration: BoxDecoration(
                                  //               color: Colors.green.shade400,
                                  //               borderRadius:
                                  //                   BorderRadius.circular(5),
                                  //               boxShadow: [
                                  //                 BoxShadow(
                                  //                   color:
                                  //                       grey.withOpacity(0.1),
                                  //                   offset: Offset(0, 1),
                                  //                   blurRadius: 5,
                                  //                 )
                                  //               ]),
                                  //           child: Icon(
                                  //             Icons.edit,
                                  //             color: white,
                                  //           ),
                                  //         ),
                                  //         onTap: () {
                                  //           // double rate;
                                  //           // rate = double.parse(BlocProvider.of<
                                  //           //         ExpenseListingBloc>(context)
                                  //           //     .expenseList[index]
                                  //           //     .rate!);
                                  //           // editBloc.add(EditPress(
                                  //           //     currency_in:
                                  //           //         BlocProvider.of<ExpenseListingBloc>(context)
                                  //           //             .expenseList[index]
                                  //           //             .currencyInModel!
                                  //           //             .id,
                                  //           //     currency_out:
                                  //           //         BlocProvider.of<ExpenseListingBloc>(context)
                                  //           //             .expenseList[index]
                                  //           //             .currencyOutModel!
                                  //           //             .id,
                                  //           //     rate: rate,
                                  //           //     amount_in: double.parse(
                                  //           //         BlocProvider.of<ExpenseListingBloc>(context)
                                  //           //             .expenseList[index]
                                  //           //             .amount_in!),
                                  //           //     amount_out: double.parse(
                                  //           //         BlocProvider.of<ExpenseListingBloc>(context)
                                  //           //             .expenseList[index]
                                  //           //             .amount_out!),
                                  //           //     id: BlocProvider.of<ExpenseListingBloc>(
                                  //           //             context)
                                  //           //         .expenseList[index]
                                  //           //         .money_exchange_id));
                                  //           int id = BlocProvider.of<
                                  //                   ExpenseListingBloc>(context)
                                  //               .expenseList[index]
                                  //               .money_exchange_id;
                                  //           String pur = BlocProvider.of<
                                  //                   ExpenseListingBloc>(context)
                                  //               .expenseList[index]
                                  //               .amount_in!;
                                  //           String rate = BlocProvider.of<
                                  //                   ExpenseListingBloc>(context)
                                  //               .expenseList[index]
                                  //               .rate!;
                                  //           String sales = BlocProvider.of<
                                  //                   ExpenseListingBloc>(context)
                                  //               .expenseList[index]
                                  //               .amount_out!;
                                  //           String date = BlocProvider.of<
                                  //                   ExpenseListingBloc>(context)
                                  //               .expenseList[index]
                                  //               .create_date!;
                                  //           int curin = BlocProvider.of<
                                  //                   ExpenseListingBloc>(context)
                                  //               .expenseList[index]
                                  //               .currencyInModel!
                                  //               .id;
                                  //           int curout = BlocProvider.of<
                                  //                   ExpenseListingBloc>(context)
                                  //               .expenseList[index]
                                  //               .currencyOutModel!
                                  //               .id;
                                  //           double rate_d = double.parse(
                                  //               BlocProvider.of<
                                  //                           ExpenseListingBloc>(
                                  //                       context)
                                  //                   .expenseList[index]
                                  //                   .rate!);
                                  //           double amouin = double.parse(BlocProvider.of<
                                  //                   ExpenseListingBloc>(context)
                                  //               .expenseList[index]
                                  //               .amount_in!);
                                  //           double amouout = double.parse(BlocProvider.of<
                                  //                   ExpenseListingBloc>(context)
                                  //               .expenseList[index]
                                  //               .amount_out!);
                                  //           Navigator.push(
                                  //               context,
                                  //               MaterialPageRoute(
                                  //                   builder: (context) =>
                                  //                       EditExchangeScreen(
                                  //                         id: id,
                                  //                         purchase: pur,
                                  //                         rate: rate,
                                  //                         sales: sales,
                                  //                         date: date,
                                  //                         currency_in: curin,
                                  //                         currency_out: curout,
                                  //                         rate_d: rate_d,
                                  //                         amount_in: amouin,
                                  //                         amount_out: amouout,
                                  //                       )));
                                  //         },
                                  //       )),
                                  //       SizedBox(height: 10),
                                  //       Expanded(
                                  //           child: InkWell(
                                  //         child: Container(
                                  //           width: 45,
                                  //           height: 45,
                                  //           decoration: BoxDecoration(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(5),
                                  //               color: Color(0xffEE1724),
                                  //               boxShadow: [
                                  //                 BoxShadow(
                                  //                   color:
                                  //                       grey.withOpacity(0.1),
                                  //                   offset: Offset(0, 1),
                                  //                   blurRadius: 5,
                                  //                 )
                                  //               ]),
                                  //           child: Icon(
                                  //             Icons.delete,
                                  //             color: white,
                                  //           ),
                                  //         ),
                                  //         onTap: () {
                                  //           deleteExchangeBloc.add(DeletePress(
                                  //               id: BlocProvider.of<
                                  //                           ExpenseListingBloc>(
                                  //                       context)
                                  //                   .expenseList[index]
                                  //                   .money_exchange_id));
                                  //         },
                                  //       ))
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            onTap: () {
                              int id =
                                  BlocProvider.of<ExpenseListingBloc>(context)
                                      .expenseList[index]
                                      .money_exchange_id;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewReciept(id: id)));
                            },
                          );
                        }),
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.of(context).pushNamed(addExpense, arguments: () {
          //   BlocProvider.of<ExpenseListingBloc>(context).add(
          //       InitializeExpenseList(
          //           dateRange: BlocProvider.of<ExpenseListingBloc>(context)
          //               .dateRange));
          // });
        },
      ),
    );
  }

  showPickerDateRange(BuildContext context) {
    String? _startDate;
    String? _endDate;

    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    Picker ps = Picker(
        confirmText: AppLocalizations.of(context)!.translate("confirm"),
        cancelText: AppLocalizations.of(context)!.translate("cancel"),
        hideHeader: true,
        adapter: DateTimePickerAdapter(
            type: PickerDateTimeType.kYMD, isNumberMonth: false),
        onConfirm: (Picker picker, List value) {
          _startDate = formatter
              .format((picker.adapter as DateTimePickerAdapter).value!);
        });

    Picker pe = Picker(
        hideHeader: true,
        adapter: DateTimePickerAdapter(type: PickerDateTimeType.kYMD),
        onConfirm: (Picker picker, List value) {
          _endDate = formatter
              .format((picker.adapter as DateTimePickerAdapter).value!);
        });

    List<Widget> actions = [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(PickerLocalizations.of(context).cancelText!)),
      TextButton(
          onPressed: () {
            Navigator.pop(context);
            ps.onConfirm!(ps, ps.selecteds);
            pe.onConfirm!(pe, pe.selecteds);
            BlocProvider.of<ExpenseListingBloc>(context)
                .add(InitializeExpenseList(dateRange: "$_startDate/$_endDate"));
          },
          child: Text(PickerLocalizations.of(context).confirmText!))
    ];

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.translate("selectDate")!),
            actions: actions,
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("${AppLocalizations.of(context)!.translate("begin")}:"),
                  ps.makePicker(),
                  Text("${AppLocalizations.of(context)!.translate("end")}:"),
                  pe.makePicker()
                ],
              ),
            ),
          );
        });
  }
}
