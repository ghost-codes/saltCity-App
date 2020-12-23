import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
          seconds: 3,
        ),
        () => Navigator.pushReplacementNamed(context, '/auth'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          //child: Center(child: Image.asset("assets/images/Group 65.png",
          //),
          //child: Image.asset("assets/images/Group 65.png"),
          color: Colors.white,
          //),
        ),
        Center(
          child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 100,
              //child: SvgPicture.asset(assetName),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fitHeight,
                ),
              )),
        )
      ]),
    );
  }
}
