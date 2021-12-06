import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'DB/components.dart';
import 'DB/userdatabase.dart';


class insertct extends StatefulWidget {
  State<insertct> createState() => _insertct();
}

String type = "";
String name = "";
String date = "";
String quntity = "";
class _insertct extends State<insertct> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.teal,
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            DropdownButton<String>(
            value: type,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                type = newValue!;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
              TextFormField(
                decoration: InputDecoration(labelText: "name"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "name is required";
                  }
                  return null;
                },
                onChanged: (String? value) {
                  setState(() {
                    name = value.toString();
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "quntity"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "quntity is required";
                  }
                  return null;
                },
                onChanged: (String? value) {
                  setState(() {
                    quntity = value.toString();
                  });
                },
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            components c = new components(type: type,name: name,date: formattedDate, quntity: quntity,) ;
                            userDatabase.instance.createComponents(c);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Sumbimited")),
                            );
                            Navigator.pushNamed(context, '/logged');
                          },
                          child: const Text('submit'),
                        ),
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
