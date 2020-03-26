import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio = Dio();

  Future<String> loginUser() async {
    Response response;
    try {
      response = await dio.post("https://jsonplaceholder.typicode.com/users");
      return response.toString();
    } catch (ex) {
      throw (ex.toString());
    }
  }
}
