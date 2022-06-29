import 'package:anakut_bank/src/features/Loan/loan_sc.dart';
import 'package:anakut_bank/src/features/Loan/new_loan.dart';
import 'package:anakut_bank/src/features/apply_loan/screen/apply_loan.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'loan_item.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  List<String> Listname = ["Peanh Kime", "Chea Kaknika", "Sous SreyLen"];
  List<String> amount = ["300 USD", "1000 USD", "500 USD"];
  List<String> date = ["05-04-2022", "14-01-2022", "13-12-2021"];
  List<String> time = ["6:24 PM", "4:50 PM", "9:12 AM"];
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
        title: Text("Loan Managment", style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: Listname.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(5, 5),
                              ),
                              BoxShadow(
                                blurRadius: 10,
                                color: white,
                                offset: -Offset(5, 5),
                              )
                            ]),
                        // child: ListTile(
                        //   leading: CircleAvatar(
                        //     backgroundColor: mainColor,
                        //       child: Image(
                        //     width: MediaQuery.of(context).size.width * 0.2,
                        //     height: MediaQuery.of(context).size.width * 0.2,
                        //     image: NetworkImage(
                        //         "https://firebasestorage.googleapis.com/v0/b/newonecam-53e7c.appspot.com/o/BaBVkDKxN6OPHxgMU3baLsniD7W2?alt=media&token=03fd3147-e871-4914-af8f-2c18b12516ee"),
                        //   )),
                        // ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.width * 0.2,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://firebasestorage.googleapis.com/v0/b/newonecam-53e7c.appspot.com/o/BaBVkDKxN6OPHxgMU3baLsniD7W2?alt=media&token=03fd3147-e871-4914-af8f-2c18b12516ee'))),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 6, right: 6),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Since ${date[index].toString()}, ${Listname[index].toString()} has loaned ${amount[index].toString()}.",
                                        style: TextStyle(),
                                        textScaleFactor: 1.2,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${time[index]}",
                                          style: TextStyle(
                                              color: mainColor,
                                              fontWeight: FontWeight.bold),
                                          textScaleFactor: 1.2,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Icon(
                              Icons.more_vert,
                              color: grey,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NewLoan()));
                      },
                    );
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        child: Container(
          margin: EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width * 0.16,
          height: MediaQuery.of(context).size.width * 0.16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: Icon(
            Icons.add,
            color: white,
            size: 30,
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoanItemCreate()));
        },
      ),
    );
  }
}
