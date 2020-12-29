import 'dart:async';
import 'dart:developer';

import 'package:saltcity_app/core/models/userModel.dart';
import 'package:saltcity_app/core/services/ApiService.dart';
import 'package:saltcity_app/locator.dart';

class AuthenticationService {
  Api _api = sl<Api>();

  StreamController<UserModel> userController = StreamController();

  Future<bool> login(Map userId) async {
    var fetchedUser = await _api.loginApi(userId);

    var hasUser = fetchedUser != null;

    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}
