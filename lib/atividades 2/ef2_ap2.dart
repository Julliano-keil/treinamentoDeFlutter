import 'package:flutter/material.dart';

void main() {
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Atividade de atualizar formas'),
        ),
        body: Stack(
          children: [
            // começo do primeiro qudrado !!!!!
            Container(
              width: 1080,
              height: 1920,
              color: const Color.fromARGB(255, 34, 15, 87),
            ),
            Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 100,
                  height: 100,
                  color: const Color.fromARGB(137, 255, 255, 255),
                )),
            Positioned(
                top: 20,
                left: 20,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                )),
            Positioned(
                top: 30,
                left: 30,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                )),
            Positioned(
                top: 40,
                left: 40,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                )),
            // final do segundo quadrado , e Começo do segundo !!!

            Positioned(
                top: 10,
                left: 130,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                )),
            Positioned(
                top: 20,
                left: 140,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.cyan,
                )),
            Positioned(
                top: 30,
                left: 150,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.purple[900],
                )),
            Positioned(
                top: 40,
                left: 160,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.yellow,
                )),
            //final do segundo quadrado e começo dp terceiro

            Positioned(
                top: 10,
                left: 250,
                child: Container(
                  width: 100,
                  height: 100,
                  color: const Color.fromARGB(255, 34, 15, 87),
                )),
            Positioned(
                top: 20,
                left: 260,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                )),
            Positioned(
                top: 30,
                left: 270,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.yellow,
                )),
            Positioned(
                top: 40,
                left: 280,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                )),
            //final do terceiro e começo do quarto!!!!

            Positioned(
                top: 150,
                left: 10,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.white,
                )),
            Positioned(
                top: 160,
                left: 20,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                )),
            Positioned(
                top: 170,
                left: 30,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                )),
            Positioned(
                top: 180,
                left: 40,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                )),

            ////  !!!!!!!!!!!!!!!!!!!!!  /////
            /// As medidas passadas nao couberam na tela,  entao para ficar nas medidas desejadas tive que colocar um dos quadrados embaixo
          ],
        ),
      ),
    );
  }
}
