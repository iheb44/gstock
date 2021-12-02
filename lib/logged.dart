import 'package:flutter/material.dart';
import 'DB/user.dart';
import 'DB/userdatabase.dart';

class loged extends StatefulWidget {
  @override
  State<loged> createState() => _loged();
}

class _loged extends State<loged> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";
  String phone = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.teal,
          title: Text("logged"),
        ),
        body: Center(
            child: Column(children: [
          Text("you are logged in"),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text("logout"))
        ])));
  }
}
