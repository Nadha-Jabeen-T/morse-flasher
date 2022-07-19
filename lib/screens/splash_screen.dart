//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:morse_flasher/screens/screen_home.dart';

void main() {
  //
  runApp(MaterialApp(
    home: splashScreen(),
  ));
}

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Morse flasher"),
        backgroundColor: HexColor("#1E2F43"),
      ),
      backgroundColor: HexColor("#ffffff"),
      body: Center(
          child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenHome()),
                );
              },
              child: Image(
                image: AssetImage('images/hat.jpg'),
                width: 300,
                height: 500,
              ))),
    );
  }
}
