import 'package:flutter/material.dart';
import 'fade.dart';
import 'homepage.dart';
import 'sampleApp.dart';
import 'sampleApp2.dart';
import 'canvasApp.dart';

void main() {
  //runApp(const MyApp());
  runApp(const MaterialApp(
    home: DemoApp(),
  ));
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
      home: const SampleApp2(),
      //home: const SampleApp(),
      //home: const MyHomePage('demo'),
      //home: const FadeApp(title: 'fade app'),
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
