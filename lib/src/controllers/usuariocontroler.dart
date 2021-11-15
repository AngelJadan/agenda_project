
import 'dart:developer';

import 'package:agenda_project/src/models/usuario.dart';

import '../../sql_database.dart';

class UsuarioController {
  UsuarioController();

  Future<int> saveUsuario(int id, String mail, String name, String password) async {
    
    Usuario usuario = Usuario(id, mail, name, password, DateTime.now().toString());
    return await SQLDataBase.saveUsuario(usuario);
  }
  
  Future<List<Map<String, dynamic>>> usuarios() async {
    return await SQLDataBase.listUsuarios();
  }
}