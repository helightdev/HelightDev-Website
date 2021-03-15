import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'work.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Christoph Feuerer',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: {
        "home": (_) => LoadingHome(),
        "about": (_) => LoadingWork(),
      },
      initialRoute: "home",
    );
  }
}