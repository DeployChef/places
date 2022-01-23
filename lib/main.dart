import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFirstStatfulWidget(),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  int _counter = 0;
  MyFirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _counter++;
    return Container(
        child: Center(
      child: Text("Hello, counter is ${_counter}"),
    ));
  }
}

class MyFirstStatfulWidget extends StatefulWidget {
  MyFirstStatfulWidget({Key? key}) : super(key: key);

  @override
  State<MyFirstStatfulWidget> createState() => _MyFirstStatfulWidgetState();
}

class _MyFirstStatfulWidgetState extends State<MyFirstStatfulWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    _counter++;
    return Container(
        child: Center(
      child: Text("Hello, counter is ${_counter}"),
    ));
  }
}
