import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:saltcity_app/core/viewModels/authViewModel.dart';
import 'package:saltcity_app/views/baseView.dart';
import 'package:saltcity_app/views/widgets/authSreenWidgets.dart';

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      onModelReady: (model) {
        model.windowHeight = MediaQuery.of(context).size.height;
        model.windowWidth = MediaQuery.of(context).size.width;
      },
      builder: (context, model, child) {
        return Scaffold(
          body: Stack(
            children: [
              LocalCarousel(model),
              InputFields(model),
              WelcomeScreen(model),
            ],
          ),
        );
      },
    );
  }
}
