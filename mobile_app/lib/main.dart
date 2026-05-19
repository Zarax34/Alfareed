import 'package:flutter/material.dart';

void main() => runApp(AlFaridApp());

class AlFaridApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الفريد للعسل',
      theme: ThemeData(primaryColor: Color(0xFFD4A373)),
      home: Scaffold(body: Center(child: Text('الفريد للعسل'))),
    );
  }
}