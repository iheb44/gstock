import 'package:flutter/material.dart';


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
    return WillPopScope(
        onWillPop: ()
    async {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('The System Back Button is Deactivated')));
      return false;
    },
    child: Scaffold(
    appBar: AppBar(
      // automaticallyImplyLeading: false,
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
    ]
    )
    ),
      drawer: Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('componentsType'),
          onTap: () {
            Navigator.pushNamed(context, '/componentsType');
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ],
    ),
    )
    )
    );
  }
}
