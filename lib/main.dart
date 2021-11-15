import 'package:agenda_project/src/routes/rutes.dart';
import 'package:flutter/material.dart';

import 'package:agenda_project/src/pages/loggin_user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //home: Home(),
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings){
        print('Ruta ${settings.name}');

        return MaterialPageRoute(
          builder: (BuildContext context)=> Home(),
        );
      },
    );
  }
}