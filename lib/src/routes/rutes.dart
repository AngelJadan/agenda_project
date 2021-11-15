import 'package:agenda_project/src/pages/admin.dart';
import 'package:agenda_project/src/pages/init_user.dart';
import 'package:agenda_project/src/pages/loggin_user.dart';
import 'package:agenda_project/src/pages/recover_password.dart';
import 'package:agenda_project/src/pages/register_user.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/'  : (BuildContext context) => Home(),
    'register': (BuildContext context) => RegisteUser(),
    'recover': (BuildContext context) => Recover_User(),
    'init_user': (BuildContext context) => InitUser(),
    'admin': (BuildContext context) => Admin(),
  };
}