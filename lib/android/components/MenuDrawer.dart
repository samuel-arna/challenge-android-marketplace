import 'package:alodjinha_app/android/pages/About.dart';
import 'package:alodjinha_app/android/pages/Home.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: SafeArea(
              child: DrawerHeader(
                margin: EdgeInsets.only(
                  bottom: 0,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 21),
                      child: Align(
                        alignment: Alignment(-0.93, 1),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(241, 80, 37, 1),
                            shape: BoxShape.circle,
                          ),
                          height: 54,
                          width: 54,
                          child: Container(
                              child: Image(
                            image: AssetImage(
                              'assets/images/logo_menu.png',
                            ),
                          )),
                        ),
                      ),
                    ),
                    Container(
                      height: 54,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'a Lodjinha',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Pacifico',
                            color: Colors.white,
                            letterSpacing: -0.6,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/menu_pattern.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: -0.3,
              ),
            ),
            leading: Image(
              image: AssetImage('assets/images/home_menu.png'),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                  (route) => false);
            },
          ),
          ListTile(
            title: Text(
              'Sobre o aplicativo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: -0.3,
              ),
            ),
            leading: Image(
              image: AssetImage('assets/images/tag_menu.png'),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
