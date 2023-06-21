import 'package:flutter/material.dart';
import 'package:map_flutter/screen/simple_map_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: MaterialButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_){
              return const SimpleMapScreen();
            }));
          },color: Colors.greenAccent,
          child: const Text("Go To Map"),),
        ),
      ),
    );
  }
}
