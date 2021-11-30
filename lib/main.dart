import 'package:flutter/material.dart';
import 'singup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sing-up',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.teal,
      ),
      home: singup(),
    );
  }
}
