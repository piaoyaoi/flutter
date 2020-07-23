import 'package:flutter/material.dart';
import 'package:github_demo/pages/index.dart';

class Home extends StatefulWidget {
  static BuildContext context;
  @override
  main createState() => main();
}

class main extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Home.context = context;
    return new MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      title: "首页",
      home: index(),
    );
  }
}
