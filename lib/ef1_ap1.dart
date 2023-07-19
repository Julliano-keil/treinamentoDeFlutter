import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  //runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  final String nome = 'joao';
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var cor = Colors.purple;
  final random = Random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Bem vindo a  minha atividade',
            style: TextStyle(color: cor),
          ),
        ),
        body: Center(
            child: ElevatedButton(
          child: const Text('sortear cor '),
          onPressed: () {
            setState(() {
              switch (random.nextInt(7)) {
                case 1:
                  debugPrint('cor do texto é ');
                  cor = Colors.blueGrey;
                  break;
                case 2:
                  debugPrint('cor do texto é ');
                  cor = Colors.purple;
                  break;
                case 3:
                  debugPrint('cor do texto é ');
                  cor = Colors.green;
                  break;
                case 4:
                  debugPrint('cor do texto é ');
                  cor = Colors.deepOrange;
                  break;
                case 5:
                  debugPrint('cor do texto é ');
                  cor = Colors.brown;
                  break;
                case 6:
                  debugPrint('cor do texto é ');
                  cor = Colors.orange;
                  break;
                case 7:
                  debugPrint('cor do texto é ');
                  cor = Colors.yellow;
                  break;
              }
            });
          },
        )),
      ),
    );
  }
}
