import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: 'Test Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color colors = Colors.black;
  int _counter = 0;

  void _changeColor() {
    setState(() {
      colors = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      _counter++;
    });
  }

  void _refreshCounter() {
    setState(() {
      colors = Colors.black;
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: colors,
      ),
      body: Center(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: RaisedButton(
          onPressed: _changeColor,
          child: Text(
            'Hey there, $_counter',
            style: TextStyle(color: Colors.white),
          ),
          color: colors,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshCounter,
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
