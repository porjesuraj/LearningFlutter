import 'package:flutter/material.dart';

class ListViewApp extends StatefulWidget {
  const ListViewApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListViewState();
}

class _ListViewState extends State<ListViewApp> {
  late String tapped = "";

  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  Widget getRow(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widgets.add(getRow(widgets.length));
          print('Row $index');
        });
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        color: Colors.green,
        shadowColor: Colors.amber,
        elevation: 20,
        child: Text(
          'Item $index $tapped',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GridView Demo'),
        ),
        body: ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int index) {
            return getRow(index);
          },
        ));
  }
}
