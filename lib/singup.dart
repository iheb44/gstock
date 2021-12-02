import 'package:flutter/material.dart';
import 'DB/user.dart';
import 'DB/userdatabase.dart';

class singup extends StatefulWidget {
  @override
  State<singup> createState() => _singup();
}

class _singup extends State<singup> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";
  String phone = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sing Up"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
                onChanged: (String? value) {
                  setState(() {
                    _username = value.toString();
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "password"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "phone is required";
                  }
                  return null;
                },
                onChanged: (String? value) {
                  setState(() {
                    password = value.toString();
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "phone"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "password is required";
                  }
                  return null;
                },
                onChanged: (String? value) {
                  setState(() {
                    phone = value.toString();
                  });
                },
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Center(
                    child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          User a = new User(
                              username: _username,
                              password: password,
                              phone: phone);
                          userDatabase.instance.create(a);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Sumbimited")),
                          );
                        }
                      },
                      child: const Text('Sing-up'),
                    ),
                    Text("Got a Account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Login'))
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
