import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(AlFaridApp());

class AlFaridApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'الفريد للعسل',
      theme: ThemeData(primaryColor: Color(0xFFD4A373)),
      home: HomeScreen(),
    );
  }
}