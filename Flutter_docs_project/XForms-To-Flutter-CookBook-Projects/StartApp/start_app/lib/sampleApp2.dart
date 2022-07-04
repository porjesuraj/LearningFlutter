import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SampleApp2 extends StatefulWidget {
  const SampleApp2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SampleApp2State();
}

class _SampleApp2State extends State<SampleApp2> {
  bool isUpdate = true;
  void updateText() {
    setState(() {
      isUpdate = !isUpdate;
    });
  }

  void toggleSwitch(bool update) {
    isUpdate != isUpdate;
  }

  Widget _getToggleChild() {
    if (isUpdate) {
      return MaterialButton(
          onPressed: () {},
          color: Colors.transparent,
          disabledColor: Colors.greenAccent,
          child: Switch(
            value: isUpdate,
            activeColor: Colors.green,
            onChanged: toggleSwitch,
          ));
    }
    return CupertinoButton(
        onPressed: () {},
        color: Colors.transparent,
        disabledColor: Colors.blueGrey,
        child: CupertinoSwitch(
          value: isUpdate,
          activeColor: Colors.green,
          onChanged: toggleSwitch,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample App 2')),
      body: Center(child: _getToggleChild()),
      floatingActionButton: FloatingActionButton(
        onPressed: updateText,
        tooltip: 'toggle',
        child: const Icon(Icons.upcoming),
      ),
    );
  }
}
