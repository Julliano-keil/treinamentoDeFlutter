import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(' Cores e Formas'),
        ),
        body: Stack(children: [
          Container(
              width: 1080,
              height: 1920,
              color: const Color.fromARGB(255, 8, 26, 58)),
          Positioned(
              top: 50,
              left: 40,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              )),
          Positioned(
              top: 50,
              left: 175,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              )),
          Positioned(
              top: 50,
              left: 300,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              )),
          // bloco amarelo do meio
          Positioned(
              top: 150,
              left: 25,
              child: Container(
                width: 365,
                height: 350,
                color: Colors.yellow,
              )),
          Positioned(
              top: 200,
              left: 45,
              child: Container(
                width: 75,
                height: 250,
                color: Colors.purple[600],
              )),
          Positioned(
              top: 200,
              left: 150,
              child: Container(
                width: 75,
                height: 250,
                color: Colors.cyan,
              )),
          Positioned(
              top: 200,
              left: 275,
              child: Container(
                width: 75,
                height: 75,
                color: Colors.purple,
              )),
          Positioned(
              top: 350,
              left: 275,
              child: Container(
                width: 75,
                height: 75,
                color: Colors.cyan,
              )),
          Positioned(
              top: 600,
              left: 130,
              child: Container(
                width: 170,
                height: 125,
                color: const Color.fromARGB(115, 187, 183, 183),
              )),
          Positioned(
              top: 612,
              left: 163,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.black,
              )),
        ]),
      ),
    );
  }
}
