import 'package:alodjinha_app/android/components/ProductList.dart';
import 'package:flutter/material.dart';

class CategoryProduct extends StatefulWidget {
  final String categoria;
  final int id;

  CategoryProduct({
    Key key,
    this.categoria,
    this.id,
  }) : super(key: key);

  @override
  _CategoryProductState createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoria),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ProductList(categoria: widget.id),
        ),
      ),
    );
  }
}
