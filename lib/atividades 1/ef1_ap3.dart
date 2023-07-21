import 'dart:math';

import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 16, 117, 224);

void main() {
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String palavra = '';
  var acertos = Random().nextInt(4);
  var tentativas = 0;
  var chances = 2;
  int vitoria = 0;
  var derrotas = 0;
  var corfundo = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: corfundo),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            palavra,
            style: TextStyle(color: corfundo),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('qual o botao correto N°1 ?'),
                onPressed: () {
                  setState(() {
                    if (acertos == 0 && tentativas != 2 && chances > 0) {
                      palavra = 'parabens voce acertou ';
                      corfundo = Colors.green;
                      ThemeData.dark()
                          .copyWith(scaffoldBackgroundColor: corfundo);
                      if (tentativas < 2) {
                        vitoria++;
                      }
                    } else {
                      palavra = 'voce errou sinto muito';
                      corfundo = Colors.red;
                      ThemeData().copyWith(scaffoldBackgroundColor: corfundo);
                      tentativas++;
                      if (tentativas < 2) {
                        derrotas++;
                      }
                      // verifica se as chances
                      if (chances > 0) {
                        chances--;
                      } else {
                        palavra = 'voce nao tem mais chances';
                      }
                    }
                  });
                },
              ),
              ElevatedButton(
                child: const Text('qual o botao correto N°2 ?'),
                onPressed: () {
                  setState(() {
                    if (acertos == 1 && tentativas != 2 && chances > 0) {
                      palavra = 'parabens voce acertou ';
                      corfundo = Colors.green;
                      ThemeData.dark()
                          .copyWith(scaffoldBackgroundColor: corfundo);
                      if (tentativas < 2) {
                        vitoria++;
                      }
                    } else {
                      palavra = 'voce errou sinto muito';
                      corfundo = Colors.red;
                      ThemeData.dark()
                          .copyWith(scaffoldBackgroundColor: corfundo);
                      tentativas++;
                      if (tentativas < 2) {
                        derrotas++;
                      }
                      if (chances > 0) {
                        chances--;
                      } else {
                        palavra = 'voce nao tem mais chances';
                      }
                    }
                  });
                },
              ),
              ElevatedButton(
                child: const Text('qual o botao correto N°3 ?'),
                onPressed: () {
                  setState(() {
                    if (acertos == 2 && tentativas != 2 && chances > 0) {
                      palavra = 'parabens voce acertou ';
                      corfundo = Colors.green;
                      ThemeData.dark()
                          .copyWith(scaffoldBackgroundColor: corfundo);
                      if (tentativas < 2) {
                        vitoria++;
                      }
                    } else {
                      palavra = 'voce errou sinto muito';
                      corfundo = Colors.red;
                      ThemeData.dark()
                          .copyWith(scaffoldBackgroundColor: corfundo);
                      tentativas++;
                      if (tentativas < 2) {
                        derrotas++;
                      }
                      if (chances > 0) {
                        chances--;
                      } else {
                        palavra = 'voce nao tem mais chances';
                      }
                    }
                  });
                },
              ),
              ElevatedButton(
                child: const Text('reiniciar '),
                onPressed: () {
                  setState(() {
                    corfundo = Colors.purple;
                    ThemeData.dark()
                        .copyWith(scaffoldBackgroundColor: corfundo);
                    palavra = '=>';
                    tentativas = 0;
                    chances = 2;
                    acertos = Random().nextInt(3);
                    debugPrint('oss : $acertos ');
                  });
                },
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text('Vitorias : $vitoria'),
                Text('Derrotas : $derrotas'),
                Text('chances : $chances'),
              ]),
              const Column(
                children: [
                  Text(
                      '\n voce tem duas(2) chances para acertar \n,caso o nao consiga reinicie o game')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
