import 'package:base_project/network/api_provider.dart';

class ApiRepository{

  
  ApiProvider apiProvider = ApiProvider() ; 

  Future<String> get loginAsync => apiProvider.loginUser(); 

}