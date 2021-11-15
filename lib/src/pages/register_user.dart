import 'dart:developer';

import 'package:agenda_project/sql_database.dart';
import 'package:agenda_project/src/controllers/usuariocontroler.dart';
import 'package:agenda_project/src/models/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisteUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: FormularyState(),
    );
  }
}

class FormularyState extends StatefulWidget {
  @override
  FormularyStateForm createState() {
    return FormularyStateForm();
  }
}

class FormularyStateForm extends State<FormularyState> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passw = TextEditingController();
  TextEditingController repas = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: 370,
                child: TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Nombre',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese un nombre valido';
                    }
                    return null;
                  },
                )),
            SizedBox(
                width: 370,
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail),
                    hintText: 'Correo',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Ingrese un correo";
                    }
                    return null;
                  },
                )),
            SizedBox(
                width: 370,
                child: TextFormField(
                  obscureText: true,
                  controller: passw,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.security),
                    labelText: "Contraseña",
                    hintText: 'Contraseña',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese una contraseña';
                    }
                    return null;
                  },
                )),
            SizedBox(
                width: 370,
                child: TextFormField(
                  obscureText: true,
                  controller: repas,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.security),
                    labelText: "Repetir contraseña",
                    hintText: 'Repetir contraseña',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Repita la contraseña.';
                    } else {
                      if (value != passw.text) {
                        return 'Las contraseñas no coinciden.';
                      }
                    }
                    return null;
                  },
                )),
            Container(
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('validado');
                        print('Nombre ${name.text}');
                        print('Correo ${email.text}');
                        if (passw.text != repas.text) {
                          print("Las contraseñas no coinciden");
                          showDialog("Error", "Las contraseñas no coinciden");
                        } else {
                          Future<int> resp = registerUser(
                              0, email.text, name.text, passw.text);
                          print("Guardado $resp");
                          List<Map<String, dynamic>> dats = [];
                          final listuser = SQLDataBase.listUsuarios();
                          print("Datos $listuser");
                        }
                      }
                    },
                    child: const Text(
                      "Registrar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
          ],
        ));
  }

  showDialog(String titl, String sms) {
    AlertDialog alert = AlertDialog(
      title: Text(titl),
      content: Text(sms),
    );
    context:
    context;
    builder:
    (BuildContext context) {
      return alert;
    };
  }

  Future<int> registerUser(
      int id, String mail, String name, String password) async {
    UsuarioController usucon = UsuarioController();

    int resp = await usucon.saveUsuario(id, mail, name, password);
    return resp;
  }
}
