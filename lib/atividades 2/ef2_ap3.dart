import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final random = Random();

  var quadrado = true;

  var cor = Colors.purple;

  String get palavra =>
      quadrado ? 'mudar para circulo ' : 'mudar para quadrado';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Escolha a forma geometrica que deseja \n e a cor'),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Text(palavra),
                    onPressed: () {
                      setState(() {
                        quadrado = !quadrado;
                      });
                    },
                  ),
                  ElevatedButton(
                    child: const Text('cor aleatoria'),
                    onPressed: () {
                      setState(() {
                        switch (random.nextInt(5)) {
                          case 0:
                            cor = Colors.red;
                            break;
                          case 1:
                            cor = Colors.purple;
                            break;
                          case 2:
                            cor = Colors.pink;
                            break;
                          case 3:
                            cor = Colors.lightBlue;
                            break;
                          case 4:
                            cor = Colors.red;
                            break;
                        }
                      });
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: quadrado ? BoxShape.rectangle : BoxShape.circle,
                        color: cor,
                      ),
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
