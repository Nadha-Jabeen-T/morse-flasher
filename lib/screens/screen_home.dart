import 'package:flutter/material.dart';
import 'package:morse_flasher/functions.dart';
import 'package:torch_light/torch_light.dart';
import 'package:hexcolor/hexcolor.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Morse Flasher"),
        backgroundColor: HexColor("#1E2F43"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Message"),
              maxLines: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  final message = messageController.text;
                  final encrypted = textToMorse(message.toLowerCase());
                  if (await TorchLight.isTorchAvailable()) {
                    blinkMorse(encrypted);
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            title: const Text("Error"),
                            content: const Text(
                                "Can't Access your Camera.. Please try again later.."),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                  },
                                  child: const Text("OK"))
                            ],
                          );
                        });
                  }
                },
                icon: const Icon(Icons.flashlight_on),
                label: const Text("Flash the Message"),
                style: ElevatedButton.styleFrom(
                  primary: HexColor("#D73B33"), // background
                  onPrimary: HexColor("#FFFFFF"), // foreground
                ))
          ],
        ),
      )),
    );
  }
}
