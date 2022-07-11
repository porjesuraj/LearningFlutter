import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IsolatedAppPage extends StatefulWidget {
  const IsolatedAppPage({Key? key}) : super(key: key);

  @override
  _IsolatedAppState createState() => _IsolatedAppState();
}

class _IsolatedAppState extends State<IsolatedAppPage> {
  List<Map<String, dynamic>> data = <Map<String, dynamic>>[];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  bool get showLoadingDialog => data.isEmpty;

  Future<void> loadData() async {
    final ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    // The 'echo' isolate sends its SendPort as the first message
    final SendPort sendPort = await receivePort.first as SendPort;
    final List<Map<String, dynamic>> msg = await sendReceive(
      sendPort,
      'https://jsonplaceholder.typicode.com/posts',
    );
    setState(() {
      data = msg;
    });
  }

  // The entry point for the isolate
  static Future<void> dataLoader(SendPort sendPort) async {
    // Open the ReceivePort for incoming messages.
    final ReceivePort port = ReceivePort();

    // Notify any other isolates what port this isolate listens to.
    sendPort.send(port.sendPort);
    await for (final dynamic msg in port) {
      final String url = msg[0] as String;
      final SendPort replyTo = msg[1] as SendPort;

      final Uri dataURL = Uri.parse(url);
      final http.Response response = await http.get(dataURL);
      // Lots of JSON to parse
      replyTo.send(jsonDecode(response.body) as List<Map<String, dynamic>>);
    }
  }

  Future<List<Map<String, dynamic>>> sendReceive(SendPort port, String msg) {
    final ReceivePort response = ReceivePort();
    port.send(<dynamic>[msg, response.sendPort]);
    return response.first as Future<List<Map<String, dynamic>>>;
  }

  Widget getBody() {
    if (showLoadingDialog) {
      return getProgressDialog();
    }
    return getListView();
  }

  Widget getProgressDialog() {
    return const Center(child: CircularProgressIndicator());
  }

  ListView getListView() {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return getRow(index);
      },
    );
  }

  Widget getRow(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text('Row ${data[index]['title']}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample App')),
      body: getBody(),
    );
  }
}
