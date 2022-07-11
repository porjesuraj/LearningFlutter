import 'package:flutter/material.dart';

class GestureApp extends StatefulWidget {
  const GestureApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GerstureAppState();
}

class _GerstureAppState extends State<GestureApp>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation ')),
      body: Center(
          child: GestureDetector(
        onDoubleTap: () {
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
        child: RotationTransition(
          turns: curve,
          child: const FlutterLogo(
            size: 200.0,
          ),
        ),
      )),
    );
  }
}
