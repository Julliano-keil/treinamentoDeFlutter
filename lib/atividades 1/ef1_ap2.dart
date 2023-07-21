import 'dart:math';

import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  // runApp(const MyApp());
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
  //
  var tentativas = 0;
//
  var acertos = Random().nextInt(2);

  var corfundo = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: corfundo),
      home: Scaffold(
        appBar: AppBar(
          title: Text(palavra),
        ),
        body: Center(
          child: Column(children: [
            ElevatedButton(
              child: const Text('qual o botao correto N°1 ?'),
              onPressed: () {
                setState(() {
                  if (acertos == 0 && tentativas == 0 || tentativas == 1) {
                    palavra = 'parabens voce acertou ';
                    corfundo = Colors.green;
                    ThemeData.dark()
                        .copyWith(scaffoldBackgroundColor: corfundo);
                  } else {
                    palavra = 'voce errou sinto muinto';
                    corfundo = Colors.red;
                    ThemeData().copyWith(scaffoldBackgroundColor: corfundo);
                    tentativas++;
                  }
                });
              },
            ),
            ElevatedButton(
              child: const Text('qual o botao correto N°2 ?'),
              onPressed: () {
                setState(() {
                  if (acertos == 1 && tentativas == 0 || tentativas == 1) {
                    palavra = 'parabens voce acertou ';
                    corfundo = Colors.green;
                    ThemeData.dark()
                        .copyWith(scaffoldBackgroundColor: corfundo);
                  } else {
                    palavra = 'voce errou sinto muinto';
                    corfundo = Colors.red;
                    ThemeData.dark()
                        .copyWith(scaffoldBackgroundColor: corfundo);
                    tentativas++;
                  }
                });
              },
            ),
            ElevatedButton(
              child: const Text('qual o botao correto N°3 ?'),
              onPressed: () {
                setState(() {
                  if (acertos == 2 && tentativas == 0 || tentativas == 1) {
                    palavra = 'parabens voce acertou ';
                    corfundo = Colors.green;
                    ThemeData.dark()
                        .copyWith(scaffoldBackgroundColor: corfundo);
                  } else {
                    palavra = 'voce errou sinto muinto';
                    corfundo = Colors.red;
                    ThemeData.dark()
                        .copyWith(scaffoldBackgroundColor: corfundo);
                    tentativas++;
                  }
                });
              },
            ),
            Column(
              children: [Text('correto $acertos')],
            )
          ]),
        ),
      ),
    );
  }
}
