import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'DB/components.dart';
import 'DB/userdatabase.dart';

class insertc extends StatefulWidget {
  State<insertc> createState() => _insertc();
}

String type = "";
String name = "";
String date = "";
String quntity = "";
String inser = "";

class _insertc extends State<insertc> {
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    Future<List> ar() {
      return userDatabase.instance.getTrashlist();
    }

    String formattedDate = formatter.format(now);

    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.teal,
          title: Text("Login"),
        ),
        body: FutureBuilder(
          future: ar(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              List ls = snapshot.data!;
              List<String> ar = [];
              ls.forEach((element) {
                ar.add(element["type"].toString());
              });
              ar.map((e) => print(e)).toList();
              var at = ar;
              inser = ls[0]["type"].toString();
              //  print(arn);
              return Container(
                child: DropdownButton(
                  isExpanded: true,
                  value: inser,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: at.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      inser = newValue!;
                    });
                  },
                ),
              );
            }
            return Text("erro");
          },
        ));
  }
}
