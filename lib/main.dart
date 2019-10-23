import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Produtos', home: Lista());
  }
}

class ListaState extends State<Lista> {
  final _suggestions = <String>["O pequeno principe", "O Alquimista", "Capitães da Areia", "Memórias Póstumas de Brás Cubas", "As Três Marias", "Pauliceia Desvairada", "A Hora da Estrela"];
  final Set<String> _saved = Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livros Brasileiros'),
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
           return null;
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(String produto) {
    final bool alreadySaved = _saved.contains(produto);
    return ListTile(
        title: Text(produto, style:_biggerFont,),
        trailing: Icon(
          alreadySaved ? Icons.check_box : Icons.check_box_outline_blank,
          color: alreadySaved ? Colors.blue : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(produto);
            } else {
              _saved.add(produto);
            }
          });
        });
  }
}

class Lista extends StatefulWidget {
  @override
  ListaState createState() => ListaState();
}
