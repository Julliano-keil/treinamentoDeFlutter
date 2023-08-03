import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => EstadoListaDePessoas(),
    child: const MyApp(),
  ));
}

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

class Pessoa {
  Pessoa({
    this.nome,
    this.email,
    this.telefone,
    this.github,
    this.tipoSanguineo,
  });

  String? nome;
  String? email;
  String? telefone;
  String? github;
  TipoSanguineo? tipoSanguineo;

  // todo: implementar equals e hashcode
}

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[];

  List<Pessoa> get pessoas => List.unmodifiable(_listaDePessoas);

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    notifyListeners();
  }

  void atualizar(int index, Pessoa pessoa) {
    _listaDePessoas[index] = pessoa;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TelaInicial());
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        appBar:
            AppBar(title: const Center(child: Text('Cadastros e listagem'))),
        body: Consumer<EstadoListaDePessoas>(builder: (context, value, child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('cadastrar Usuario'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddPessoas()),
                        );
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Lista e Ediçao '),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListaDePessoa()),
                        );
                      },
                    ),
                  ],
                ),
              ]),
            ),
          );
        }),
      ),
    );
  }
}

class ListaDePessoa extends StatefulWidget {
  const ListaDePessoa({super.key});

  @override
  State<ListaDePessoa> createState() => _ListaDePessoaState();
}

class _ListaDePessoaState extends State<ListaDePessoa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Pessoas')),
      backgroundColor: Colors.purple,
      body: Consumer<EstadoListaDePessoas>(
        builder: (context, estadoListaDePessoas, child) {
          final pessoas = estadoListaDePessoas.pessoas;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: pessoas.length,
            itemBuilder: (context, index) {
              final pessoa = pessoas[index];
              return ListTile(
                title: Text(pessoa.nome!),
                subtitle: Text(pessoa.email!),
                trailing: const Icon(Icons.backspace_outlined),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditarPessoa(pessoaIndex: index),
                    ),
                  ).then((_) {
                    setState(() {});
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}

class EditarPessoa extends StatefulWidget {
  final int pessoaIndex;

  const EditarPessoa({required this.pessoaIndex, super.key});

  @override
  State<EditarPessoa> createState() => _EditarPessoaState();
}

class _EditarPessoaState extends State<EditarPessoa> {
  late Pessoa _pessoa;
  final _formulario = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _pessoa = Provider.of<EstadoListaDePessoas>(context, listen: false)
        .pessoas[widget.pessoaIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(title: const Text('Editar Pessoa')),
      body: Consumer<EstadoListaDePessoas>(builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formulario,
            child: Column(
              children: [
                //formulario de alteraçao
                Push15(
                  initialvalue: _pessoa.nome,
                  labelText: 'Nome',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira dado válido!';
                    }
                    return null;
                  },
                ),
                Push15(
                  initialvalue: _pessoa.email,
                  labelText: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira dado válido!';
                    }
                    return null;
                  },
                ),
                Push15(
                  initialvalue: _pessoa.telefone,
                  labelText: 'Telefone',
                  keybord: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira dado válido!';
                    }
                    return null;
                  },
                ),
                Push15(
                  initialvalue: _pessoa.github,
                  labelText: 'GitHub',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira dado válido!';
                    }
                    return null;
                  },
                ),
                Card(
                  color: Colors.purple,
                  child: DropdownButtonFormField<TipoSanguineo>(
                    value: _pessoa.tipoSanguineo,
                    onChanged: (value) {
                      setState(() {
                        _pessoa.tipoSanguineo = value!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: TipoSanguineo.aPositivo,
                        child: Text('A+'),
                      ),
                      DropdownMenuItem(
                        value: TipoSanguineo.aNegativo,
                        child: Text('A-'),
                      ),
                      DropdownMenuItem(
                        value: TipoSanguineo.bPositivo,
                        child: Text('B+'),
                      ),
                      DropdownMenuItem(
                        value: TipoSanguineo.bNegativo,
                        child: Text('B-'),
                      ),
                      DropdownMenuItem(
                        value: TipoSanguineo.oPositivo,
                        child: Text('O+'),
                      ),
                      DropdownMenuItem(
                        value: TipoSanguineo.oNegativo,
                        child: Text('O-'),
                      ),
                      DropdownMenuItem(
                        value: TipoSanguineo.abPositivo,
                        child: Text('AB+'),
                      ),
                      DropdownMenuItem(
                        value: TipoSanguineo.abNegativo,
                        child: Text('AB-'),
                      ),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Tipo Sanguíneo',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formulario.currentState!.validate()) {
                      Provider.of<EstadoListaDePessoas>(context, listen: false)
                          .atualizar(widget.pessoaIndex, _pessoa);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Salvar Alterações'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class AddPessoas extends StatefulWidget {
  const AddPessoas({super.key});

  @override
  State<AddPessoas> createState() => _AddPessoasState();
}

class _AddPessoasState extends State<AddPessoas> {
  final _formulario = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _telefone = TextEditingController();
  final _git = TextEditingController();
  TipoSanguineo _tiposangue = TipoSanguineo.aPositivo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
        home: Scaffold(
            backgroundColor: Colors.purple,
            appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // Lógica para voltar para a tela anterior
                    Navigator.of(context).pop();
                  },
                ),
                backgroundColor: Colors.purple,
                title: (const Text('Cadastro'))),
            body: Consumer<EstadoListaDePessoas>(
              builder: (context, estadoListaDePessoas, child) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: _formulario,
                      child: Column(
                        children: [
                          //formulario de cadastro
                          Push15(
                              controller: _nome,
                              labelText: 'Nome',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira dado válido!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _nome.text = value ?? '';
                              }),
                          Push15(
                              controller: _email,
                              labelText: 'Email',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira dado válido!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _email.text = value ?? '';
                              }),
                          Push15(
                              controller: _telefone,
                              keybord: TextInputType.number,
                              labelText: 'Telefone',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira dado válido!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _telefone.text = value ?? '';
                              }),
                          Push15(
                              controller: _git,
                              labelText: 'GitHub',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira dado válido!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _git.text = value ?? '';
                              }),
                          Card(
                            //                                                                              <= tipo sanguineo
                            color: Colors.purple,
                            child: DropdownButtonFormField<TipoSanguineo>(
                              value: _tiposangue,
                              onChanged: (value) {
                                setState(() {
                                  _tiposangue = value!;
                                });
                              },
                              items: const [
                                DropdownMenuItem(
                                  value: TipoSanguineo.aPositivo,
                                  child: Text('A+'),
                                ),
                                DropdownMenuItem(
                                  value: TipoSanguineo.aNegativo,
                                  child: Text('A-'),
                                ),
                                DropdownMenuItem(
                                  value: TipoSanguineo.bPositivo,
                                  child: Text('B+'),
                                ),
                                DropdownMenuItem(
                                  value: TipoSanguineo.bNegativo,
                                  child: Text('B-'),
                                ),
                                DropdownMenuItem(
                                  value: TipoSanguineo.oPositivo,
                                  child: Text('O+'),
                                ),
                                DropdownMenuItem(
                                  value: TipoSanguineo.oNegativo,
                                  child: Text('O-'),
                                ),
                                DropdownMenuItem(
                                  value: TipoSanguineo.abPositivo,
                                  child: Text('AB+'),
                                ),
                                DropdownMenuItem(
                                  value: TipoSanguineo.abNegativo,
                                  child: Text('AB-'),
                                ),
                              ],
                            ),
                          ),

                          //botaoo para salvar                                                                  <= botao
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (_formulario.currentState!
                                            .validate()) {
                                          _formulario.currentState!.save();
                                          Pessoa novaPessoa = Pessoa(
                                            nome: _nome.text,
                                            email: _email.text,
                                            telefone: _telefone.text,
                                            github: _git.text,
                                            tipoSanguineo: _tiposangue,
                                          );

                                          // Adiciona a nova pessoa ao estadoListaDePessoas
                                          estadoListaDePessoas
                                              .incluir(novaPessoa);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const TelaInicial()));
                                        }
                                      },
                                      child: const Text('salvar')),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _nome.clear();
                                      _email.clear();
                                      _git.clear();
                                      _telefone.clear();
                                    },
                                    child: const Text('Excluir'),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}

class Push15 extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? Function(String?) validator;
  final void Function(String?)? onSaved;
  final keybord;
  final String? initialvalue;

  const Push15({
    super.key,
    this.controller,
    required this.labelText,
    required this.validator,
    this.onSaved,
    this.keybord,
    this.initialvalue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple,
      child: TextFormField(
        initialValue: initialvalue,
        controller: controller,
        keyboardType: keybord,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.amber[700], fontSize: 15),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
          border: const OutlineInputBorder(),
        ),
        validator: validator,
        onSaved: onSaved,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
