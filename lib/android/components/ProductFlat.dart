import 'package:alodjinha_app/android/pages/ProductDetails.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductFlat extends StatefulWidget {
  final int id;
  final String imagem;
  final String nome;
  final String categoria;
  final dynamic precoDe;
  final dynamic precoPor;
  final String descricao;

  const ProductFlat({
    Key key,
    this.id,
    this.imagem,
    this.nome,
    this.categoria,
    this.precoDe,
    this.precoPor,
    this.descricao,
  }) : super(key: key);

  @override
  _ProductFlatState createState() => _ProductFlatState();
}

class _ProductFlatState extends State<ProductFlat> {
  formatMoney(valor) {
    return NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
    ).format(valor);
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              id: widget.id,
              categoria: widget.categoria,
              imagem: widget.imagem,
              nome: widget.nome,
              precoDe: widget.precoDe,
              precoPor: widget.precoPor,
              descricao: widget.descricao,
            ),
          ),
        );
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.6, color: Colors.grey),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: Colors.white),
                child: Image(
                  image: NetworkImage(widget.imagem),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.nome,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Text(
                            'De ${formatMoney(widget.precoDe)}',
                            style: TextStyle(
                              fontFamily: 'Roboto-Medium',
                              fontSize: 12,
                              color: Color.fromRGBO(170, 170, 170, 1),
                            ),
                          ),
                        ],
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
                ],
              ),
            ),
            Container(
              width: 30,
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/disclosure_indicator.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
