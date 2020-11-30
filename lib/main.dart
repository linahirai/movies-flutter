import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';
import 'core/constants.dart';
import 'core/theme_app.dart';
import 'pages/movie_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kAppName,
        theme: kThemeApp,
        home: CustomSplash(
          imagePath: 'assets/images/icon.png',
          backGroundColor: Colors.red,
          animationEffect: 'zoom-in',
          logoSize: 200,
          home: MoviePage(),
          duration: 2500,
          type: CustomSplashType.StaticDuration,
        ));
  }
}
