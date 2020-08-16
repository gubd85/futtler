import 'package:app_conferencia/app/login/loginService/login_service.dart';
import 'package:app_conferencia/constants/constant_color.dart';
import 'package:app_conferencia/constants/constant_image.dart';
import 'package:app_conferencia/constants/constant_strings.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  IconData _passWordIcon = Icons.visibility_off;
  final formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  LoginService loginService;
  Future<dynamic> loginFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginService = LoginService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          headerSection(),
          Container(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    ConstantStrings.welcome,
                    style: TextStyle(fontSize: 28.0, fontFamily: 'Lato'),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                    child: TextFormField(
                      controller: userController,
                      decoration: const InputDecoration(
                        labelText: ConstantStrings.user,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(ConstantColor.atlantis),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(ConstantColor.atlantis),
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(ConstantColor.atlantis),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: ConstantStrings.password,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(ConstantColor.atlantis),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(ConstantColor.atlantis),
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(ConstantColor.atlantis),
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passWordIcon,
                            color: Color(ConstantColor.eclipse),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                              _passWordIcon = _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4.2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  loginFuture = loginService.login();
                  print('button pressed');
                },
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  height: 57.9,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(ConstantColor.pear),
                        Color(ConstantColor.atlantis2)
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      ConstantStrings.login.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Lato'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: FutureBuilder(
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return Container(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Center(
                          child: Column(
                            children: [
                              Icon(Icons.error_outline,
                                  color: Colors.red, size: 60),
                              Text('${snapshot.error}'),
                            ],
                          ),
                        );
                      } else {
                        if (snapshot.hasData) {
                          //TODO CREATE A ROUTER
                          print('Funfouuu' + snapshot.data);
                        }
                      }
                      break;
                  }
                  return Container();
                },
                future: this.loginFuture),
          )
        ],
      ),
    );
  }
}

Stack headerSection() {
  return Stack(
    overflow: Overflow.visible,
    children: [
      Container(
        height: 250,
        child: Image.asset(
          ConstantImage.loginTopBar,
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Image.asset(
            ConstantImage.logoCapela,
            height: 204,
            width: 173,
          ),
        ),
      ),
    ],
  );
}
