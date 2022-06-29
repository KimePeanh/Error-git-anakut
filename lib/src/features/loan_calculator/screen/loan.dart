import 'package:flutter/material.dart';

import '../../../utils/constants/app_constants.dart';
import 'Input_form.dart';
import 'Loan_type.dart';

class Loan extends StatefulWidget {
  const Loan({Key? key}) : super(key: key);

  @override
  State<Loan> createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  TextEditingController loan_term = TextEditingController();
  List<int> term_list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              LoanType(),
              SizedBox(
                height: 10,
              ),
              Container(
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
                            labelStyle:
                                TextStyle(fontFamily: 'kh', fontSize: 17),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
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
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          controller: loan_term,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: "Loan Term (Month)",
                            labelStyle:
                                TextStyle(fontFamily: 'kh', fontSize: 17),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
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
                           
                          },
                          onSaved: (va){
                            
                          },
                          onChanged: (va){
                            //  int term = int.parse(va);
                            // for(int i = 0; i < term; i++){
                            //   term_list.add(i++);
                            // }
                            // print(term_list);
                            print(loan_term.text.toString());
                          },
                        ),
                      ),
                      
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          //controller: _emailController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: "Loan Rate (%)",
                            labelStyle:
                                TextStyle(fontFamily: 'kh', fontSize: 17),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
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
                      SizedBox(
                        height: 100,
                      ),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 50,
        color: mainColor,
        child: Text("Calculator", style: TextStyle(color: white, fontWeight: bold),textScaleFactor: 1.2,),
      ),
    );
  }
}
