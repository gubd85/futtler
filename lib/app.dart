import 'package:flutter/material.dart';
import 'app/login/pages/login_page.dart';

class AppConferencia extends StatelessWidget {
  const AppConferencia({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
