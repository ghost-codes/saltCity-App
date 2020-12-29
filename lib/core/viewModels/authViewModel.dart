import 'package:flutter/material.dart';
import 'package:saltcity_app/core/enums.dart';
// import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:saltcity_app/core/models/userModel.dart';
import 'package:saltcity_app/core/services/AuthenticationService.dart';
import 'package:saltcity_app/core/viewModels/baseModel.dart';
import 'package:saltcity_app/locator.dart';

class AuthViewModel extends BaseModel {
  final formkey1 = new GlobalKey<FormState>();
  final formkey2 = new GlobalKey<FormState>();
  final loginFormKey = new GlobalKey<FormState>();
  AuthenticationService _authService = sl<AuthenticationService>();

  String loginErrorMessage = '';

  BuildContext context;
  UserModel userModel = UserModel();

  Map<String, String> loginModel = {};

  int _pageState = 0;
  int get pageState => _pageState;
  double _GetStartedOffset = 0;
  double get getStartedOffset => _GetStartedOffset;
  double _borderRadius = 20;

  double windowHeight;
  double windowWidth;

  double firstFormOffset = 0;
  double secondFormOffset = 0;

  double signUpHeight = 0;
  double loginHeight = 0;
  double signupWidth = 0;

  double signupOpacity = 1;
  double signupShift = 0;

  String nullValidate(var val) {
    if (val == null || val.isEmpty) {
      return 'Input Required';
    }
    return null;
  }

  void signupNext() {
    // setState(ViewState.Idle);
    final form = formkey1.currentState;

    // setState();
    if (form.validate()) {
      form.save();
      setPageState(3);
    }
    notifyListeners();
  }

  Future<void> login() async {
    final form = loginFormKey.currentState;
    // try {
    if (form.validate()) {
      form.save();
      setState(ViewState.Busy);
      bool isSuccessful = await _authService.login(loginModel);
      setState(ViewState.Idle);
      if (isSuccessful) {
        //Navigate to HomeView
        form.reset();
        print('HomeView');
        loginErrorMessage = '';
      } else {
        loginErrorMessage = 'Invalid Credentials';
        notifyListeners();
      }
    }
    // }
    // catch (err) {
    //   setState(ViewState.Idle);
    //   loginErrorMessage = 'Bad or No Internet';
    //   notifyListeners();
    // }
  }

  setPageState(int pageState) {
    _pageState = pageState;
    switch (pageState) {
      case 0:
        signupOpacity = 1;
        signUpHeight = 0;
        _GetStartedOffset = 0;
        loginHeight = 0;
        signupWidth = windowWidth;
        signupShift = 0;
        firstFormOffset = 0;
        break;
      case 1:
        signUpHeight = windowHeight * 0.30;
        signupOpacity = 1;
        signupWidth = windowWidth;
        loginHeight = windowHeight;
        _GetStartedOffset = windowHeight;
        signupShift = 0;
        firstFormOffset = 0;
        secondFormOffset = windowWidth;
        print("done");
        break;
      case 3:
        firstFormOffset = windowWidth;
        secondFormOffset = 0;
        signUpHeight = windowHeight * 0.30;
        break;
      case 2:
        signUpHeight = windowHeight * 0.25;
        loginHeight = windowHeight * 0.28;
        signupWidth = windowWidth - 40;
        _GetStartedOffset = windowHeight;
        signupOpacity = 0.7;
        signupShift = 20;
        break;
    }
    notifyListeners();
  }
}
