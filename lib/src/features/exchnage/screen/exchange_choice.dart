import 'package:anakut_bank/src/expense/screens/expense_page.dart';
import 'package:anakut_bank/src/features/exchnage/bloc/bloc/exchange_bloc.dart';
import 'package:anakut_bank/src/features/exchnage/screen/new_exchange.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:money_formatter/money_formatter.dart';

import 'exchange_history.dart';
import 'exchange_history.dart';

class ExchangeChoice extends StatefulWidget {
  const ExchangeChoice({Key? key}) : super(key: key);

  @override
  State<ExchangeChoice> createState() => _ExchangeChoiceState();
}

class _ExchangeChoiceState extends State<ExchangeChoice> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ExchangeBloc>(context).add(FetchExchangeStarted());
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
          "Money Exchange",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExpensePage()));
                },
                icon: Icon(
                  Icons.history,
                  color: Colors.black,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "From",
                        style: TextStyle(fontFamily: 'kh', fontWeight: bold),
                        textScaleFactor: 1.2,
                      ),
                    )),
                    Container(
                      width: 30,
                      height: 30,
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "To",
                        style: TextStyle(fontFamily: 'kh', fontWeight: bold),
                        textScaleFactor: 1.2,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Rate",
                        style: TextStyle(
                            fontFamily: 'kh',
                            fontWeight: bold,
                            color: Colors.green),
                        textScaleFactor: 1.2,
                      ),
                    )),
                  ],
                ),
              ),
              // Container(
              //   width: 50,
              //   child: LottieBuilder.asset("assets/images/Bank/lf30_editor_bmeqpdqv.json")),
              SizedBox(height: 10),
              BlocBuilder<ExchangeBloc, ExchangeState>(
                builder: (context, state) {
                  print(state);
                  if (state is FetchingExchnage) {
                    return Center(
                      child: Container(
                          width: 100,
                          child: LottieBuilder.asset(
                              "assets/images/Bank/lf30_editor_bmeqpdqv.json")),
                    );
                  } else if (state is ErrorFetching) {
                    return Text(state.error.toString());
                  }
                  print(BlocProvider.of<ExchangeBloc>(context)
                      .exchangeModel
                      .toString());
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          BlocProvider.of<ExchangeBloc>(context).rate.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          offset: Offset(2, 2),
                                          blurRadius: 1)
                                    ]),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        BlocProvider.of<ExchangeBloc>(context)
                                            .rate[index]
                                            .fromModel!
                                            .name,
                                        style: TextStyle(
                                            fontFamily: 'kh', fontWeight: bold),
                                        textScaleFactor: 1.2,
                                      ),
                                    )),
                                    Container(
                                        width: 30,
                                        height: 30,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/Bank/exchange (4).png"))),
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        BlocProvider.of<ExchangeBloc>(context)
                                            .rate[index]
                                            .inModel!
                                            .name,
                                        style: TextStyle(
                                            fontFamily: 'kh', fontWeight: bold),
                                        textScaleFactor: 1.2,
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        double.parse(
                                                BlocProvider.of<ExchangeBloc>(
                                                        context)
                                                    .rate[index]
                                                    .rate_out)
                                            .toStringAsFixed(2),
                                        // '${MoneyFormatter(amount: double.parse(
                                        //   BlocProvider.of<ExchangeBloc>(
                                        //                 context)
                                        //             .rate[index]
                                        //             .rate_out)
                                        // )}'.toString(),
                                        style: TextStyle(
                                            fontFamily: 'kh',
                                            fontWeight: bold,
                                            color: Colors.green),
                                        textScaleFactor: 1.2,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Exchange(
                                        state: "in",
                                        from: BlocProvider.of<ExchangeBloc>(
                                                context)
                                            .rate[index]
                                            .fromModel!
                                            .name,
                                        to: BlocProvider.of<ExchangeBloc>(
                                                context)
                                            .rate[index]
                                            .inModel!
                                            .name,
                                        rate: BlocProvider.of<ExchangeBloc>(
                                                context)
                                            .rate[index]
                                            .rate_out,
                                        currency_in:
                                            BlocProvider.of<ExchangeBloc>(
                                                    context)
                                                .rate[index]
                                                .fromModel!
                                                .id
                                                .toDouble(),
                                        currency_out:
                                            BlocProvider.of<ExchangeBloc>(
                                                    context)
                                                .rate[index]
                                                .inModel!
                                                .id
                                                .toDouble(),
                                      ),
                                    ));
                              },
                            ),
                            InkWell(
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          offset: Offset(2, 2),
                                          blurRadius: 1)
                                    ]),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        BlocProvider.of<ExchangeBloc>(context)
                                            .rate[index]
                                            .inModel!
                                            .name,
                                        style: TextStyle(
                                            fontFamily: 'kh', fontWeight: bold),
                                        textScaleFactor: 1.2,
                                      ),
                                    )),
                                    Container(
                                        width: 30,
                                        height: 30,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/Bank/exchange (4).png"))),
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        BlocProvider.of<ExchangeBloc>(context)
                                            .rate[index]
                                            .fromModel!
                                            .name,
                                        style: TextStyle(
                                            fontFamily: 'kh', fontWeight: bold),
                                        textScaleFactor: 1.2,
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        double.parse(
                                                BlocProvider.of<ExchangeBloc>(
                                                        context)
                                                    .rate[index]
                                                    .rate_in)
                                            .toStringAsFixed(2),
                                        style: TextStyle(
                                            fontFamily: 'kh',
                                            fontWeight: bold,
                                            color: Colors.green),
                                        textScaleFactor: 1.2,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Exchange(
                                              state: "out",
                                              from:
                                                  BlocProvider.of<ExchangeBloc>(
                                                          context)
                                                      .rate[index]
                                                      .inModel!
                                                      .name,
                                              to: BlocProvider.of<ExchangeBloc>(
                                                      context)
                                                  .rate[index]
                                                  .fromModel!
                                                  .name,
                                              rate:
                                                  BlocProvider.of<ExchangeBloc>(
                                                          context)
                                                      .rate[index]
                                                      .rate_in,
                                              currency_in:
                                                  BlocProvider.of<ExchangeBloc>(
                                                          context)
                                                      .rate[index]
                                                      .inModel!
                                                      .id
                                                      .toDouble(),
                                              currency_out:
                                                  BlocProvider.of<ExchangeBloc>(
                                                          context)
                                                      .rate[index]
                                                      .fromModel!
                                                      .id
                                                      .toDouble(),
                                            )));
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
