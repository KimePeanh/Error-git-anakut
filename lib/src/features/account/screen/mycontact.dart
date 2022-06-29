import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyContact extends StatefulWidget {
  const MyContact({Key? key}) : super(key: key);

  @override
  State<MyContact> createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Expanded(
          //   child: Container(
          //     width: 40,
          //     height: 40,
          //     decoration:
          //         BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          //     child: Icon(
          //       Icons.call,
          //       color: Colors.white,
          //       size: 30,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: InkWell(
          //     child: Container(
          //         width: 40,
          //         height: 40,
          //         decoration: BoxDecoration(
          //             shape: BoxShape.circle, color: grey.withOpacity(0.2)),
          //         child: Image(
          //           image: AssetImage("assets/images/Telegram.svg"),
          //         )),
          //        onTap: (){
          //           launch("https://t.me/kime168");
          //        },
          //   ),
          // ),
          // Expanded(
          //   child: InkWell(
          //     child: Container(
          //         width: 40,
          //         height: 40,
          //         decoration: BoxDecoration(
          //             shape: BoxShape.circle, color: grey.withOpacity(0.2)),
          //         child: Image(
          //           image: AssetImage("assets/images/fb.jpg"),
          //         )),
          //     onTap: () {
          //       launch("https://www.facebook.com/chhingyi.chhingyi/");
          //     },
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //       width: 40,
          //       height: 40,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle, color: grey.withOpacity(0.2)),
          //       child: Image(
          //         image: AssetImage("assets/images/instagram.png"),
          //       )),
          // ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.green,
            ),
            child: Icon(
              Icons.call,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xff0077B5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image( 
                  width: 25,
                  height: 25,
                  image: AssetImage("assets/images/linkedin.png"),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xff3B5998),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 25,
                  height: 25,
                  image: AssetImage("assets/images/facebook-app-symbol.png"),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xff55ACEE),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 25,
                    height: 25,
                    image: AssetImage("assets/images/telegram.png"),
                  ),
                ],
              )),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xffC32AA3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 25,
                  height: 25,
                  image: AssetImage("assets/images/instagram (2).png"),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xffBB0000),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image( 
                  width: 25,
                  height: 25,
                  image: AssetImage("assets/images/youtube (1).png"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
