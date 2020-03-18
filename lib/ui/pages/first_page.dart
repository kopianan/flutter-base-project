import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key, @required this.nama, this.usia}) : super(key: key);

  final String nama;
  final int usia;

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Container(child: Center(child: Column(children: <Widget>[
        Text(widget.nama.toString()),
        Text(widget.usia.toString()),
      ],),),),
    );
  }
}
