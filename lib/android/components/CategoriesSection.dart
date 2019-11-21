import 'dart:convert';

import 'package:alodjinha_app/android/pages/CategoryProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriesSection extends StatefulWidget {
  @override
  _CategoriesSectionState createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.6, color: Colors.grey),
          bottom: BorderSide(width: 0.6, color: Colors.grey),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: http.get('https://alodjinha.herokuapp.com/categoria'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Widget> list = new List<Widget>();
            var resBody = json.decode(snapshot.data.body);
            resBody["data"].forEach((elemento) {
              list.add(new Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryProduct(
                            categoria: elemento["descricao"],
                            id: elemento["id"]),
                      ),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: 60,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new NetworkImage(elemento["urlImagem"]),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 9),
                      Text(
                        elemento["descricao"],
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ));
            });
            return new SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: list,
              ),
            );
          } else {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
