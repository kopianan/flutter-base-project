// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_project/ui/pages/first_page.dart';
import 'package:base_project/ui/pages/second_page.dart';
import 'package:base_project/ui/pages/third_page.dart';
import 'package:base_project/models/post.dart';

class Router {
  static const firstPage = '/first-page';
  static const secondPage = '/second-page';
  static const thirdPage = '/third-page';
  static final navigator = ExtendedNavigator();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.firstPage:
        if (hasInvalidArgs<FirstPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<FirstPageArguments>(args);
        }
        final typedArgs = args as FirstPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => FirstPage(
              key: typedArgs.key, nama: typedArgs.nama, usia: typedArgs.usia),
          settings: settings,
        );
      case Router.secondPage:
        if (hasInvalidArgs<String>(args, isRequired: true)) {
          return misTypedArgsRoute<String>(args);
        }
        final typedArgs = args as String;
        return MaterialPageRoute<dynamic>(
          builder: (_) => SecondPage(nama: typedArgs),
          settings: settings,
        );
      case Router.thirdPage:
        if (hasInvalidArgs<ThirdPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<ThirdPageArguments>(args);
        }
        final typedArgs = args as ThirdPageArguments;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (ctx, animation, secondaryAnimation) =>
              ThirdPage(key: typedArgs.key, postModel: typedArgs.postModel),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//FirstPage arguments holder class
class FirstPageArguments {
  final Key key;
  final String nama;
  final int usia;
  FirstPageArguments({this.key, @required this.nama, this.usia});
}

//ThirdPage arguments holder class
class ThirdPageArguments {
  final Key key;
  final Post postModel;
  ThirdPageArguments({this.key, @required this.postModel});
}
