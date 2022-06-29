import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'loan_schedule.dart';
import 'loan_sumarry.dart';

class NewLoan extends StatefulWidget {
  const NewLoan({Key? key}) : super(key: key);

  @override
  State<NewLoan> createState() => _NewLoanState();
}

class _NewLoanState extends State<NewLoan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Loan Management", style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
            LoanSumary(),
            SizedBox(height: 10,),
            LoanSchedule()
            ],
          ),
        ),
      ),
    );
  }
}
