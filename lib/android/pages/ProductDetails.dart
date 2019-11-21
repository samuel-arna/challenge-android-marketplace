import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ProductDetails extends StatefulWidget {
  final int id;
  final String categoria;
  final String imagem;
  final String nome;
  final dynamic precoDe;
  final dynamic precoPor;
  final String descricao;

  ProductDetails({
    Key key,
    this.id,
    this.categoria,
    this.imagem,
    this.nome,
    this.precoDe,
    this.precoPor,
    this.descricao,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

formatMoney(valor) {
  return NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '',
  ).format(valor);
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(widget.categoria),
            pinned: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 9,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: 240,
                        child: Image(
                          image: NetworkImage(widget.imagem),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 45,
                    left: 30,
                    child: Icon(Icons.arrow_back),
                  )
                ],
              ),
            ),
            floating: true,
            primary: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 9),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      widget.nome,
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 0.6, color: Colors.grey),
                          bottom: BorderSide(width: 0.6, color: Colors.grey),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'De ${formatMoney(widget.precoDe)}',
                              style: TextStyle(
                                fontFamily: 'Roboto-Medium',
                                fontSize: 12,
                                color: Color.fromRGBO(170, 170, 170, 1),
                              ),
                            ),
                            Text(
                              'Por ${formatMoney(widget.precoPor)}',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(241, 80, 37, 1),
                              ),
                            ),
                          ],
                        ),
                      )),

                  Html(
                    data: widget.descricao,
                    padding: EdgeInsets.all(15),
                  ),

                  SizedBox(
                      height:
                          450), //apenas para visualizar melhor o efeito quando se tem uma descrição pequena
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 75.0,
        width: 75.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () async {
              try {
                var uriResponse = await http.post(
                  'https://alodjinha.herokuapp.com/produto/${widget.id.toString()}',
                );
                if (uriResponse.statusCode == 200) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // retorna um objeto do tipo Dialog
                      return AlertDialog(
                        content: new Padding(
                          padding: EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: Text(
                            "Produto reservado com sucesso",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          // define os botões na base do dialogo
                          new FlatButton(
                            child: new Text(
                              'OK',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // retorna um objeto do tipo Dialog
                      return AlertDialog(
                        title: new Text("Ops"),
                        content: new Text(
                          "Ocorreu um erro, por favor verifique sua conexão e tente novamente...",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                          ),
                        ),
                        actions: <Widget>[
                          // define os botões na base do dialogo
                          new FlatButton(
                            child: new Text("Fechar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              } finally {
                http.Client().close();
              }
            },
            child: Image(
              image: AssetImage('assets/images/check_button.png'),
            ),
          ),
        ),
      ),
    );
  }
}
