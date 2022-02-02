import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFirstWidget(),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  int _counter = 0;
  MyFirstWidget({Key? key}) : super(key: key);

  //void getContext() => print('контекст: ${context.runtimeType}'); //Undefined name 'context'

  @override
  Widget build(BuildContext context) {
    _counter++;
    return Container(
        child: Center(
      child: Text("Hello"),
    ));
  }
}

class MyFirstStatfulWidget extends StatefulWidget {
  MyFirstStatfulWidget({Key? key}) : super(key: key);

  @override
  State<MyFirstStatfulWidget> createState() => _MyFirstStatfulWidgetState();
}

class _MyFirstStatfulWidgetState extends State<MyFirstStatfulWidget> {
  void getContext() => print('контекст: ${context.runtimeType}');

  @override
  Widget build(BuildContext context) {
    getContext();
    return Container(
        child: Center(
      child: Text("Hello"),
    ));
  }
}
