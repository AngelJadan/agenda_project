import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitUser extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    String _title = "Incio";

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Iniciado"),
          ],
        ),
      ),
    );
  }
}