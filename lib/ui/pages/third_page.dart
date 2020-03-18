import 'package:base_project/models/post.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key key, @required this.postModel}) : super(key: key);

  final Post postModel;

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("THird Page"),
      ),
      body: Container(
        child: Text(widget.postModel.nama + widget.postModel.usia.toString()),
      ),
    );
  }
}
