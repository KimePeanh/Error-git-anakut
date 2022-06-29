import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  List<String> MarketplaceImage = [
    "assets/images/aha.jpg",
    "assets/images/mall.jpg",
    "assets/images/phsarworld.jpg",
    "assets/images/fardin.jpg",
  ];
  List<String> MakrtplaceTittle = [
    "AHA",
    "Phsarmall",
    "Phsarworld",
    "Fardin",
  ];
  List<String> Link = [
    "https://play.google.com/store/apps/details?id=com.ahacambodia.anakutdigital",
    "https://play.google.com/store/apps/details?id=com.phsarmall.anakutdigital",
    "https://play.google.com/store/apps/details?id=com.phsarworld.anakutdigital",
    "https://play.google.com/store/apps/details?id=com.fardinexpress.anakutdigital"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Color(0xffFEF2D5),
      //color: mainColor,
      child: Card(
        semanticContainer: true,
        //color: csblack,
        color: white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: MarketplaceImage.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 4 - 1,
                      //color: Color(0xffFEF2D5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              width: 40,
                              height: 40,
                              image: AssetImage(MarketplaceImage[index])),
                          Text(
                            MakrtplaceTittle[index],
                            style: TextStyle(fontFamily: 'kh'),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 60,
                      color: Colors.grey.shade200,
                    )
                  ],
                ),
                onTap: () {
                  print("Hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
                  launch(Link[index]);
                },
              );
            }),
      ),
    );
  }
}
