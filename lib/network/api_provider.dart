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
}
