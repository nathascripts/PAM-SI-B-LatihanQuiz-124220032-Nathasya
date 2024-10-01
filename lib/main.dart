import 'package:flutter/material.dart';
import './Pages/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Latihan Quiz",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Loginpage(),
    );
  }
}
