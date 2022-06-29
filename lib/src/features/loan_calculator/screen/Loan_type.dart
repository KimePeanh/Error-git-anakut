import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class LoanType extends StatefulWidget {
  const LoanType({Key? key}) : super(key: key);

  @override
  State<LoanType> createState() => _LoanTypeState();
}

class _LoanTypeState extends State<LoanType> {
  Color EqtColorSe = white;
  Color TextEq = Color(0xff7F0194);
  Color TextMu = Color(0xff7F0194);
  Color MutColorSe = white;
  String btn = "";

  void changeText() {
    if (btn == "Eq") {
      setState(() {
        EqtColorSe = Colors.yellow.shade700;
        MutColorSe = white;
        TextEq = white;
        TextMu = Color(0xff7F0194);
      });
    } else if (btn == "Mu") {
      MutColorSe = Colors.yellow.shade700;
      EqtColorSe = white;
      TextMu = white;
      TextEq = Color(0xff7F0194);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              "Loan Type",
              style: TextStyle(fontFamily: 'kh', fontWeight: bold),
              textScaleFactor: 1,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: <Widget>[
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    decoration: BoxDecoration(
                        color: EqtColorSe,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: grey.withOpacity(0.3),
                            offset: Offset(4, 4),
                            blurRadius: 15,
                          ),
                          BoxShadow(
                            color: white,
                            offset: -Offset(4, 4),
                            blurRadius: 15,
                          ),
                        ]),
                    child: Text(
                      "Principle Equal Repayment",
                      style: TextStyle(
                          fontFamily: 'kh', fontWeight: bold, color: TextEq),
                      textScaleFactor: 1.05,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      btn = "Eq";
                      print(btn);
                      changeText();
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    decoration: BoxDecoration(
                        color: MutColorSe,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: grey.withOpacity(0.3),
                            offset: Offset(4, 4),
                            blurRadius: 15,
                          ),
                          BoxShadow(
                            color: white,
                            offset: -Offset(4, 4),
                            blurRadius: 15,
                          ),
                        ]),
                    child: Text(
                      "Principle Maturity Repayment",
                      style: TextStyle(
                          fontFamily: 'kh', fontWeight: bold, color: TextMu),
                      textScaleFactor: 1.05,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      btn = "Mu";
                      changeText();
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
