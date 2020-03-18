import 'package:base_project/models/post.dart';
import 'package:base_project/routes/router.gr.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Go To First Page"),
              onPressed: () {
                Navigator.pushNamed(context, Router.firstPage, arguments: FirstPageArguments(nama: "anan", usia: 112));
              },
            ),
            RaisedButton(
              child: Text("Go To Second Page"),
              onPressed: () {
                Navigator.of(context).pushNamed(Router.secondPage, arguments: "anan");
              },
            ),
            RaisedButton(
              child: Text("Go To Third Page"),
              onPressed: () {
                Navigator.pushNamed(context, Router.thirdPage,
                    arguments: ThirdPageArguments(postModel: Post(nama: "anan", usia: 23)));
              },
            ),
          ],
        )),
      ),
    );
  }
}
