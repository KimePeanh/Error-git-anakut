import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget setting(BuildContext context, String image, String title, Color color) {
  return Container(
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(4),
           width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                color: color,
                offset: Offset(0.5,0.5),
                blurRadius: 5,
                
              )
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 30,
                  height: 30,
                  image: AssetImage(image),),
              ],
            ),
            ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Container(
          child: Text(
            "Help Center",
            style: TextStyle(fontFamily: 'kh', fontSize: 17),
          ),
        )),
        Container(
          width: 35,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey.shade300,
            size: 20,
          ),
        ),
      ],
    ),
  );
}
