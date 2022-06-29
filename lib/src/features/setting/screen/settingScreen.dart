import 'package:anakut_bank/src/features/exchnage/screen/exchange_choice.dart';
import 'package:anakut_bank/src/features/setting/screen/Detail/home_partner.dart';
import 'package:anakut_bank/src/features/setting/screen/Detail/loansetting.dart';
import 'package:anakut_bank/src/features/setting/screen/Detail/service_fee.dart';
import 'package:anakut_bank/src/features/setting/screen/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app_localiztion.dart';
import 'Detail/bill_payment.dart';
import 'Detail/counter.dart';
import 'Detail/currencydetail.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String dropdownValue2 = "Send Money";
  @override
  Widget build(BuildContext context) {
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
          "Setting",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              //   Container(
              //   height: MediaQuery.of(context).size.height * 0.11,
              //   width: MediaQuery.of(context).size.width * 0.95,
              //   child: Row(
              //     children: <Widget>[
              //       Expanded(
              //         child: InkWell(
              //           child: Menuu(
              //               context, "assets/images/fee.png", "Service fee"),
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => ServiceFee()));
              //           },
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //           child: InkWell(
              //         child: Menuu(context, "assets/images/exchange-rate.png",
              //             "Exchnage Rate"),
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => ExchangeRate()));
              //         },
              //       )),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.11,
              //   width: MediaQuery.of(context).size.width * 0.95,
              //   child: Row(
              //     children: <Widget>[
              //       Expanded(
              //         child: InkWell(
              //           child: Stack(children: [
              //             Menuu(context, "assets/images/receipt.png",
              //                 "Bill Payment"),
              //           ]),
              //           //Navigator.push(context, MaterialPageRoute(builder: (context)=> ApplyLoanScreen()));
              //           //onTap: () =>
              //           // _key.currentState?.showButtonMenu(),
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => PaymentScreen()));
              //           },
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: Menuu(
              //             context, "assets/images/expenses.png", "Expenses"),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.11,
              //   width: MediaQuery.of(context).size.width * 0.95,
              //   child: Row(
              //     children: <Widget>[
              //       Expanded(
              //         child: InkWell(
              //           child: Stack(children: [
              //             Menuu(context, "assets/images/exchange (1).png",
              //                 "Money Exchange"),
              //           ]),
              //           //Navigator.push(context, MaterialPageRoute(builder: (context)=> ApplyLoanScreen()));
              //           //onTap: () =>
              //           // _key.currentState?.showButtonMenu(),
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => ExchangeChoice()));
              //           },
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: Menuu(
              //             context, "assets/images/earth.png", "Transfer Oversea"),
              //       ),
              //     ],
              //   ),
              // ),

              // InkWell(
              //   child: menuu(context, "Service fee"),
              //   onTap: () {
              //     showAlertDialogServicefee(context);
              //   },
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // InkWell(
              //   child: menuu(context, "Exchange Rate"),
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => ExchangeRate()));
              //   },
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // InkWell(
              //   child: menuu(context, "Set up Currency"),
              //   onTap: () {
              //     showAlertDialog(context);
              //   },
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // menuu(context, "Set up Bill Payment"),
              Container(
                height: MediaQuery.of(context).size.height * 0.11,
                width: MediaQuery.of(context).size.width * 0.92,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        child: settingg(context, "assets/images/Bank/rate.png",
                            "Currency", Color(0xffFF3E61)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CurrencyDetail()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: InkWell(
                      child: settingg(context, "assets/images/Bank/r.png",
                          "Exchnage Rate", Color(0xff7F0194)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExchangeChoice()));
                      },
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.11,
                width: MediaQuery.of(context).size.width * 0.92,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        child: settingg(context, "assets/images/Bank/money.png",
                            "Service Fee", Color(0xff3B84FE)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServiceFee()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: InkWell(
                      child: settingg(
                          context,
                          "assets/images/Bank/social-media (1).png",
                          "Home Partner",
                          Color(0xff029E24)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePartner()));
                      },
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.11,
                width: MediaQuery.of(context).size.width * 0.92,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        child: settingg(
                            context,
                            "assets/images/Bank/clipboard.png",
                            "Bill Payment",
                            Color(0xffFF6636)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BillPaymentSettingDetail()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: InkWell(
                      child: settingg(
                          context,
                          "assets/images/Bank/cashier-machine (1).png",
                          "Counter",
                          Color(0xffF858CB)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Counter()));
                      },
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.11,
                width: MediaQuery.of(context).size.width * 0.92,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        child: settingg(
                            context,
                            "assets/images/Bank/salary.png",
                            "Loan",
                            Colors.teal),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoanSetting()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: InkWell(
                      // child: settingg(
                      //     context,
                      //     "assets/images/Bank/cashier-machine (1).png",
                      //     "Counter",
                      //     Color(0xffF858CB)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Counter()));
                      },
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
