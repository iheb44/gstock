import 'package:flutter/material.dart';
import 'package:gstock/DB/components.dart';
import 'DB/userdatabase.dart';

class returnorder extends StatefulWidget {
  int? id_user;
  returnorder(this.id_user);
  @override
  State<returnorder> createState() => _returnorder();
}

class _returnorder extends State<returnorder> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";
  String phone = "";
  String password = "";
  int inser = 1;

  @override
  Widget build(BuildContext context) {
    Future<List> ar() {
      return userDatabase.instance.getOwnOrder(widget.id_user);
    }

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        //backgroundColor: Colors.teal,
        title: Text("return components"),
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
                        trailing: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () async {
                            int? a = ar[index]['_id'];
                            int? idc = ar[index]['idC'];

                            components pullcomp =
                                await userDatabase.instance.getcompbyid(idc);
                            int newqu = int.parse(pullcomp.quntity) +
                                int.parse(ar[index]["quntity"]);
                            components updatedcomp = new components(
                                id: pullcomp.id,
                                id_com: pullcomp.id_com,
                                name: pullcomp.name,
                                date: pullcomp.date,
                                quntity: newqu.toString());
                            await userDatabase.instance.updatecomp(updatedcomp);
                            await userDatabase.instance.deleteOrder(a);
                            passlogininfo pinf =
                                new passlogininfo(widget.id_user);
                            Navigator.pushNamed(
                              context,
                              '/logged',
                              arguments: pinf,
                            );
                            setState(() {});
                          },
                          child: Text('delete'),
                        ),
                        title: Text(
                            'name :  ${ar[index]["name"]} --- ${ar[index]["quntity"]}'),
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
