import 'package:flutter/material.dart';

class GridViewApp extends StatefulWidget {
  const GridViewApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GridViewState();
}

class _GridViewState extends State<GridViewApp> {
  late String tapped = "";

  SetTapTrue() {
    setState(() {
      tapped = 'true';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Demo'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List<Widget>.generate(10, (index) {
          return GestureDetector(
            onTap: SetTapTrue(),
            onDoubleTap: SetTapTrue(),
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
        }),
      ),
    );
  }
}
