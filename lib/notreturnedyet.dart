import 'package:flutter/material.dart';
import 'package:gstock/DB/components.dart';
import 'DB/userdatabase.dart';

class notReturned extends StatefulWidget {
  int? id_user;
  notReturned(this.id_user);
  @override
  _notReturnedState createState() => _notReturnedState();
}

class _notReturnedState extends State<notReturned> {
  @override
  Widget build(BuildContext context) {
    Future<List> ar() {
      return userDatabase.instance.notturned();
    }

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        //backgroundColor: Colors.teal,
        title: Text(" Not return components"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          FutureBuilder(
            future: ar(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                List ls = snapshot.data!;
                List ar = [];
                ls.forEach((element) {
                  ar.add(element);
                });

                return ListView.builder(
                    itemCount: ar.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                            'User :  ${ar[index]["firstName"]} --- Product : ${ar[index]["name"]} \n Quant:${ar[index]["quntity"]} --- phone :  ${ar[index]["phone"]}'),
                      );

                      return Container();
                    });
              }
              return Text("erro");
            },
          ),
        ]),
      ),
    );
  }
}
