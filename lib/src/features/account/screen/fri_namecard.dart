
import 'package:anakut_bank/src/features/account/screen/view_friCard.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import 'mycontact.dart';

class FriendNameCard extends StatefulWidget {
  const FriendNameCard({Key? key}) : super(key: key);

  @override
  State<FriendNameCard> createState() => _FriendNameCardState();
}

class _FriendNameCardState extends State<FriendNameCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MyContact(),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 20,
            child: Text(
              "My Friend's Card",
              style: TextStyle(
                  fontSize: 18,
                  //fontWeight: bold,
                  color: Color.fromARGB(255, 10, 82, 189)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              //margin: EdgeInsets.only(right: 5),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: BoxDecoration(color: white,
                  //borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(2, 3),
                    )
                  ]),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft, 
                    //width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.12,                  
                    decoration: BoxDecoration(
                      color: mainColor,
                        // image: DecorationImage(
                        //     image: AssetImage("assets/images/friname.jpg"))
                            ),
                            child: Image(image: AssetImage("assets/images/friname.jpg")),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "THOMAS SMITH",
                        style: TextStyle(
                            fontSize: 18, fontWeight: bold, fontFamily: 'kh'),
                      ),
                      Text(
                        "Graphic Designer",
                        style: TextStyle(fontSize: 18, fontFamily: 'kh'),
                      ),
                      Text(
                        "Tel : 0977658909",
                        style: TextStyle(fontSize: 18, fontFamily: 'kh'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyfriendCard()));
            },
          ),
          SizedBox(
            height: 10,
          ),
                    InkWell(
            child: Container(
              //margin: EdgeInsets.only(right: 5),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: BoxDecoration(color: white,
                  //borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(2, 3),
                    )
                  ]),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft, 
                    //width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.12,                  
                    decoration: BoxDecoration(
                      color: mainColor,
                        // image: DecorationImage(
                        //     image: AssetImage("assets/images/friname.jpg"))
                            ),
                            child: Image(image: AssetImage("assets/images/1115.jpg")),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "MACHAL JOHNS",
                      style: TextStyle(
                          fontSize: 18, fontWeight: bold, fontFamily: 'kh'),
                    ),
                    Text(
                      "Solution Manager",
                      style: TextStyle(fontSize: 18, fontFamily: 'kh'),
                    ),
                    Text(
                      "Tel : 0977658909",
                      style: TextStyle(fontSize: 18, fontFamily: 'kh'),
                    ),
                  ],
                )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyfriendCard()));
            },
          ),
           
        ],
      ),
    );
  }
}
