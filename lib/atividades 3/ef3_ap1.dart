import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //variaveis
  var cor = Colors.purple;

  get color =>
      idade < 18 || nome.length < 3 || nome.startsWith(RegExp(r'[^A-Z]'))
          ? const Color.fromARGB(255, 212, 10, 37)
          : const Color.fromARGB(153, 238, 233, 233);

  int idade = 0;
  String nome = '';

  var cordados = Colors.blueGrey[50];
  var cordadosErrados = Colors.red[50];

  var ativo = false;
  String get palavra1 =>
      ativo ? ' usuario $nome ativo' : 'usuario $nome inativo';

  String get aviso => idade < 18
      ? 'voce é maior de 18 ? \n voce preencheu os dados corretamente ?'
      : 'login feito com sucesso';

  var palavra = ' ';

  // arvores
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Login ',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  ' Insira seus dados',
                  style: TextStyle(color: cor, fontSize: 20),
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Nome '),
                  onChanged: (nome2) {
                    nome = nome2;
                  },
                  style: TextStyle(color: cor),
                ),
                TextField(
                  focusNode: FocusNode(canRequestFocus: nome.isEmpty),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'idade '),
                  style: TextStyle(color: cor),
                  onChanged: (idade2) {
                    int idadeint;
                    idadeint = int.parse(idade2);
                    idade = idadeint;
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      value: ativo,
                      onChanged: (check) {
                        setState(() {
                          ativo = !ativo;
                        });
                      },
                    ),
                    Text(palavra1)
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      debugPrint('nome $nome');
                      debugPrint('idade $idade');
                      debugPrint(palavra1);
                      setState(() {
                        if (idade < 18 || nome.length < 3) {
                          setState(() {
                            palavra =
                                'voce tem 18 ano ? \n voce preencheu os dados corretamente?';
                          });
                        } else {
                          palavra = 'login efetuado com sucesso';
                        }
                        debugPrint(palavra);
                      });
                    },
                    child: const Text('Salvar')),
                Column(
                  children: [
                    Text(palavra),
                  ],
                ),

                // ignore: avoid_unnecessary_containers
                Container(
                  child: const Text(
                    'Seus dados : ',
                    style: TextStyle(fontSize: 22, color: Colors.purple),
                  ),
                ),

                Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(children: [
                      Text(
                        nome.length > 3 || nome.contains('')
                            ? 'nome : $nome'
                            : 'verifique se o nome esta correto!',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        idade < 18 || idade > 100
                            ? 'verifique se a idade esta correta'
                            : 'idade : $idade anos',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        palavra1,
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
