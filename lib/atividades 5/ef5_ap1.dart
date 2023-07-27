import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(const MyApp());
}

class Produto {
  final int imagemid;
  final String title;
  final String url;
  final String imagem;

  Produto(this.imagemid, this.title, this.url, this.imagem);

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      json["id"],
      json["title"],
      json["url"],
      json["thumbnailUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": imagemid,
        "title": title,
        "url": url,
        "thumbnailUrl": imagem,
      };
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> listaProduto = [];

  Future<List<Produto>> _getProdutos() async {
    Uri uri = Uri.parse(
        "https://raw.githubusercontent.com/LinceTech/dart-workshops/main/flutter-async/ap_1/request.json");

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      List<Produto> produtos =
          data.map<Produto>((json) => Produto.fromJson(json)).toList();
      return produtos;
    } else {
      throw Exception("Erro na requisição http (cod.: ${response.statusCode})");
    }
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 1; i <= 100; i++) {
      listaProduto.add('produto $i');
    }

    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('lista de produtos'),
      ),
      body: FutureBuilder(
          future: _getProdutos(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: Text('carregando...'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      width: 70,
                      child: Image.network(
                        snapshot.data[index].imagem,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text('${snapshot.data[index].title}\n'),
                    onTap: () {
                      print("Imagem URL: ${snapshot.data[index].imagem}");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return VisualizaImage(
                              frase: snapshot.data[index].title,
                              image: snapshot.data[index].imagem,
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              );
            }
          }),
    ));
  }
}

class VisualizaImage extends StatelessWidget {
  final String? image;
  final String? frase;
  const VisualizaImage({super.key, this.image, this.frase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 43, 14, 48),
        appBar: AppBar(
          title: const Text('animal celecionado'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(child: Image.network(image!)),
      ),
    );
  }
}
