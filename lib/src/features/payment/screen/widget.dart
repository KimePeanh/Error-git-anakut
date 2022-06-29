import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';


// class CateWidget extends StatefulWidget {
//   const CateWidget({ Key? key }) : super(key: key);

//   @override
//   State<CateWidget> createState() => _CateWidgetState();
// }

// class _CateWidgetState extends State<CateWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       height: MediaQuery.of(context).size.height * 0.1,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: white,
//       ),
//       child: Column(
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.height * 0.08,
//             height: MediaQuery.of(context).size.height * 0.08,
//             child: Image(image: )
//           ),
//         ],
//       ),

//     );
//   }
// }

Widget cate(BuildContext context, String url, String title,Color col) {
  return Container(
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height * 0.11,
    decoration: BoxDecoration(
        color: white,
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
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.055,
          width: MediaQuery.of(context).size.height * 0.055,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: col,
            boxShadow: [
              BoxShadow(
                color: col,
                offset: Offset(0.5,0.5),
                blurRadius: 5,
                
              )
            ]
          ),
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
          style: TextStyle(),
          textScaleFactor: 1,
        ),
      ],
    ),
  );
}
