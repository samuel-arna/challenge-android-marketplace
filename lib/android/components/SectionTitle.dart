import 'package:flutter/material.dart';

class SectionTitle extends StatefulWidget {
  final String title;
  const SectionTitle({Key key, this.title}) : super(key: key);

  @override
  _SectionTitleState createState() => _SectionTitleState();
}

class _SectionTitleState extends State<SectionTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(45, 49, 66, 1),
            ),
          ),
        ),
      ],
    );
  }
}
