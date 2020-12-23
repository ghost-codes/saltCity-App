import 'package:flutter/material.dart';
import 'package:saltcity_app/locator.dart';
import 'package:saltcity_app/views/views.dart';

void main() {
  runApp(MyApp());
  setupLocator();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Salt City App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splash',
        routes: {
          '/': (context) => HomeView(),
          '/splash': (context) => SplashView(),
          '/auth': (context) => AuthView(),
        });
  }
}
