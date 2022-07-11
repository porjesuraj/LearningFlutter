import 'package:flutter/material.dart';
import 'package:start_app/StringsConstants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  Widget getRow(
      String title, String navigateTo, Icon icon, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.up,
        children: [
          Text(title),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(navigateTo);
              },
              child: icon),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(StringConstants.welcomeMessage),
            getRow(
                "increment count", "/myHome", const Icon(Icons.home), context),
            getRow("Sample one", "/sample1",
                const Icon(Icons.stay_primary_landscape), context),
            getRow("Sample two", "/sample2",
                const Icon(Icons.nights_stay_sharp), context),
            getRow("Fade Sample", "/fade", const Icon(Icons.face), context),
            getRow("Custom Canvas", "/sign", const Icon(Icons.sick_sharp),
                context),
            getRow("URL Nav out", "/navToUrl", const Icon(Icons.navigation),
                context),
            getRow("async List ", "/asyncApp", const Icon(Icons.library_add),
                context),
            getRow("Isolates used for List", "/isolateApp",
                const Icon(Icons.list_alt), context),
            getRow("App Life Cycle Demo", "/appLife",
                const Icon(Icons.app_settings_alt_outlined), context),
            getRow("Grid view Demo", "/gridView", const Icon(Icons.grid_on),
                context),
            getRow("Gesture Demo", "/gestureApp", const Icon(Icons.animation),
                context),
            getRow("Form Demo", "/formApp",
                const Icon(Icons.format_align_justify_rounded), context),
            Text(
                'Localization string ${AppLocalizations.of(context)!.helloWorld} ',
                style: const TextStyle(fontSize: 20)),
            Stack(
              children: const <Widget>[
                Icon(
                  Icons.add,
                  size: 44.0,
                  color: Colors.white,
                  shadows: [Shadow(offset: Offset.infinite, blurRadius: 10)],
                ),
                Positioned(
                  left: 0.0,
                  child: Icon(
                    Icons.add_circle,
                    size: 44.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'empty',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
