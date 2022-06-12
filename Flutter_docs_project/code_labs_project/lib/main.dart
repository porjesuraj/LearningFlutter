import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Startup Name Generator',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.amberAccent,
              foregroundColor: Colors.white)),
      home: const RandomDigits(),
    );
  }
}

class RandomDigits extends StatefulWidget {
  const RandomDigits({Key? key}) : super(key: key);

  @override
  State<RandomDigits> createState() => _RandomDigitsState();
}

class _RandomDigitsState extends State<RandomDigits> {
  @override
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerfont = const TextStyle(fontSize: 20);
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
          actions: [
            IconButton(
              onPressed: _pushSaved,
              icon: const Icon(Icons.list),
              tooltip: 'Saved Suggestion',
            ),
          ],
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, i) {
              if (i.isOdd) return const Divider();

              final index = i ~/ 2;

              if (index >= _suggestions.length) {
                _suggestions.addAll(generateWordPairs().take(10));
                log('list added');
              }
              final alreadySaved = _saved.contains(_suggestions[index]);

              return ListTile(
                title: Text(
                  _suggestions[index].asPascalCase,
                  style: _biggerfont,
                ),
                trailing: Icon(
                    alreadySaved ? Icons.favorite : Icons.favorite_border,
                    color: alreadySaved ? Colors.red : null,
                    semanticLabel: alreadySaved ? 'Remove from saved' : 'Save'),
                onTap: () {
                  setState(() {
                    if (alreadySaved) {
                      _saved.remove(_suggestions[index]);
                    } else {
                      _saved.add(_suggestions[index]);
                    }
                  });
                },
              );
            }));
  }

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) {
        final tiles = _saved.map(
          (pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerfont,
              ),
            );
          },
        );

        final divided = tiles.isNotEmpty
            ? ListTile.divideTiles(tiles: tiles, context: context).toList()
            : <Widget>[];

        return Scaffold(
          appBar: AppBar(
            title: const Text('Saved Suggestions'),
          ),
          body: ListView(children: divided),
        );
      },
    ));
  }
}
