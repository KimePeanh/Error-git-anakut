import 'package:anakut_bank/src/features/apply_loan/screen/loan.dart';
import 'package:anakut_bank/src/features/cash_out/screen/cash_out.dart';
import 'package:anakut_bank/src/features/deposit/screen/deposit_screen.dart';
import 'package:anakut_bank/src/features/exchnage/screen/exchange_choice.dart';
import 'package:anakut_bank/src/features/expenses/screen/expenses.dart';
import 'package:anakut_bank/src/features/loan_calculator/screen/loan_calculator.dart';
import 'package:anakut_bank/src/features/mybank/screen/card.dart';
import 'package:anakut_bank/src/features/mybank/screen/widget.dart';
import 'package:anakut_bank/src/features/payment/screen/payment.dart';
import 'package:anakut_bank/src/features/recievce/screen/recievce.dart';
import 'package:anakut_bank/src/features/report/screen/report.dart';
import 'package:anakut_bank/src/features/setting/screen/settingScreen.dart';
import 'package:flutter/material.dart';
import '../../../../app_localiztion.dart';
import '../../../shared/widgets/widget.dart';
import '../../../utils/constants/app_constants.dart';

class MybankScreen extends StatefulWidget {
  const MybankScreen({Key? key}) : super(key: key);

  @override
  State<MybankScreen> createState() => _MybankScreenState();
}

final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();

class _MybankScreenState extends State<MybankScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
   // BlocProvider.of<CounterBloc>(context).add(FetchCounterStarted());

    final List<Widget> imagesList = [
      Container(
        margin: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.35,
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
                    style: TextStyle(fontWeight: bold, fontFamily: 'kh'),
                    textScaleFactor: 1.2,
                  ))),
                  Container(
                      child: Text(
                    "USD",
                    style: TextStyle(fontWeight: bold, fontFamily: 'kh'),
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
                        image: AssetImage("assets/images/Bank/Sim.png")),
                  ),
                  // child: Image(
                  //   //width: 40,
                  //   fit: BoxFit.fitHeight,
                  //   image: AssetImage("assets/images/Bank/Sim.png")),
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Amount : \$12000.00",
                style: TextStyle(fontFamily: 'kh', fontWeight: bold),
                textScaleFactor: 1.2,
              ),
            )),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(right: 10, bottom: 10, left: 10),
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
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "Close",
                              style: TextStyle(fontFamily: 'kh', color: white),
                              textScaleFactor: 1.1,
                            ),
                          ),
                          onTap: () {
                            showAlertDialogServicefee(context);
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
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Top Up",
                            style: TextStyle(fontFamily: 'kh', color: white),
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
      )
    ];

    // return BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
    //   if (state is FetchingCounter) {
    //     return Container(
    //       color: white,
    //       child: Center(
    //         child: Container(
    //             width: 100,
    //             child: LottieBuilder.asset(
    //                 "assets/images/Bank/lf30_editor_bmeqpdqv.json")),
    //       ),
    //     );
    //   } else if (state is ErrorFetchingCounter) {
    //     return Text(state.e.toString());
    //   }
      return Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  APPBAR(context),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 25),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 70,
                            padding: EdgeInsets.only(left: 10),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: white,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width - 100,
                            height: 70,
                            child: Text(
                              AppLocalizations.of(context)!
                                  .translate('mybank')!,
                              style: TextStyle(
                                  color: white,
                                  //fontWeight: FontWeight.bold,
                                  fontFamily: 'kh'),
                              textScaleFactor: 1.4,
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 70,
                            padding: EdgeInsets.only(right: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Column(
                      children: [
                        Cardd(),
                        // CarouselSlider(
                        //   options: CarouselOptions(
                        //     autoPlay: false,
                        //     reverse: false,
                        //     aspectRatio: 16 / 7.5,
                        //     // enlargeCenterPage: true,
                        //     //scrollDirection: Axis.vertical,
                        //     onPageChanged: (index, reason) {
                        //       setState(
                        //         () {
                        //           _currentIndex = index;
                        //         },
                        //       );
                        //     },
                        //   ),
                        //   items: imagesList
                        //       .map(
                        //         (item) => item,
                        //       )
                        //       .toList(),
                        // ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 80),
                  //   child: Column(
                  //     children: [
                  //       ListView.builder(
                  //         itemCount: 3,
                  //         itemBuilder: (context, index){
                  //           return imagesList[index]
                  //       })
                  //     ],
                  //   ),

                  // )
                ],
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
                        child: Menuu(
                            context,
                            "assets/images/Bank/send-money (1).png",
                            AppLocalizations.of(context)!.translate('send')!,
                            Colors.teal),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CashOutScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: InkWell(
                      child: Menuu(
                          context,
                          "assets/images/Bank/receive-money.png",
                          AppLocalizations.of(context)!.translate('receive')!,
                          mainColor),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecievceScreen()));
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
                        child: Stack(children: [
                          Menuu(
                              context,
                              "assets/images/Bank/exchange.png",
                              AppLocalizations.of(context)!.translate('monex')!,
                              Color(0xff7F0194)),
                        ]),
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> ApplyLoanScreen()));
                        //onTap: () =>
                        // _key.currentState?.showButtonMenu(),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExchangeChoice()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        child: Menuu(
                              context,
                              "assets/images/Bank/clipboard.png",
                              AppLocalizations.of(context)!
                                  .translate('billpay')!,
                              Color(0xffFF3E61)),
                        // child: Menuu(
                        //     context,
                        //     "assets/images/Bank/smartphone.png",
                        //     AppLocalizations.of(context)!.translate('topup')!,
                        //     Color(0xff4285F4)),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => PaymentScreen()));
                        },
                      ),
                    ),
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
                        child: 
                          Menuu(
                              context,
                              "assets/images/Bank/piggy-bank.png",
                              "Deposit",
                              Color(0xffFF9064)),                     
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DepositScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        child: Menuu(
                            context,
                            "assets/images/Bank/analysis.png",
                            AppLocalizations.of(context)!
                                .translate('expenses')!,
                            Color(0xffF858CB)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExpensesScreen()));
                        },
                      ),
                    ),
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
                        child: Stack(children: [
                          Menuu(
                              context,
                              "assets/images/Bank/salary.png",
                              AppLocalizations.of(context)!.translate('loan')!,
                              Color(0xff126696)),
                        ]),
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> ApplyLoanScreen()));
                        //onTap: () =>
                        // _key.currentState?.showButtonMenu(),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoanScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        child: Menuu(
                            context,
                            "assets/images/Bank/interest-rate (1).png",
                            "Calculator",
                            Color(0xffFF6636)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoanCalculator()));
                        },
                      ),
                    ),
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
                        child: Stack(children: [
                          Menuu(
                              context,
                              "assets/images/Bank/settings (1).png",
                              AppLocalizations.of(context)!
                                  .translate('setting')!,
                              Color(0xff3B84FE)),
                        ]),
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> ApplyLoanScreen()));
                        //onTap: () =>
                        // _key.currentState?.showButtonMenu(),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        child: Menuu(
                            context,
                            "assets/images/growth.png",
                            AppLocalizations.of(context)!.translate('report')!,
                            Color(0xff029E24)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      );
  }

  showAlertDialogServicefee(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure to cloes this Counter?"),
      content: Container(
        height: 100,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                isDense: true,
                labelText: "Enter Counter name to Delete",
                labelStyle: TextStyle(fontFamily: 'kh'),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                  gapPadding: 10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                  gapPadding: 10,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!.translate("phReq");
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
