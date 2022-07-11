import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Post.dart';

class AsyncApp extends StatefulWidget {
  const AsyncApp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _AsyncAppState();
}

class _AsyncAppState extends State<AsyncApp> {
  List<dynamic> data = <dynamic>[];

  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final Uri dataURL = Uri.parse(
      'https://jsonplaceholder.typicode.com/posts',
    );
    final http.Response response = await http.get(dataURL);

    setState(() {
      data = jsonDecode(response.body);
      count = data.length;
    });
  }

  Widget getRow(int index) {
    if (count > 0) {
      return Card(
          color: Colors.redAccent,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('${data[index]['title']} ',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ));
    }
    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async App'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return getRow(index);
        },
      ),
    );
  }
}
