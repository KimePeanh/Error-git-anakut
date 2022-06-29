import 'package:anakut_bank/src/expense/bloc/expense_listing_bloc.dart';
import 'package:anakut_bank/src/features/exchnage/bloc/edit_bloc/bloc/edit_bloc.dart';
import 'package:anakut_bank/src/features/login/screen/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'expense_page.dart';

EditBloc editBloc = EditBloc();

class EditExchangeScreen extends StatefulWidget {
  //const EditExchangeScreen({Key? key}) : super(key: key);
  // final ExchangeHistoryModel historyModel;
//  final ExchangeHistoryModel historyModel;
//   EditExchangeScreen({required this.historyModel});
  final int id;
  final String purchase;
  final String rate;
  final String sales;
  final String date;
  final int currency_in;
  final int currency_out;
  final double rate_d;
  final double amount_in;
  final double amount_out;
  EditExchangeScreen({
    required this.id,
    required this.purchase,
    required this.rate,
    required this.sales,
    required this.date,
    required this.currency_in,
    required this.currency_out,
    required this.rate_d,
    required this.amount_in,
    required this.amount_out,
  });

  @override
  State<EditExchangeScreen> createState() => _EditExchangeScreenState();
}

class _EditExchangeScreenState extends State<EditExchangeScreen> {
  TextEditingController invno = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController pur = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController sale = TextEditingController();
  @override
  void initState() {
    invno.text = "ANK${widget.id.toString()}";
    date.text = widget.date.toString();
    pur.text = widget.purchase.toString();
    rate.text = widget.rate.toString();
    sale.text = widget.sales.toString();

    super.initState();
  }

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
            "Edit Money Exchange History",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  editBloc.add(EditPress(
                      currency_in: widget.currency_in,
                      currency_out: widget.currency_out,
                      rate: widget.rate_d,
                      amount_in: widget.amount_in,
                      amount_out: widget.amount_out,
                      id: widget.id));
                },
                icon: Icon(
                  Icons.check,
                  color: Colors.black,
                ))
          ],
        ),
        body: BlocListener(
          bloc: editBloc,
          listener: (context, state) {
            if (state is Editing) {
              loadingDialogs(context);
            } else if (state is ErrorEdit) {
              Navigator.pop(context);
              print(state.e.toString());
            } else if (state is Edited) {
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ExpensePage()));
            }
          },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      readOnly: true,
                      controller: invno,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        //fillColor: Color(0xffFEF2D5),
                        // filled: true,
                        labelText: "Invoice No",
                        labelStyle: TextStyle(fontFamily: 'kh'),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          gapPadding: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      readOnly: true,
                      controller: date,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        //fillColor: Color(0xffFEF2D5),
                        // filled: true,
                        labelText: "Date",
                        labelStyle: TextStyle(fontFamily: 'kh'),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          gapPadding: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: pur,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        //fillColor: Color(0xffFEF2D5),
                        // filled: true,
                        labelText: "Purchase money",
                        labelStyle: TextStyle(fontFamily: 'kh'),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          gapPadding: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: rate,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        //fillColor: Color(0xffFEF2D5),
                        // filled: true,
                        labelText: "Rate",
                        labelStyle: TextStyle(fontFamily: 'kh'),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          gapPadding: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: sale,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        //fillColor: Color(0xffFEF2D5),
                        // filled: true,
                        labelText: "Sales money",
                        labelStyle: TextStyle(fontFamily: 'kh'),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          gapPadding: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
