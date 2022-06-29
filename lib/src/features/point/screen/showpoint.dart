import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../transfer/screen/transferScreen.dart';

class ShowPoint extends StatefulWidget {
  const ShowPoint({Key? key}) : super(key: key);

  @override
  State<ShowPoint> createState() => _ShowPointState();
}

class _ShowPointState extends State<ShowPoint> {
  List<String> title = [
    //"AHA Cambodia",
    "Galaxy Computer",
    "K Mart",
    "ABC Book",
    "Baby Mart Cambodia",
    "Lady Skin Care",
  ];
  List<String> Imagelist = [
    //"assets/images/aha.jpg",
    "assets/images/galaxy.jpg",
    "assets/images/kmart.jpg",
    "assets/images/abcbook.jpg",
    "assets/images/baby.png",
    "assets/images/ladyskincare.jpg",
  ];
  List<String> Point = ["5 pt", "7 pt", "1 pt", "3 pt", "5 pt"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: Imagelist.length,
        itemBuilder: (_, index) {
          return InkWell(
            child: Container(
              //alignment: Alignment.center,
              width: MediaQuery.of(context).size.width - 20,
              height: 100,
              child: Stack(
                children: [
                  Card(
                    semanticContainer: true,
                    //color: csblack,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: Center(
                      child: ListTile(
                        leading: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(Imagelist[index]),
                        ),
                        title: Text(title[index]),
                        //subtitle: Text(kilo[index])
                        //trailing: Icon(Icons.more_vert),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 10,
                    height: 120,
                    padding: EdgeInsets.only(bottom: 20),
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.center,
                          width: 50,
                          height: 20,
                          decoration: BoxDecoration(
                            color: mainColor,
                            //borderRadius: BorderRadius.only(topLeft: Radius.circular(10))
                          ),
                          child: Text(
                            Point[index],
                            style: TextStyle(fontFamily: 'kh', color: white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => TransferScreen(index)));
            },
          );
        });
  }
}
