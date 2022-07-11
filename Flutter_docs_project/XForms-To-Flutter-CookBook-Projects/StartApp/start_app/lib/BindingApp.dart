import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class FormApp extends StatefulWidget {
  const FormApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {
  final TextEditingController myController = TextEditingController();

  String? _errorText;

  String? getErrorText() {
    return _errorText;
  }

  bool isEmail(String em) {
    const String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|'
        r'(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|'
        r'(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regExp = RegExp(emailRegexp);
    return regExp.hasMatch(em);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Retrieve Text Input')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
          onSubmitted: (String text) {
            setState(() {
              if (!isEmail(text)) {
                _errorText = 'Error: This is not an email';
              } else {
                _errorText = null;
              }
            });
          },
          decoration: InputDecoration(
            hintText: 'enter text email and press float button',
            errorText: getErrorText(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text(myController.text),
                );
              },
              barrierLabel: 'Text Field',
              barrierDismissible: true,
              useRootNavigator: true,
              barrierColor: Colors.blue.shade50);
        },
        tooltip: 'Show me text value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
