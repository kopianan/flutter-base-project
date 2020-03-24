import 'package:base_project/data_class/user_data_class.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<UserDataClass>> futureUser = null;

  Future<List<UserDataClass>> getDataFromApi() async {
    Dio dio = Dio();
    Response response = await dio.get("https://jsonplaceholder.typicode.com/users");
    print(response.data.toString()) ; 
    List responseData = response.data;
    List<UserDataClass> userData = responseData.map((f) => UserDataClass.fromMap(f)).toList();

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
      body: FutureBuilder<List<UserDataClass>>(
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
