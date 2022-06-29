import 'dart:async';
import 'package:anakut_bank/src/features/home/bloc/bloc/getshop_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anakut_bank/src/features/Shop/screen/product.dart';
import 'package:anakut_bank/src/features/Shop/screen/shop_profile.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

class ShopScreen extends StatelessWidget {
  final int id;
  ShopScreen({required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: mainColor,
            statusBarIconBrightness: Brightness.light),
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: mainColor),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: white,
      ),
      body: BlocProvider(
        create: (BuildContext context) =>
            GetshopBloc()..add(GetShopByIdStarted(id: id)),
        child: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> title = [
    "AHA Cambodia",
    "Galaxy Computer",
    "OpenTech",
    "Anakut Digital",
    "Mekong Film",
  ];
  double rate = 0.0;
  String Address = 'search';
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  // void addmarker() async {
  //   _markers.add(Marker(
  //       markerId: MarkerId(""),
  //       position: LatLng(11.569719, 104.916796),
  //       infoWindow: InfoWindow(
  //           //title: 'The title of the marker'
  //           )));
  // }
  void _onmapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(""),
          position: LatLng(11.5768718, 104.9038566),
          infoWindow: InfoWindow(
              //title: title[],
              //snippet:
              )));
    });
  }

  launchMap(double lat, double lng) async {
    String apiKey = "AIzaSyDrnaYC96LYhj4hEiJq6jgUJ2xZQWtz4o4";
    double deslat = 11.5768718;
    double deslng = 104.9038566;
    String url =
        "https://www.google.com/maps/dir/11.5768718,104.9038566/Jok+Dimitrov+Blvd,+Phnom+Penh/@11.5769127,104.9029839,15z/data=!4m10!4m9!1m1!4e1!1m5!1m1!1s0x3109516a11c95f61:0x3114029239f82358!2m2!1d104.9149411!2d11.5704063!3e0";
    //var mapSchema = 'geo:$lat,$long';
    await launch(url);
    print("Hiiiiiiii");
  }

  Future<void> GetAddressFromLatLong() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(11.5768718, 104.9038566);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    print(Address);
  }

  @override
  void initState() {
    GetAddressFromLatLong();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: BlocBuilder<GetshopBloc, GetshopState>(
      //   builder: (context, state) {
      //     if (state is GettingShop) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (state is ErrorGettingShop) {
      //       return Center(
      //         child: Text(state.error.toString()),
      //       );
      //     }
      //     String lat =
      //         BlocProvider.of<GetshopBloc>(context).shopModel!.lat as String;
      //     //assert(lat is double);
      //     String lng =
      //         BlocProvider.of<GetshopBloc>(context).shopModel!.lng as String;
      //     //assert(lng is double);
      //     print(BlocProvider.of<GetshopBloc>(context).shopModel!.lat);
      //     // return SingleChildScrollView(
      //     //   child: Center(
      //     //     child: Column(
      //     //       children: <Widget>[
      //     //         SafeArea(
      //     //             child: ShopProfile(
      //     //           shopModel: BlocProvider.of<GetshopBloc>(context).shopModel!,
      //     //         )),
      //     //         Card(
      //     //           child: Container(
      //     //             padding: EdgeInsets.all(2),
      //     //             width: MediaQuery.of(context).size.width - 10,
      //     //             height: 180,
      //     //             decoration: BoxDecoration(
      //     //               borderRadius: BorderRadius.circular(10),
      //     //             ),
      //     //             child: GoogleMap(
      //     //               myLocationEnabled: true,
      //     //               myLocationButtonEnabled: true,
      //     //               initialCameraPosition: CameraPosition(
      //     //                 target: LatLng(double.parse(lat), double.parse(lng)),
      //     //                 zoom: 15.0,
      //     //               ),
      //     //               markers: Set<Marker>.of(_markers),
      //     //               onMapCreated: (GoogleMapController controller) {
      //     //                 setState(() {
      //     //                   _markers.add(Marker(
      //     //                       markerId: MarkerId(""),
      //     //                       position:
      //     //                           LatLng(double.parse(lat), double.parse(lng)),
      //     //                       infoWindow: InfoWindow(
      //     //                           //title: title[],
      //     //                           //snippet:
      //     //                           )));
      //     //                 });
      //     //               },
      //     //             ),
      //     //           ),
      //     //         ),
      //     //         SizedBox(
      //     //           height: 5,
      //     //         ),
      //     //         Container(
      //     //           width: MediaQuery.of(context).size.width - 20,
      //     //           //height: 135,
      //     //           margin: EdgeInsets.only(top: 10),
      //     //           decoration: BoxDecoration(
      //     //             color: white,
      //     //             border: Border.all(color: mainColor),
      //     //             borderRadius: BorderRadius.circular(10),
      //     //           ),
      //     //           child: Column(
      //     //             children: [
      //     //               Container(
      //     //                 margin: EdgeInsets.only(top: 5),
      //     //                 width: MediaQuery.of(context).size.width - 30,
      //     //                 child: Text(
      //     //                   "Shop Info",
      //     //                   style: TextStyle(
      //     //                       fontFamily: 'kh', fontSize: 15, fontWeight: bold),
      //     //                 ),
      //     //               ),
      //     //               Container(
      //     //                   width: MediaQuery.of(context).size.width - 50,
      //     //                   child: Row(
      //     //                     mainAxisAlignment: MainAxisAlignment.start,
      //     //                     children: [
      //     //                       Container(
      //     //                         //alignment: Alignment.topLeft,
      //     //                         width: 90,
      //     //                         child: Text(
      //     //                           "Location",
      //     //                           style: TextStyle(fontFamily: 'kh'),
      //     //                         ),
      //     //                       ),
      //     //                       Container(
      //     //                         width: MediaQuery.of(context).size.width - 140,
      //     //                         child: Text(
      //     //                           ": " + Address,
      //     //                           style:
      //     //                               TextStyle(fontFamily: 'kh', fontSize: 13),
      //     //                         ),
      //     //                       ),
      //     //                     ],
      //     //                   )),
      //     //               Container(
      //     //                   width: MediaQuery.of(context).size.width - 50,
      //     //                   child: Row(
      //     //                     mainAxisAlignment: MainAxisAlignment.start,
      //     //                     children: [
      //     //                       Container(
      //     //                         width: 90,
      //     //                         child: Text(
      //     //                           "Tel",
      //     //                           style: TextStyle(fontFamily: 'kh'),
      //     //                         ),
      //     //                       ),
      //     //                       Container(
      //     //                         width: MediaQuery.of(context).size.width - 140,
      //     //                         child: Text(
      //     //                           ": 01060168",
      //     //                           style:
      //     //                               TextStyle(fontFamily: 'kh', fontSize: 13),
      //     //                         ),
      //     //                       ),
      //     //                     ],
      //     //                   )),
      //     //               Container(
      //     //                   width: MediaQuery.of(context).size.width - 50,
      //     //                   child: Row(
      //     //                     mainAxisAlignment: MainAxisAlignment.start,
      //     //                     children: [
      //     //                       Container(
      //     //                         width: 90,
      //     //                         child: Text(
      //     //                           "Open",
      //     //                           style: TextStyle(fontFamily: 'kh'),
      //     //                         ),
      //     //                       ),
      //     //                       Container(
      //     //                         width: MediaQuery.of(context).size.width - 140,
      //     //                         child: Text(
      //     //                           "7:00AM-9:00PM",
      //     //                           style:
      //     //                               TextStyle(fontFamily: 'kh', fontSize: 13),
      //     //                         ),
      //     //                       ),
      //     //                     ],
      //     //                   )),
      //     //             ],
      //     //           ),
      //     //         ),
      //     //         SizedBox(
      //     //           height: 15,
      //     //         ),
      //     //         Container(
      //     //           width: MediaQuery.of(context).size.width - 40,
      //     //           alignment: Alignment.centerLeft,
      //     //           child: Text('Product',
      //     //               style: TextStyle(
      //     //                   fontFamily: 'kh',
      //     //                   fontSize: 15,
      //     //                   color: Colors.black,
      //     //                   fontWeight: bold)),
      //     //         ),
      //     //         SizedBox(
      //     //           height: 10,
      //     //         ),
      //     //         Product(),
      //     //       ],
      //     //     ),
      //     //   ),
      //     // );
      //     return Column(
      //       children: <Widget>[
      //         SingleChildScrollView(
      //           physics: NeverScrollableScrollPhysics(),
      //           child: Column(
      //             children: [
      //               SafeArea(
      //                   child: ShopProfile(
      //                 shopModel:
      //                     BlocProvider.of<GetshopBloc>(context).shopModel!,
      //               )),
      //               SizedBox(
      //                 height: 5,
      //               ),
      //               Container(
      //                 width: MediaQuery.of(context).size.width - 10,
      //                 child: Text(
      //                   'Contact',
      //                   style: TextStyle(
      //                       fontSize: 17,
      //                       color: Colors.blue.shade700,
      //                       fontWeight: bold),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 5,
      //               ),
      //               Container(
      //                 height: 50,
      //                 // color: white,
      //                 width: MediaQuery.of(context).size.width - 30,
      //                 child: Row(
      //                   children: [
      //                     Container(
      //                       width: 40,
      //                       height: 40,
      //                       decoration: BoxDecoration(
      //                         borderRadius: BorderRadius.circular(5),
      //                         color: Colors.green,
      //                       ),
      //                       child: Icon(
      //                         Icons.call,
      //                         color: Colors.white,
      //                         size: 30,
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 10,
      //                     ),
      //                     Container(
      //                       width: 40,
      //                       height: 40,
      //                       decoration: BoxDecoration(
      //                         borderRadius: BorderRadius.circular(5),
      //                         color: Color(0xff3B5998),
      //                       ),
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           Image(
      //                             width: 25,
      //                             height: 25,
      //                             image: AssetImage(
      //                                 "assets/images/facebook-app-symbol.png"),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 10,
      //                     ),
      //                     Container(
      //                         width: 40,
      //                         height: 40,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(5),
      //                           color: Color(0xff55ACEE),
      //                         ),
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             Image(
      //                               width: 25,
      //                               height: 25,
      //                               image: AssetImage(
      //                                   "assets/images/telegram.png"),
      //                             ),
      //                           ],
      //                         )),
      //                     SizedBox(
      //                       width: 10,
      //                     ),
      //                     Container(
      //                       width: 40,
      //                       height: 40,
      //                       decoration: BoxDecoration(
      //                         borderRadius: BorderRadius.circular(5),
      //                         color: Color(0xffC32AA3),
      //                       ),
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           Image(
      //                             width: 25,
      //                             height: 25,
      //                             image: AssetImage(
      //                                 "assets/images/instagram (2).png"),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         Expanded(
      //             child: SingleChildScrollView(
      //           child: Column(
      //             children: <Widget>[
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               InkWell(
      //                 child: Container(
      //                   padding: EdgeInsets.all(5),
      //                   width: MediaQuery.of(context).size.width - 10,
      //                   height: MediaQuery.of(context).size.height *0.2,
      //                   decoration: BoxDecoration(
      //                       color: white,
      //                       border: Border.all(color: mainColor),
      //                       borderRadius: BorderRadius.circular(15),
      //                       boxShadow: [
      //                         BoxShadow(
      //                           color: Colors.grey.withOpacity(0.2),
      //                           offset: Offset(2, 4),
      //                           blurRadius: 15,
      //                         )
      //                       ]),
      //                   child: GoogleMap(
      //                     myLocationEnabled: true,
      //                     myLocationButtonEnabled: true,
      //                     initialCameraPosition: CameraPosition(
      //                       target:
      //                           LatLng(double.parse(lat), double.parse(lng)),
      //                       zoom: 15.0,
      //                     ),
      //                     markers: Set<Marker>.of(_markers),
      //                     onMapCreated: (GoogleMapController controller) {
      //                       setState(() {
      //                         _markers.add(Marker(
      //                             markerId: MarkerId(""),
      //                             position: LatLng(
      //                                 double.parse(lat), double.parse(lng)),
      //                             infoWindow: InfoWindow(
      //                                 //title: title[],
      //                                 //snippet:
      //                                 )));
      //                       });
      //                     },
      //                     onTap: (LatLng latLng) {
      //                       String lat = BlocProvider.of<GetshopBloc>(context)
      //                           .shopModel!
      //                           .lat as String;
      //                       //assert(lat is double);
      //                       String lng = BlocProvider.of<GetshopBloc>(context)
      //                           .shopModel!
      //                           .lng as String;
      //                       print("clickkkkkkkkkkkk");
      //                       MapsLauncher.launchCoordinates(
      //                           double.parse(lat), double.parse(lng));
      //                     },
      //                   ),
      //                 ),
      //                 onTap: () {
      //                   String lat = BlocProvider.of<GetshopBloc>(context)
      //                       .shopModel!
      //                       .lat as String;
      //                   //assert(lat is double);
      //                   String lng = BlocProvider.of<GetshopBloc>(context)
      //                       .shopModel!
      //                       .lng as String;
      //                   print("clickkkkkkkkkkkk");
      //                   MapsLauncher.launchCoordinates(
      //                       double.parse(lat), double.parse(lng));
      //                 },
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               Container(
      //                 width: MediaQuery.of(context).size.width - 10,
      //                 child: Text(
      //                   'Rate & Review',
      //                   style: TextStyle(
      //                       fontSize: 17,
      //                       color: Colors.pink.shade500,
      //                       fontWeight: bold),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               Container(
      //                 padding: EdgeInsets.all(8),
      //                 alignment: Alignment.center,
      //                 width: MediaQuery.of(context).size.width - 10,
      //                // height: MediaQuery.of(context).size.height*0.15,
      //                 decoration: BoxDecoration(
      //                     color: white,
      //                     borderRadius: BorderRadius.circular(10),
      //                     border: Border.all(color: mainColor)),
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Text(
      //                       "Rate this place.",
      //                       style: TextStyle(fontSize: 17),
      //                     ),
      //                     SizedBox(
      //                       height: 10,
      //                     ),
      //                     RatingBar.builder(
      //                       initialRating: rate,
      //                       minRating: 0,
      //                       direction: Axis.horizontal,
      //                       allowHalfRating: true,
      //                       itemCount: 5,
      //                       itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      //                       itemBuilder: (context, _) => Icon(
      //                         Icons.star,
      //                         color: Colors.amber,
      //                       ),
      //                       onRatingUpdate: (rating) {
      //                         setState(() {
      //                           rate = rating;
      //                         });
      //                         showAlertDialog(context);
      //                       },
      //                     ),
      //                     SizedBox(
      //                       height: 15,
      //                     ),
      //                     InkWell(
      //                       child: Container(
      //                         alignment: Alignment.center,
      //                         width: MediaQuery.of(context).size.width * 0.5,
      //                         height: 45,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(10),
      //                           color: mainColor,
      //                         ),
      //                         child: Text(
      //                           "Write a Review",
      //                           style: TextStyle(color: white, fontSize: 17),
      //                         ),
      //                       ),
      //                       onTap: () {
      //                         showAlertDialog(context);
      //                       },
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               Container(
      //                 width: MediaQuery.of(context).size.width - 10,
      //                 child: Text(
      //                   "What's we offer",
      //                   style: TextStyle(
      //                       fontSize: 17,
      //                       // color: Colors.green.shade600,
      //                       fontWeight: bold),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               Product(),
      //               SizedBox(
      //                 height: 50,
      //               ),
      //             ],
      //           ),
      //         ))
      //       ],
      //     );
      //   },
      // ),
      // floatingActionButton: Container(
      //     margin: EdgeInsets.only(left: 30),
      //     width: MediaQuery.of(context).size.width,
      //     height: 45,
      //     //color: csblack,
      //     child: Center(
      //       child: InkWell(
      //         child: Container(
      //           alignment: Alignment.center,
      //           width: MediaQuery.of(context).size.width - 150,
      //           height: 50,
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(10), color: mainColor),
      //           child: Text(
      //             "Direction",
      //             style: TextStyle(color: white, fontSize: 20, fontWeight: bold),
      //           ),
      //         ),
      //         onTap: () {
      //           String lat =
      //         BlocProvider.of<GetshopBloc>(context).shopModel!.lat as String;
      //     //assert(lat is double);
      //     String lng =
      //         BlocProvider.of<GetshopBloc>(context).shopModel!.lng as String;
      //           print("clickkkkkkkkkkkk");
      //           MapsLauncher.launchCoordinates(double.parse(lat), double.parse(lng));
      //         },
      //       ),
      //     ),
      //   ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Submit"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Rate and Review"),
      content: Container(
        height: 100,
        child: Column(
          children: [
            RatingBar.builder(
              initialRating: rate,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
                setState(() {
                  rate = rating;
                });
              },
            ),
            Container(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(hintText: "Write a Review"),
              ),
            )
          ],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
