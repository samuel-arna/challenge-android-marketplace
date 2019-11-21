import 'package:alodjinha_app/android/components/ProductFlat.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductList extends StatefulWidget {
  final String endPoint;
  final int categoria;

  ProductList({Key key, this.endPoint, this.categoria}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int page = 1;
  int teste = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String endPoint = widget.endPoint != null ? widget.endPoint : '';

    return FutureBuilder(
      future: http.get('https://alodjinha.herokuapp.com/produto/$endPoint'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<Widget> list = new List<Widget>();
          List<Widget> listFiltered = new List<Widget>();

          var resBody = json.decode(snapshot.data.body);
          resBody["data"].forEach((elemento) {
            if (widget.categoria != null &&
                widget.categoria == elemento["categoria"]["id"]) {
              listFiltered.add(
                new ProductFlat(
                  id: elemento["id"],
                  imagem: elemento["urlImagem"],
                  nome: elemento["nome"],
                  categoria: elemento["categoria"]["descricao"],
                  precoDe: elemento["precoDe"],
                  precoPor: elemento["precoPor"],
                  descricao: elemento["descricao"],
                ),
              );
            } else {
              list.add(
                new ProductFlat(
                  id: elemento["id"],
                  imagem: elemento["urlImagem"],
                  nome: elemento["nome"],
                  categoria: elemento["categoria"]["descricao"],
                  precoDe: elemento["precoDe"],
                  precoPor: elemento["precoPor"],
                  descricao: elemento["descricao"],
                ),
              );
            }
          });
          var tamanho = listFiltered.length;
          var limiteporpagina = 20;
          var tamanhoatual = (page * limiteporpagina);
          var newList;
          if ((page * limiteporpagina) < tamanho) {
            newList = listFiltered.sublist(0, tamanhoatual);
          } else {
            newList = listFiltered.sublist(0, tamanho);
          }

          //falta executar a ação do ScrollController para incrementar o estado da page e quando atingir o tamanho maximo desabilitar a ação junto do loader

          return new Column(
              children: widget.categoria != null ? newList : list);
        } else {
          return Padding(
            padding: EdgeInsets.all(15),
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
