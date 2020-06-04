import 'package:covidextra/pages/animation.dart';
import 'package:flutter/material.dart';
import 'package:covidextra/pages/dash.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:covidextra/pages/home.dart';
import 'package:covidextra/pages/loading.dart';
import 'package:covidextra/pages/output.dart';
void main() {
  runApp(MaterialApp(title: "helo world",
      initialRoute: '/',
//      routes:{
//        '/':(context)=>Dash(),
//        '/datas':(context)=>Home(),
//        '/loading':(context)=>Loading(),
//        //'/output':(context)=>Output(),
//
//      }


  onGenerateRoute: (RouteSettings settings){
    switch(settings.name)
    {
      case '/':return CupertinoPageRoute(
          builder: (_) => Dash(), settings: settings);
      case '/datas':return CupertinoPageRoute(
          builder: (_) => Home(), settings: settings);
      case '/loading':return PageTransition(
          type: PageTransitionType.rotate,
         child: Loading(),
          settings: settings);
      case '/output':return PageTransition(
        type:PageTransitionType.upToDown,
         child: Output(), settings: settings);

    }
  },

  ));
}
