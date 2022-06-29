import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoanPayment extends StatefulWidget {
  const LoanPayment({ Key? key }) : super(key: key);

  @override
  State<LoanPayment> createState() => _LoanPaymentState();
}

class _LoanPaymentState extends State<LoanPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        
      ),
      body: SingleChildScrollView(child: Center(
        child: Column(
          children: <Widget>[
            SafeArea(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.account_balance,size: 40,color: Colors.green,),
                SizedBox(width: 10,),
                Text("Anakut Bank",style: TextStyle(color: Colors.green, fontFamily: 'kh', fontWeight: bold),textScaleFactor: 2,)
              ],
            ),
            
            ),
            SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.topLeft,
                      child: Text("Address"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          ": @87, st 164 (In-front of Backtouk School), Phnom Penh, Cambodia"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.topLeft,
                      child: Text("Phone Number"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(": 010601168"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Agent"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(": Anakut MoneyExchange"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Invoice Number"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(": ANK112233"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Exchange Date"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(": {widget.date}  {widget.time}"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color(0xffFEF2D5),
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Purchase money"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(": {widget.amount}.00 {widget.from}"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color(0xffFEF2D5),
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Exchange rate"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(": {widget.rate}"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color(0xffFEF2D5),
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Sales money"),
                    )),
                    Expanded(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(": {widget.receive}.00 {widget.to}",
                                style: TextStyle(color: Colors.red))))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 1,
                  color: Colors.black),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("Expires on {widget.date}"),
                    Text("Be sure to check before leaving"),
                    Text(
                        "We are not responsible for any departure from our store."),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Row(
                    children: List.generate(
                        150 ~/ 3,
                        (index) => Expanded(
                              child: Container(
                                color: index % 2 == 0
                                    ? Colors.transparent
                                    : Colors.grey,
                                height: 2,
                              ),
                            )),
                  )),
          ],
        ),
      ),),
    );
  }
}