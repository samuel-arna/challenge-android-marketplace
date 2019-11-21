import 'package:alodjinha_app/android/components/MenuDrawer.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sobre'),
      ),
      drawer: MenuDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Image(
                image: AssetImage('assets/images/logo_sobre.png'),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'a Lodjinha',
                style: TextStyle(
                  fontSize: 64,
                  fontFamily: 'Pacifico',
                  letterSpacing: -1.5,
                  color: Color.fromRGBO(74, 74, 74, 1),
                ),
              ),
              SizedBox(
                height: 180,
              ),
              Text(
                'Samuel Arná',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto-Medium',
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                '15 de fevereiro de 2020',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Roboto-Light',
                  letterSpacing: -0.3,
                ),
              ),
            ]),
      ),
    );
  }
}
