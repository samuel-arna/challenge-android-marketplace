import 'package:flutter/material.dart';
import 'pages/Home.dart';

class AndroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "a Lodjinha",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(94, 42, 132, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
