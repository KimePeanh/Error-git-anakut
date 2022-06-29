import 'package:anakut_bank/src/features/home/bloc/bloc/getshop_bloc.dart';
import 'package:anakut_bank/src/features/home/model/shop_model.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class ShopProfile extends StatelessWidget {
//   final int id;
//   const ShopProfile({required this.id});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (BuildContext context) =>
//             GetshopBloc()..add(GetShopByIdStarted(id: id)),
//         child: Body(),
//       ),
//     );
//   }
// }

class ShopProfile extends StatefulWidget {
  final ShopModel shopModel;
  const ShopProfile({required this.shopModel});
  // int index;
  // ShopProfile(this.index);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<ShopProfile> {
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
  List<String> banner = [
    "assets/images/galaxy_banner.jpg",
    "assets/images/kmart_banner.jpg",
    "assets/images/abc_banner.jpg",
    "assets/images/babybanner.jpg",
    "assets/images/lady_banner.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    print(widget.shopModel.cover_url);
    // BlocProvider.of<GetshopBloc>(context)
    //     .add(GetShopByIdStarted(id: widget.index));
    // print(widget.index);
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height:  140,
          child: widget.shopModel.cover_url == "none.jpg"
              ? Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/cv_shop.jpg"),
                )
              : Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.shopModel.cover_url!),
                ),
        ),
        Container( 
          width: MediaQuery.of(context).size.width,
          height:  140,
          color: Colors.black.withOpacity(0.5),
        ),
        Container(
          // width: MediaQuery.of(context).size.width,
          // height: 130,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                    child: InkWell(
                        child: Icon(Icons.arrow_back, color: white, size: 30),
                        onTap: () {
                          Navigator.pop(context);
                        }),
                  ),
                  Row(
                    children: [
                      Container(
                          width: 60,
                          height: 60,
                          child: widget.shopModel.image_url == null
                              ? CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/logobank.png"),
                                )
                              : CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(widget.shopModel.image_url!),
                                )),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width - 150,
                        //color: mainColor,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width - 70,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.shopModel.name!,
                                  style: TextStyle(
                                      fontFamily: 'kh',
                                      fontWeight: bold,
                                      fontSize: 19,
                                      color: white),
                                )),
                            Container(
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width - 70,
                                child: Text(
                                  "7:00AM-9:00PM",
                                  style: TextStyle(color: white),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
