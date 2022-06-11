import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator '),
        ),
        body: const Center(
          child: RandomDigits(),
        ),
      ),
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
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    final _suggestions = <WordPair>[];
    final _biggerfont = const TextStyle(fontSize: 20);
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return ListTile(
              title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerfont,
          ));
        });
  }
}
