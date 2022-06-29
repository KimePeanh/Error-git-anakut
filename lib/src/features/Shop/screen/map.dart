import 'dart:async';

import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopMap extends StatefulWidget {
  //const ShopMap({Key? key}) : super(key: key);

  @override
  _ShopMapState createState() => _ShopMapState();
}

class _ShopMapState extends State<ShopMap> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = [];
  void addmarker() async {
    _markers.add(Marker(
        markerId: MarkerId(""),
        position: LatLng(11.569719, 104.916796),
        infoWindow: InfoWindow(
            //title: 'The title of the marker'
            )));
  }

  @override
  void initState() {
    addmarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: mainColor),
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.5),
            offset: Offset(0,3),
          )
        ]
      ),
      child: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(11.569719, 104.916796),
          zoom: 15.0,
        ),
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
           _controller.complete(controller);
        },
      ),
    );
  }
}
