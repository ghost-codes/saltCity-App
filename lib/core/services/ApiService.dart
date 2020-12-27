import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:saltcity_app/core/models/userModel.dart';

class Api {
  static const endpoint = "";

  var client = http.Client();

  Future<UserModel> signUp(Map<String, String> signUpCredentials) async {
    Response response =
        await client.post('$endpoint/user/signUp', body: signUpCredentials);
  }
}
