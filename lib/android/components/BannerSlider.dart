import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BannerSlider extends StatefulWidget {
  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _current = 0;
  Map _response;

  fetchBanners() async {
    var response = await http.get('https://alodjinha.herokuapp.com/banner');
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        _response = jsonResponse;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBanners();
  }

  @override
  Widget build(BuildContext context) {
    if (_response != null) {
      return Card(
        elevation: 9,
        margin: EdgeInsets.all(0.0),
        child: Stack(children: [
          CarouselSlider(
            viewportFraction: 1.0,
            items: _response["data"].map<Widget>((elemento) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new NetworkImage(elemento["urlImagem"]),
                          fit: BoxFit.cover),
                    ),
                  );
                },
              );
            }).toList(),
            autoPlay: true,
            aspectRatio: 3,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _response["data"].map<Widget>((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 9.0, horizontal: 6.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == _response["data"].indexOf(i)
                            ? Color.fromRGBO(255, 255, 255, 0.9)
                            : Color.fromRGBO(0, 0, 0, 0.1),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ]),
      );
    } else {
      return Container();
    }
  }
}
