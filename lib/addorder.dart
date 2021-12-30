import 'package:flutter/material.dart';

class addorder extends StatefulWidget {
  int? id_user;
  int? id_prod;
  addorder(this.id_user, this.id_prod);
  State<addorder> createState() => _addorder();
}

class _addorder extends State<addorder> {
  DateTime _dateTime = DateTime.now();
  String quntity = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.teal,
        title: Text("borrow"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText:
                      " id product ${widget.id_prod} id user = ${widget.id_user}"),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "quntity is required";
                }
                return null;
              },
              onChanged: (String value) {
                setState(() {
                  quntity = value;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(_dateTime == null
                  ? 'Nothing has been picked yet'
                  : _dateTime.toString()),
            ),
            RaisedButton(
              child: Text('Pick return date'),
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate:
                            _dateTime == null ? DateTime.now() : _dateTime,
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2023))
                    .then((date) {
                  setState(() {
                    _dateTime = date!;
                  });
                });
              },
            ),
            ElevatedButton(
              onPressed: () async {},
              child: const Text('submit'),
            ),
          ],
        ),
      ),
    );
  }
}
