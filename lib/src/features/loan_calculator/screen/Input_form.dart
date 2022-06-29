import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../app_localiztion.dart';



class LoanForm extends StatefulWidget {
  const LoanForm({ Key? key }) : super(key: key);

  @override
  State<LoanForm> createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              "Loan Detail",
              style: TextStyle(fontFamily: 'kh', fontWeight: bold),
              textScaleFactor: 1,
            ),
          ),
          SizedBox(height: 15),
           Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                //controller: _emailController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: "Loan Amount",
                  labelStyle: TextStyle(fontFamily: 'kh', fontSize: 17),
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
                  // if (value!.isEmpty) {
                  //   return AppLocalizations.of(context)!.translate("phReq");
                  // }
                  // return null;
                },
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                //controller: _emailController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: "Loan Term (Month)",
                  labelStyle: TextStyle(fontFamily: 'kh', fontSize: 17),
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
                  // if (value!.isEmpty) {
                  //   return AppLocalizations.of(context)!.translate("phReq");
                  // }
                  // return null;
                },
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                //controller: _emailController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: "Loan Rate (%)", 
                  labelStyle: TextStyle(fontFamily: 'kh', fontSize: 17),
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
                  // if (value!.isEmpty) {
                  //   return AppLocalizations.of(context)!.translate("phReq");
                  // }
                  // return null;
                },
              ),
            ),
            SizedBox(height: 100,),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*0.7,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: mainColor,
              ),
              child: Text("Calculate", style: TextStyle(color: white, fontWeight: bold, fontFamily: 'kh'),textScaleFactor: 1.2,),
            ),
          ],
        ),
      ),
    );
  }
}