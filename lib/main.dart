import 'package:flutter/material.dart';
import 'package:quiz_app/screens/intro_screen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      durationInSeconds: 3,
      navigator: IntroScreen(),
      logo: Image.asset(
        'assets/images/devSoc.png',
      ),
      title: Text(
        'Developers\' Society',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      loadingText: Text("Loading"),
      //photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}
