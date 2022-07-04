import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SampleApp extends StatefulWidget {
  const SampleApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleApp> {
  String textToShow = 'new to flutter';
  bool IsUpdate = true;
  void updateText() {
    setState(() {
      IsUpdate = !IsUpdate;
      if (IsUpdate) {
        textToShow = "Flutter is awesome";
      } else {
        textToShow = "new to flutter";
      }
    });
  }

  Widget _getToggleChild() {
    if (IsUpdate) {
      return const Text('Toggle One');
    }
    return CupertinoButton(child: Text(textToShow), onPressed: () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample App')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(left: 20.0, right: 30.0),
          ),
          onPressed: updateText,
          child: Text(textToShow),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: updateText,
        tooltip: 'Update text',
        child: const Icon(Icons.zoom_out_sharp),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
