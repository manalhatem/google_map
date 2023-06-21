import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapScreen extends StatefulWidget {
  const SimpleMapScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMapScreen> createState() => _SimpleMapScreenState();

  
}

class _SimpleMapScreenState extends State<SimpleMapScreen> {
  final Completer<GoogleMapController> _controller= Completer<GoogleMapController>();
  static const egyptPosition =CameraPosition(target: LatLng(30.033333, 31.233334), zoom: 10);
  static const redSeaPosition =CameraPosition(target: LatLng(20.385824, 38.122559), zoom: 5,
      bearing: 192.8334901395799,tilt: 59.440717697143555);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(initialCameraPosition: egyptPosition,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController ctl){
          _controller.complete(ctl);
          },
        ),
          floatingActionButton: FloatingActionButton.extended(onPressed: (){
            goToRedSea();
          },
            label: const Text("To the RedSea!"),
            icon: const Icon(Icons.directions_boat),),
      ),
    );
  }
  Future<void> goToRedSea()async{
    final GoogleMapController controller =await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(redSeaPosition));

  }
}
