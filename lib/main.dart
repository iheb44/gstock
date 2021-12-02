import 'package:flutter/material.dart';
import 'package:gstock/login.dart';
import 'singup.dart';
import 'logged.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => login(),
        '/singup': (context) => singup(),
        '/logged': (context) => loged(),
      },
    ),
  );
}
