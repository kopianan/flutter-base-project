import 'package:base_project/model/login_model.dart';
import 'package:base_project/model/post.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio = Dio();
  Response response;

  Future<List<Post>> getListPost() async {
    try {
      response = await dio.get("https://jsonplaceholder.typicode.com/posts");
      List listResponse = response.data;
      List<Post> listPost = listResponse.map((f) => Post.fromJson(f)).toList();
      return listPost;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<LoginModel> login(LoginModel loginData) async {
    try {
      response = await dio.post("http://5e773559e3fd85001601f6eb.mockapi.io/login", data: loginData.toJson());
      var listResponse = response.data;
      LoginModel listPost = LoginModel.fromJson(listResponse);
      print(listPost.toJson().toString()); 
      return listPost;
    } on DioError catch (e) {
      print(e.toString()); 
      if (e.type == DioErrorType.RESPONSE) {
        int statusCode = e.response.statusCode;
        if (statusCode == 404) {
          throw Exception("Data tidak ditemukan");
        }
        throw Exception(e.error.message.toString());
      }
      throw Exception(e.error.toString());
    }
  }
}
