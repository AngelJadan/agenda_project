import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agenda_project/sql_database.dart';

class Admin extends StatelessWidget {

  SQLDataBase db = SQLDataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Administrativo"),
      ),
      body: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget( {Key? key }) : super(key: key);

  Widget build(BuildContext context) {
    return OutlinedButton(

      onPressed: (){
        print("gen db");
      },
      child: const Text('Generar base de datos'),
    );
  }
}