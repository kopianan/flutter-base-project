import 'package:auto_route/auto_route_annotations.dart';
import 'package:base_project/ui/pages/first_page.dart';
import 'package:base_project/ui/pages/second_page.dart';
import 'package:base_project/ui/pages/third_page.dart';

//flutter pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter()
class $Router {
  FirstPage firstPage;
  SecondPage secondPage;
  @CustomRoute(fullscreenDialog: true)
  ThirdPage thirdPage;
}
