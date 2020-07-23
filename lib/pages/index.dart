import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_demo/pages/Home.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

// ignore: camel_case_types, must_be_immutable
class index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 1000,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // title: Text('首页'),
        ),
        body: Container(
            width: 1000,
//          padding: _adapt.setfromLTRB(100, 0, 100, 0),
            child: Wrap(
              children: <Widget>[map(), map(), map(), map(), map()],
            )),
      ),
    );
//    return new Scaffold(
//        appBar: GradientAppBar(
//          title: Text(''),
//          gradient: LinearGradient(colors: [Colors.white54, Colors.green]),
//          actions: <Widget>[
//            new IconButton(
//              icon: Icon(Icons.home),
//              onPressed: pressHome(),
//            ),
//            new IconButton(
//              icon: Icon(Icons.email),
//              onPressed: pressHome(),
//            ),
//          ],
//        ),
//        body: Container(
//          decoration: BoxDecoration(color: Colors.green),
//          child: Wrap(
//            children: <Widget>[
//              map(),
//            ],
//          ),
//        )
////      drawer: indexDawer(),
//        );
  }

  map() {
    return GestureDetector(
      child: Container(
        decoration: new BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(image: new AssetImage("imgs/map.png"))),
        width: 75,
        height: 75,
        child: Text(""),
        alignment: Alignment.center,
      ),
      onTap: () => onTap("map"),
    );
  }

  onTap(param) {
    Navigator.of(Home.context).pushNamed(param);
  }

  pressHome() {}
}
