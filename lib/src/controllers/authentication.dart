class AutentificacionUser {
  final String user;
  final String password;

  const AutentificacionUser(
    this.user,
    this.password,
  );
  bool get_autentication() {
    print("Recibido: ${user} ${password}");

    if (user == "angel.jadan12@gmail.com" && password == "12345") {
      return true;
    } else {
      return false;
    }
  }
  String getUser(){
    return this.user;
  }
}
