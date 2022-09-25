import 'package:flutter/material.dart';
import 'package:tokyo_2020/pages/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOKYO 2020',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  Home(),
    );
  }
}

