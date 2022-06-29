import 'dart:math';

import 'package:anakut_bank/src/features/cash_out/bloc/bloc/bloc/create_cashout_bloc.dart';
import 'package:anakut_bank/src/features/cash_out/screen/receipt.dart';
import 'package:anakut_bank/src/features/exchnage/bloc/create_bloc/bloc/create_bloc.dart';
import 'package:anakut_bank/src/features/exchnage/screen/receipt.dart';
import 'package:anakut_bank/src/features/login/screen/dialog.dart';
import 'package:anakut_bank/src/features/recievce/screen/recievce.dart';
import 'package:anakut_bank/src/features/setting/blog/setting/bloc/currency_bloc/bloc/currency_bloc.dart';
import 'package:anakut_bank/src/shared/widgets/errorSnackbar.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

CurrencyBloc currencyBloc = CurrencyBloc();
CreateCashoutBloc createCashoutBloc = CreateCashoutBloc();

class LocalSend extends StatefulWidget {
  const LocalSend({Key? key}) : super(key: key);

  @override
  State<LocalSend> createState() => _LocalSendState();
}

class _LocalSendState extends State<LocalSend> {
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  late TextEditingController? rec = TextEditingController();
  late TextEditingController? send = TextEditingController();
  late TextEditingController? code = TextEditingController();
  late TextEditingController? amount = TextEditingController();
  String Date = DateFormat.yMd().format(DateTime.now());
  String time = DateFormat.jm().format(DateTime.now());
  SingingCharacter? _character = SingingCharacter.USD;
  var CURRENCY_CODES = [];
  String currency = "USD";
  bool _isElevated = false;
  String curr = "USD";
  String symbol= "";
  int? id;
  var random = new Random();
  @override
  void initState() {
    currencyBloc.add(FetchCurrencyStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
          bloc: currencyBloc,
          builder: (context, state) {
            if (state is FetchingCurrency) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorFetchingCurrency) {
              return Text(state.e.toString());
            }
            CURRENCY_CODES.clear();
            currencyBloc.getCurrency.forEach((data) {
              CURRENCY_CODES.add(data.name);
            });
            return BlocListener(
              bloc: createCashoutBloc,
              listener: (context, state) {
                if (state is CreatingCashout) {
                  loadingDialogs(context);
                } else if (state is ErrorCreateCashout) {
                  Navigator.pop(context);
                  errorSnackBar(text: state.e.toString(), context: context);
                } else if (state is CreatedCashout) {
                  Navigator.pop(context);
                  Fluttertoast.showToast(msg: "Success");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewRecieptM(
                              sender: send!.text.toString(),
                              rec: rec!.text.toString(),
                              amount: amount!.text.toString(),
                              code: code!.text.toString(), symbol: symbol,)));
                }
              },
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Text(
                              "Information",
                              style: TextStyle(fontFamily: 'kh'),
                              textScaleFactor: 1.1,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            //height: 44,
                            color: Colors.grey.shade100,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: send,
                              decoration: InputDecoration(
                                  hintText: "Sender",

                                  //hintStyle: TextStyle(color: Colors.grey.shade400),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey.shade400)),
                                  enabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            //height: 44,
                            color: Colors.grey.shade100,
                            child: 
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: rec,
                              decoration: InputDecoration(
                                  hintText: "Receiver",
                                  // hintStyle: TextStyle(color: Colors.grey.shade400),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey.shade400)),
                                  enabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 14),
                            width: MediaQuery.of(context).size.width * 0.9,
                            //height: 44,
                            color: Colors.grey.shade100,
                            child: Row(
                              children: [
                                PopupMenuButton(
                                  onSelected: (c) {
                                    setState(() {
                                      currency = c.toString();
                                      for (int i = 0;
                                          i < currencyBloc.getCurrency.length;
                                          i++) {
                                        if (c ==
                                            currencyBloc.getCurrency[i].name) {
                                          id = currencyBloc.getCurrency[i].id;
                                          symbol = currencyBloc.getCurrency[i].symbol!;

                                        }
                                      }
                                    });
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Text(currency),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                  itemBuilder: (context) => CURRENCY_CODES
                                      .map((c) => PopupMenuItem(
                                          value: c, child: Text(c.toString())))
                                      .toList(),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: amount,
                                    decoration: InputDecoration(
                                        hintText: "Amount",
                                        // hintStyle: TextStyle(color: Colors.grey.shade400),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.grey.shade400)),
                                        enabledBorder: InputBorder.none,
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 8.0, top: 8.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 14),
                            width: MediaQuery.of(context).size.width * 0.9,
                            //height: 44,
                            color: Colors.grey.shade100,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: code,
                                    decoration: InputDecoration(
                                        hintText: "Code",
                                        // hintStyle: TextStyle(color: Colors.grey.shade400),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.grey.shade400)),
                                        enabledBorder: InputBorder.none,
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 8.0, top: 8.0)),
                                  ),
                                ),
                                InkWell(
                                  child: Image(
                                      width: 30,
                                      height: 30,
                                      image: AssetImage(
                                          "assets/images/random.png")),
                                  onTap: () {
                                    setState(() {
                                      code!.text =
                                          random.nextInt(1000000).toString();
                                      print(random.nextInt(1000000).toString());
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: mainColor,
                ),
                child: Text("Send",
                    style: TextStyle(color: white, fontWeight: bold),
                    textScaleFactor: 1.1),
              ),
              onTap: () {
                createCashoutBloc.add(CreatePress(
                    currency_id: id!,
                    transaction_reference: code!.text.toString(),
                    amount: amount!.text.toString(),
                    sender_phone: send!.text.toString(),
                    receiver_phone: rec!.text.toString()));
               
              },
            ),
          ],
        ),
      ),
    );
  }
}
