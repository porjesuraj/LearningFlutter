import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:start_app/AppLifeCycleApp.dart';
import 'package:start_app/AsyncDemoApp.dart';
import 'package:start_app/BindingApp.dart';
import 'package:start_app/GerstureApp.dart';
import 'package:start_app/GridviewApp.dart';
import 'package:start_app/isolateApp.dart';
import 'package:start_app/navigateOutOfApp.dart';
import 'fade.dart';
import 'homepage.dart';
import 'sampleApp.dart';
import 'sampleApp2.dart';
import 'canvasApp.dart';
import 'home.dart';
import 'AsyncDemoApp.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
  // runApp(const MaterialApp(
  //  home: DemoApp(),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
          backgroundColor: Colors.black),
      //home: const SampleApp2(),
      //home: const SampleApp(),
      home: const HomePage(title: 'Demos'),
      //home: const FadeApp(title: 'fade app'),
      routes: <String, WidgetBuilder>{
        '/sample1': (BuildContext context) => const SampleApp(),
        '/sample2': (BuildContext context) => const SampleApp2(),
        '/fade': (BuildContext context) =>
            const FadeApp(title: 'fade demo app'),
        '/myHome': (BuildContext context) => const MyHomePage(title: 'home'),
        '/sign': (BuildContext context) => const DemoApp(),
        '/navToUrl': (BuildContext context) =>
            const NavigationUrlApp(title: "Url App"),
        '/asyncApp': (BuildContext context) =>
            const AsyncApp(title: 'Async Demo'),
        '/isolateApp': (BuildContext context) => const IsolatedAppPage(),
        '/appLife': (BuildContext context) => const AppLifecycleReactor(),
        '/gridView': (BuildContext context) => const GridViewApp(),
        '/gestureApp': (BuildContext context) => const GestureApp(),
        '/formApp': (BuildContext context) => const FormApp(),
      },
      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: const <Locale>[
      //   Locale('en', 'US'),
      //   Locale('es', ''),
      // ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  //@override
  //Widget build(BuildContext context) => Scaffold(body: const Signature());
}

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(body: const Signature());
}
