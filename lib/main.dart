import 'package:base_project/bloc/login_bloc/login_bloc_bloc.dart';
import 'package:base_project/bloc/post_bloc/post_bloc.dart';
import 'package:base_project/ui/page/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/page/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (BuildContext context) => PostBloc(),
        ),
        BlocProvider<LoginBlocBloc>(
          create: (BuildContext context) => LoginBlocBloc(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginPage()),
    );
  }
}
