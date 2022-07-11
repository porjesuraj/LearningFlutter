import 'package:flutter/material.dart';

class AppLifecycleReactor extends StatefulWidget {
  const AppLifecycleReactor({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppLifeCycleReactorState();
}

class _AppLifeCycleReactorState extends State<AppLifecycleReactor>
    with WidgetsBindingObserver {
  AppLifecycleState _notification = AppLifecycleState.detached;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _notification = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('app life cycle')),
      body: Center(
        child: Text('Last Notification for App State: $_notification'),
      ),
    );
  }
}
