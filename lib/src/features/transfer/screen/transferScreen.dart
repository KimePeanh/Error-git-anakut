import 'dart:developer';

import 'package:anakut_bank/app_localiztion.dart';
import 'package:anakut_bank/src/features/home/bloc/bloc/getshop_bloc.dart';
import 'package:anakut_bank/src/features/home/screen/homeScreen.dart';
import 'package:anakut_bank/src/features/transfer/screen/pay.dart';
import 'package:anakut_bank/src/features/transfer/screen/transfer_choice.dart';
import 'package:anakut_bank/src/shared/widgets/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class TransferScreen extends StatefulWidget {
  //const TransferScreen({Key? key}) : super(key: key);
  int index;
  String qr;
  String point;
  String name;
  String page;
  String url;
  TransferScreen(this.index, this.qr, this.point, this.name, this.page, this.url);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  String account = "";
  // List<String> title = [
  //   //"AHA Cambodia",
  //   "Galaxy Computer",
  //   "K Mart",
  //   "ABC Book",
  //   "Baby Mart Cambodia",
  //   "Lady Skin Care",
  // ];
  // List<String> Imagelist = [
  //   //"assets/images/aha.jpg",
  //   "assets/images/galaxy.jpg",
  //   "assets/images/kmart.jpg",
  //   "assets/images/abcbook.jpg",
  //   "assets/images/baby.png",
  //   "assets/images/ladyskincare.jpg",
  // ];

  void checkqr() {
    if (widget.qr == "") {
      setState(() {
        account = "Enter receiver account number";
      });
    } else {
      setState(() {
        account = widget.qr;
        print('transfer qr');
        print(widget.qr);
      });
    }
  }

  List<String> Point = ["5 pt", "7 pt", "1 pt", "3 pt", "5 pt"];
  TextEditingController choice = TextEditingController();
  TextEditingController accountnumCon = TextEditingController();
  TextEditingController amountCon = TextEditingController();
  TextEditingController remarkCon = TextEditingController();
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  String input = "";
  String availeble = "";

  @override
  void initState() {
    choice.text = widget.page == "pt"
        ? "${widget.name} Point   ${widget.point} point"
        : "Choose the point which you want to send";
    accountnumCon.text = widget.qr;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.url);
    print(widget.index);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        toolbarHeight: 65,
        backgroundColor: mainColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen("")));
            },
            icon: Icon(
              Icons.arrow_back,
              color: white,
              size: 30,
            )),
        title: Text(
          AppLocalizations.of(context)!.translate('send')!,
          style: TextStyle(
              fontSize: 25,
              color: white,
              fontWeight: FontWeight.bold,
              fontFamily: 'kh'),
        ),
        centerTitle: true,
      ),
      // body: SingleChildScrollView(
      //   child: Center(
      //     child: Column(
      //       children: <Widget>[
      //         SizedBox(
      //           height: 30,
      //         ),
      //         Container(
      //           width: MediaQuery.of(context).size.width - 100,
      //           child: Row(
      //             children: <Widget>[
      //               Expanded(
      //                   child: Container(
      //                 child: Image(
      //                   width: 80,
      //                   height: 80,
      //                   image: AssetImage(Imagelist[widget.index]),
      //                 ),
      //               )),
      //               Container(
      //                 width: 40,
      //                 height: 40,
      //                 child: Image(
      //                   image: AssetImage("assets/images/data-transfer.png"),
      //                 ),
      //               ),
      //               Expanded(
      //                   child: Container(
      //                 child: Image(
      //                   width: 80,
      //                   height: 80,
      //                   image: AssetImage(Imagelist[widget.index]),
      //                 ),
      //               )),
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           height: 30,
      //         ),
      //         Container(
      //           width: MediaQuery.of(context).size.width - 50,
      //           //height: 40,
      //           child: TextFormField(
      //             controller: accountnumCon,
      //             decoration: InputDecoration(
      //                 enabledBorder: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(10),
      //                   borderSide: BorderSide(color: mainColor),
      //                 ),
      //                 hintText: "Enter receiver account number",
      //                 // hintStyle: TextStyle(fontFamily: 'kh')
      //                 focusedBorder: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(10),
      //                     borderSide: BorderSide(color: mainColor))),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Container(
      //           width: MediaQuery.of(context).size.width - 50,
      //           //height: 40,
      //           child: TextFormField(
      //             controller: amountCon,
      //             decoration: InputDecoration(
      //                 enabledBorder: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(10),
      //                   borderSide: BorderSide(color: mainColor),
      //                 ),
      //                 hintText: "Amount",
      //                 // hintStyle: TextStyle(fontFamily: 'kh')
      //                 focusedBorder: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(10),
      //                     borderSide: BorderSide(color: mainColor))),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Container(
      //           width: MediaQuery.of(context).size.width - 50,
      //           //height: 40,
      //           child: TextFormField(
      //             controller: remarkCon,
      //             decoration: InputDecoration(
      //                 enabledBorder: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(10),
      //                   borderSide: BorderSide(color: mainColor),
      //                 ),
      //                 hintText: "Remark",
      //                 // hintStyle: TextStyle(fontFamily: 'kh')
      //                 focusedBorder: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(10),
      //                     borderSide: BorderSide(color: mainColor))),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width - 30,
                height: 100,
               // color: white,
                //color: Color(0xffFEF2D5),
                // child: Lottie.network(
                //     'https://assets5.lottiefiles.com/packages/lf20_se2DT5.json'),
              
                child: widget.url == ""?
                Image(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/images/logobank.png")):Image(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(widget.url)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // height: 45,
                width: MediaQuery.of(context).size.width - 20,
                child: TextFormField(
                  maxLines: 1,
                  minLines: 1,
                  controller: choice,
                  readOnly: true,
                  decoration: InputDecoration(
                      isDense: true,
                      //labelText: "d",
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      label: Text("Account"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: grey))),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChoiceScreen()));
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  controller: accountnumCon,
                  //readOnly: true,
                  decoration: InputDecoration(
                      isDense: true,
                      //labelText: "d",
                      //suffixIcon: Icon(Icons.arrow_drop_down),
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(Icons.book),
                      //floatingLabelBehavior: FloatingLabelBehavior.always,
                      label: Text("Enter receiver account"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: grey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                        gapPadding: 5,
                      )),
                  maxLines: 1,
                  minLines: 1,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: amountCon,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        isDense: true,
                        label: Text("Amount"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: grey)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: grey),
                          gapPadding: 5,
                        )),
                    maxLines: 1,
                    minLines: 1,
                    // onChanged: (value) {
                    //   setState(() {
                    //     String input = amountCon.text;
                    //   String availeble = widget.point;
                    //   if (int.parse(input) <
                    //       int.parse(availeble)) {
                    //     print("Righttttttttttttttttt");
                    //   } else {
                    //     print("nooooooooooooooooooooooooooooo");
                    //   }
                    //   });
                    // },
                    onChanged: (val) {
                      print("okkkkkk");
                      setState(() {
                        input = amountCon.text;
                        availeble = widget.point;
                        print(input);
                        log(input);
                        if (int.parse(input) < int.parse(availeble)) {
                          print("Righttttttttttttttttt");
                          log("Righttttttttttttttttt");
                        } else {
                          print("nooooooooooooooooooooooooooooo");
                          log("nooooooooooooooooooooooooooooo");
                        }
                      });
                    },

                    validator: (value) {
                      if (value!.isEmpty ||
                          int.parse(input) > int.parse(availeble)) {
                        return "Invalid amount";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  controller: remarkCon,
                  decoration: InputDecoration(
                      isDense: true,
                      label: Text("Remark (Optional)"),
                      prefixIcon: Icon(Icons.edit),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: grey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                        gapPadding: 5,
                      )),
                  maxLines: 1,
                  minLines: 1,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text("Summary",
                      style: TextStyle(color: Colors.red, fontWeight: bold))),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                //height: 200,
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xffFEF2D5).withOpacity(0.3),
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Point",
                                    style: TextStyle(
                                        fontWeight: bold,
                                        fontFamily: 'kh',
                                        fontSize: 17),
                                  ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    " : ${widget.name}",
                                    style: TextStyle(
                                        fontFamily: 'kh', fontSize: 17),
                                  )))
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Amount",
                                    style: TextStyle(
                                        fontWeight: bold,
                                        fontFamily: 'kh',
                                        fontSize: 17),
                                  ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    " : ${amountCon.text}",
                                    style: TextStyle(
                                        fontFamily: 'kh', fontSize: 17),
                                  )))
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "To account",
                                    style: TextStyle(
                                        fontWeight: bold,
                                        fontFamily: 'kh',
                                        fontSize: 17),
                                  ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    " : ${accountnumCon.text}",
                                    style: TextStyle(
                                        fontFamily: 'kh', fontSize: 17),
                                  )))
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Remark",
                                    style: TextStyle(
                                        fontWeight: bold,
                                        fontFamily: 'kh',
                                        fontSize: 17),
                                  ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    " : ${remarkCon.text}",
                                    style: TextStyle(
                                        fontFamily: 'kh', fontSize: 17),
                                  )))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        child: Container(
          height: 60,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          color: mainColor,
          child: Text(
            "Send",
            style: TextStyle(color: white, fontSize: 25, fontWeight: bold),
          ),
        ),
        onTap: () {
          if (_formKey!.currentState!.validate()) {
            print("ok");
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Pay()));
          }
        },
      ),
    );
  }
}
