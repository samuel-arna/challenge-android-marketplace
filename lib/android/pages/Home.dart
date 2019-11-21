import 'package:alodjinha_app/android/components/BannerSlider.dart';
import 'package:alodjinha_app/android/components/CategoriesSection.dart';
import 'package:alodjinha_app/android/components/MenuDrawer.dart';
import 'package:alodjinha_app/android/components/ProductList.dart';
import 'package:alodjinha_app/android/components/SectionTitle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        title: Row(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/logo_navbar.png'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'a Lodjinha',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 24,
                letterSpacing: -0.6,
              ),
            ),
          ],
        ),
      ),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BannerSlider(),
            SectionTitle(
              title: 'Categorias',
            ),
            CategoriesSection(),
            SectionTitle(
              title: 'Mais Vendidos',
            ),
            ProductList(endPoint: 'maisvendidos')
          ],
        ),
      ),
    );
  }
}
