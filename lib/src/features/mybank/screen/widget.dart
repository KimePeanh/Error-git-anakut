import 'package:flutter/material.dart';

import '../../../utils/constants/app_constants.dart';

Widget Menuu(BuildContext context, String url, String title, Color col) {
  return Container(
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height * 0.11,
    decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200, offset: Offset(2, 2), blurRadius: 1)
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.055,
            width: MediaQuery.of(context).size.height * 0.055,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: col, boxShadow: [
              BoxShadow(
                color: col,
                offset: Offset(0.5, 0.5),
                blurRadius: 5,
              )
            ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: MediaQuery.of(context).size.height * 0.038,
                    image: AssetImage(url)),
              ],
            )),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: TextStyle(fontFamily: 'kh'),
          textScaleFactor: 1,
        ),
      ],
    ),
  );
}
