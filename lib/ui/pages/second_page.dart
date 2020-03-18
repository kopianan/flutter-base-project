import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({ @required this.nama}) ;
  final String nama;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Container(
        child: Center(
          child: Text(widget.nama.toString()),
        ),
      ),
    );
  }
}
