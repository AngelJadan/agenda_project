
import 'dart:developer';

class Usuario {
  int id;
  String mail;
  String name;
  String password;
  String createdAt;
  
  Usuario(this.id, this.mail, this.name, this.password, this.createdAt);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": mail,
      "name": name,
      "password": password,
      "createdAt": createdAt,
    };
  }

  String toString() {
    return 'Usuario{id:$id, name:$name, email:$mail, password:$password, createdAt:$createdAt}';
  }
}