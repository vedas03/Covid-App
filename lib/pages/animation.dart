import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidextra/services/country.dart';
import 'package:google_fonts/google_fonts.dart';
import 'griddashboard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'package:covidextra/pages/home.dart';



class SecondPageRoute extends CupertinoPageRoute {
  SecondPageRoute()
      : super(builder: (BuildContext context) => new Home());


  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Container(child: new FadeTransition(opacity: animation, child: new Home()));
  }
}