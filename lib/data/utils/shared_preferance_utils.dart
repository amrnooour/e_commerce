import 'dart:convert';

import 'package:e_commerce/data/model/response/auth_response.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefUtils{
  void saveUser(User user) async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user.toJson()));
  }
  void saveToken(String token) async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }
  Future<User?> getUser()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
     String? userAsString = prefs.getString("user");
     if(userAsString == null)return null;
     return User.fromJson(jsonDecode(userAsString));
  }
  Future<String?> getToken() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}