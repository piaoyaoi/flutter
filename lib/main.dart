import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:github_demo/pages/Home.dart';
import 'package:github_demo/pages/ShowMapScreen.dart';
import 'package:login_systems/login_systems.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(),
      home: LoginSystem01(
          onSignInButtonPressed: onSignInButtonPressed,
          onSubmitPressed: onSubmitPressed,
          onLinkPressed: onLinkPressed,
          signInButtonLabel: Text('登陆'),
          submitButtonLabel: Text("注册"),
          linkLabel: Text("忘记密码？"),
          signInHeaderText: Text(""),
          signUpHeaderText: Text(""),
          signInTabText: Text("登陆"),
          signUpTabText: Text("注册")),
      navigatorObservers: [],
      routes: {
        "home": (context) => Home(),
        "map": (context) => ShowMapScreen()
      },
    );
  }

  onSignInButtonPressed(String email, String password) {
    Map<String, String> queryParameters = new HashMap();
    queryParameters["username"] = email;
    queryParameters["password"] = password;
    Navigator.pushNamed(LoginSystem01.context, "home");
//    HttpUtils.postForJson(
//            "http://192.168.21.227:20201/hlworkapi/hlapi/sysUserLogin/sysUserLogin",
//            body: JsonUtil.encodeObj(queryParameters),
//            headers: headers)
//        .then((value) => LogUtil.e(value))
//        .catchError((err) => print(err));
  }

  dynamic onSubmitPressed(
      String firstName, String lastName, String email, String password) {}

  onLinkPressed() {}

  emailValidator(String s) {
    if (s.contains(".com")) {}
  }

  passwordValidator(String s) {}

  void LoginSuccess(data) {
    print(data);
  }
}
