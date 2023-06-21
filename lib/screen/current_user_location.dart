import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class CurrentUserLocation extends StatefulWidget {
  const CurrentUserLocation({Key? key}) : super(key: key);

  @override
  State<CurrentUserLocation> createState() => _CurrentUserLocationState();
}

class _CurrentUserLocationState extends State<CurrentUserLocation> {

  late GoogleMapController googleMapController;
  static const CameraPosition cairoPosition =CameraPosition(target: LatLng(30.033333, 31.233334), zoom: 12);
  Set<Marker> markers={};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your location"),
        centerTitle: true,
      ),
      body: GoogleMap(initialCameraPosition: cairoPosition,
      markers: markers,mapType: MapType.normal,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller){ googleMapController=controller;},),

      floatingActionButton: FloatingActionButton.extended(onPressed: ()async{

        Position position =await determinePosition();
        googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude,position.longitude),zoom: 10)));
        markers.clear();
        markers.add(Marker(markerId: const MarkerId("Current Location"), position: LatLng(position.latitude, position.longitude)));

        setState(() {});

        },
        label: const Text(" Get Current location "),
        icon: const Icon(Icons.directions_boat),),
    );
  }


  /// Determine Current Location
  Future<Position> determinePosition() async{
    bool serviceEnable;
    LocationPermission permission;

    serviceEnable=await Geolocator.isLocationServiceEnabled();

    if(!serviceEnable){
      return Future.error("Location Service is Disabled");
    }

    permission =await Geolocator.checkPermission();

    if(permission== LocationPermission.denied){
      permission =await Geolocator.requestPermission();
      if(permission==LocationPermission.denied){
        return Future.error("Location Permission Denied");
      }
    }
    if(permission==LocationPermission.deniedForever){
      return Future.error("Location Permission denied forever ");
    }

    Position position= await Geolocator.getCurrentPosition();
    return position;
  }
}
