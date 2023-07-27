import 'package:flutter/material.dart';

void main() {
  //srunApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// aonde decide para aonde vai a cor
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/Home1': (context) => const Home1(),
        '/Home2': (context) => const Home2(),
        '/Home3': (context) => const Home3(),
        '/Home4': (context) => const Home4(),
        '/Home5': (context) => const Home5(),
      },
    ));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('escolha uma cor '),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Home1();
                  },
                ));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('Preto', style: TextStyle(fontSize: 20)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Home2();
                  },
                ));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                'verde',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Home3();
                  },
                ));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text('Amarelo', style: TextStyle(fontSize: 20)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Home4();
                  },
                ));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              child: const Text('Rosa', style: TextStyle(fontSize: 20)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Home5();
                  },
                ));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Vermelho', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Cor celecionada'),
              backgroundColor: Colors.black,
            ),
            body: CustomButton(
              label: 'preto',
              backgroundColor: Colors.black,
              borderRadius: 0,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            )));
  }
}

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Cor celecionada'),
              backgroundColor: Colors.green,
            ),
            body: CustomButton(
              label: 'Verde',
              backgroundColor: Colors.green,
              borderRadius: 0,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            )));
  }
}

class Home3 extends StatelessWidget {
  const Home3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Cor celecionada'),
              backgroundColor: Colors.yellow,
            ),
            body: CustomButton(
              label: 'Amarelo',
              backgroundColor: Colors.yellow,
              borderRadius: 0,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            )));
  }
}

class Home4 extends StatelessWidget {
  const Home4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Cor celecionada'),
              backgroundColor: Colors.pink,
            ),
            body: CustomButton(
              label: 'Rosa',
              backgroundColor: Colors.pink,
              borderRadius: 0,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            )));
  }
}

class Home5 extends StatelessWidget {
  const Home5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Cor celecionada'),
              backgroundColor: Colors.red,
            ),
            body: CustomButton(
              label: 'Vermelho',
              backgroundColor: Colors.red,
              borderRadius: 0,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            )));
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final double borderRadius;
  final Color textColor;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.borderRadius,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1080,
      height: 1920,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors
              .transparent, // Define a cor de fundo do botão para transparente
          elevation: 0, // Remove a sombra do botão
        ),
        child: Text(
          label,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
