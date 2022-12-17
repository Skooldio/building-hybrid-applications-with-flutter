import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_example/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PokemonModel> pokemonList = [];

  @override
  void initState() {
    fetchApi();
    super.initState();
  }

  Future<void> fetchApi() async {
    var url = Uri.https('pokeapi.co', '/api/v2/pokemon');
    var response = await http.get(url);

    var pokemonResponse = PokemonResponse.fromJson(jsonDecode(response.body));
    setState(() {
      pokemonList = pokemonResponse.results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.all(8),
                child: Text(pokemonList[index].name));
          },
          itemCount: pokemonList.length,
        ),
      ),
    );
  }
}
