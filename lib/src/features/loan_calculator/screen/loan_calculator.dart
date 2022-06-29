import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Input_form.dart';
import 'Loan_type.dart';
import 'loan.dart';

class LoanCalculator extends StatefulWidget {
  const LoanCalculator({Key? key}) : super(key: key);

  @override
  State<LoanCalculator> createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
            title: Text(
              "Calculator",
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            bottom: TabBar(
              indicatorColor: mainColor,
              //indicatorSize: ,
              labelColor: mainColor,
              labelStyle: TextStyle(fontSize: 17),
              unselectedLabelStyle: TextStyle(fontSize: 17),
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: "Loan",
                ),
                Tab(
                  text: "Deposit",
                )
              ],
            ),
          ),
          // body: SingleChildScrollView(
          //   child: Center(
          //     child: Column(
          //       children: <Widget>[
          //         SizedBox(
          //           height: 10,
          //         ),
          //       LoanType(),
          //       SizedBox(height: 10,),
          //       LoanForm(),
          //       ],
          //     ),
          //   ),
          // ),
          body: TabBarView(
            children: [
              // LocalSend(),
              // OverSeaTransfer(),
              Loan(),
              Container(),
            ],
          )),
    );
  }
}
