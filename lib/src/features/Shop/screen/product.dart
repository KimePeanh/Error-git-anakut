import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    List<String> Imagelist = [
      "assets/images/pc1.jpg",
      "assets/images/pc2.jpg",
      "assets/images/pc3.jpg",
      "assets/images/pc4.jpg",
    ];
    List<String> Price = [
      "125 USD",
      "285 USD",
      "115 USD",
      "15 USD",
    ];
    // return Container(
    //   height: 175,
    //   child: ListView.builder(
    //       scrollDirection: Axis.horizontal,
    //       shrinkWrap: true,
    //       itemCount: Imagelist.length,
    //       itemBuilder: (_, index) {
    //         return Container(
    //           margin: EdgeInsets.only(right: 10),
    //           decoration: BoxDecoration(
    //             //color: mainColor,
    //             color: white,
    //             borderRadius: BorderRadius.circular(10),
    //             boxShadow: [
    //               BoxShadow(
    //                 color: grey,
    //                 offset: Offset(0,2),
    //               )
    //             ]
    //           ),
    //           child: Center(
    //             child: Column(
    //               children: <Widget>[
    //                Container(
    //                  width: 200,

    //                ),
    //                 Text(Price[index],style: TextStyle(fontFamily: 'kh', color: Colors.red.shade800, fontWeight: bold),),
    //               ],
    //             ),
    //           ),
    //         );
    //       }),
    // );
    return Container(
      height: 170,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: Imagelist.length,
          itemBuilder: (_, index) {
            return Stack(
              children: [
               Container(
                width: 200,
                height: 170,
                child: Card(
                  semanticContainer: true,
                  //color: csblack,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container
                        (
                          // child: Image(
                          //   width: 200,
                          //   height: 130,
                          //   fit: BoxFit.cover,
                          //   image: AssetImage(Imagelist[index]),
                          // ),
                        ),
                        Container(
                          width: 200,
                          child: Text(Price[index],style: TextStyle(fontFamily: 'kh', color: Colors.red.shade800, fontWeight: bold),)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 170,
                alignment: Alignment.centerLeft,
                child: Column(children: [
                  Container(
                    width: 70,
                    height: 20,
                    color: mainColor,
                    child: Text("20% OFF", style: TextStyle(fontFamily: 'kh', color: white),),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: 50,
                    height: 20,
                    margin: EdgeInsets.only(right: 10),
                    color: mainColor,
                    child: Text("20 pt", style: TextStyle(fontFamily: 'kh', color: white),),
                  ),
                ]),
              ),
              ],
            );
          }),
    );
  }
}
