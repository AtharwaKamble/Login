import 'package:flutter/material.dart';
import 'package:gram_samruddhi/Screens/SplashScreen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "User Login",
      home: SplashScreen(),
    );
  }
}
