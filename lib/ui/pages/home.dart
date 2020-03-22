import 'package:base_project/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<List<User>> futureUser = null;

  Future<List<User>> getDataFromApi() async {
    Dio dio = Dio();
    Response response = await dio.get("https://jsonplaceholder.typicode.com/users");
    List responseData = response.data;
    List<User> userData = responseData.map((f) => User.fromJson(f)).toList();
    return userData;
  }

  @override
  void initState() {
    futureUser = getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index].address.geo.lat.toString()),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
