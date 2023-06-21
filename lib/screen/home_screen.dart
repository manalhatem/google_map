import 'package:flutter/material.dart';
import 'package:map_flutter/screen/simple_map_screen.dart';
import 'package:map_flutter/style/size.dart';
import 'current_user_location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return const SimpleMapScreen();
                }));
              },color: Colors.greenAccent,
              child: const Text("Go To Map"),),
              SizedBox(height: height(context)*0.01),
              MaterialButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return const CurrentUserLocation();
                }));
              },color: Colors.amberAccent,
                child: const Text("Current Location"),),
            ],
          ),
        ),
      ),
    );
  }
}
