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
        body: Center(
          child:
              Consumer<EstadoListaDePessoas>(builder: (context, value, child) {
            return Container(
              width: 1080,
              height: 1920,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Define o raio da borda do botão
                          ),
                        ),
                        child: const Text('ver lista e atualizar'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListaDePessoa()),
                          );
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Define o raio da borda do botão
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
                    ],
                  ),
                ]),
              ),
            );
          }),
        ),
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
                trailing: const Icon(Icons.chevron_right),
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
                Card(
                  color: Colors.purple,
                  child: TextFormField(
                    initialValue: _pessoa.nome,
                    onChanged: (value) {
                      setState(() {
                        _pessoa.nome = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um nome válido';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  color: Colors.purple,
                  child: TextFormField(
                    initialValue: _pessoa.email,
                    onChanged: (value) {
                      setState(() {
                        _pessoa.email = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um e-mail válido';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  color: Colors.purple,
                  child: TextFormField(
                    initialValue: _pessoa.telefone,
                    onChanged: (value) {
                      setState(() {
                        _pessoa.telefone = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um telefone válido';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Telefone',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  color: Colors.purple,
                  child: TextFormField(
                    initialValue: _pessoa.github,
                    onChanged: (value) {
                      setState(() {
                        _pessoa.github = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um nome de usuário do GitHub válido';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'GitHub',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      border: OutlineInputBorder(),
                    ),
                  ),
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
                          Card(
                            color: Colors.purple,
                            child: TextFormField(
                              controller: _nome,
                              decoration: const InputDecoration(
                                labelText: ' Nome',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira dado valido ';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _nome.text = value ?? '';
                              },
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Card(
                            color: Colors.purple,
                            child: TextFormField(
                              controller: _email,
                              decoration: const InputDecoration(
                                labelText: ' Email',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira dado valido ';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _email.text = value ?? '';
                              },
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Card(
                            color: Colors.purple,
                            child: TextFormField(
                              controller: _telefone,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: ' Telefone',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira dado valido ';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _telefone.text = value ?? '';
                              },
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Card(
                            color: Colors.purple,
                            child: TextFormField(
                              controller: _git,
                              decoration: const InputDecoration(
                                labelText: ' GitHub',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira dado valido ';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _git.text = value ?? '';
                              },
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
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
                                      _telefone.clear();
                                      _git.clear();
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
