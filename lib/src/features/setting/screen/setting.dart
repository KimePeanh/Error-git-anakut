import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

Widget menuu(BuildContext context, String title){
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: 20),
    width: MediaQuery.of(context).size.width *0.95,
    height: MediaQuery.of(context).size.height *0.06,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          offset: Offset(4,4),
          blurRadius: 10,

        )
      ]
    ),
    child: Text(title,style: TextStyle(fontFamily: 'kh'),textScaleFactor: 1.1,),
  );
}
