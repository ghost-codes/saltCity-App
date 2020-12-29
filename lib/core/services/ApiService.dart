import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:saltcity_app/core/models/userModel.dart';

class Api {
  static const endpoint = "https://api.vendoorr.com/api/v1";

  var client = http.Client();

  Future<UserModel> signUp(Map<String, String> signUpCredentials) async {
    Response response =
        await client.post('$endpoint/user/signUp', body: signUpCredentials);
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    }
  }

  Future<UserModel> loginApi(Map<String, String> loginCredentials) async {
    Response response =
        await client.post('$endpoint/login/', body: loginCredentials);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
