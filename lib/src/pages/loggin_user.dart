import 'package:agenda_project/src/controllers/authentication.dart';
import 'package:agenda_project/src/pages/admin.dart';
import 'package:agenda_project/src/pages/recover_password.dart';
import 'package:agenda_project/src/pages/register_user.dart';
import 'package:agenda_project/src/services/services.dart';
import 'package:flutter/material.dart';

import 'init_user.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String _title = "Login";

  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
          SizedBox(
            height: 100,
            width: 100,
            child: Text(""),
          ),
          SizedBox(
              width: 350,
              child: TextFormField(
                controller: user,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un correo valido';
                  }
                  return null;
                },
              )),
          SizedBox(
              width: 350,
              child: TextFormField(
                  controller: pass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.security),
                    labelText: "Password",
                    hintText: "Contraseña",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Ingrese una contraseña";
                    }
                    return null;
                  })),
          Container(
            height: 60,
            width: 300,
            margin: const EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(50)),
            child: TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print('validado');
                  //GetConsumer getcons = GetConsumer();
                  //getcons.getPetition();

                  if (user.text == "Admin" && pass.text == "Admin2019.") {
                    Route admin =
                        MaterialPageRoute(builder: (context) => Admin());
                    Navigator.push(context, admin);
                  } else {
                    AutentificacionUser authorization =
                        AutentificacionUser(user.text, pass.text);
                    var res = authorization.get_autentication();
                    if (res) {
                      print("Acceso consedido");
                      print("Usuario logeado ${authorization.getUser()}");
                      //Route ini = MaterialPageRoute(builder: (context) => InitUser());
                      //Navigator.pop(context,ini);
                    } else {
                      print("Acceso denegado");
                    }
                  }
                }
              },
              child: const Text("Ingresar",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          Container(
              height: 50,
              width: 250,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  print("Registrando");
                  // ignore: prefer_const_constructors
                  Route register =
                      MaterialPageRoute(builder: (context) => RegisteUser());
                  Navigator.push(context, register);
                },
                child: const Text("Registrarse",
                    style: TextStyle(color: Colors.orange, fontSize: 15)),
              )),
          Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: TextButton(
                  onPressed: () {
                    print("Recuperando");
                    Route recover =
                        MaterialPageRoute(builder: (context) => Recover_User());
                    Navigator.push(context, recover);
                  },
                  child: const Text(
                    "¿No recuerda su contraseña?",
                    style: TextStyle(color: Colors.black26, fontSize: 10),
                  )))
        ]));
  }
}
