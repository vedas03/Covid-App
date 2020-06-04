import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:covidextra/services/country.dart';
import 'package:google_fonts/google_fonts.dart';
import 'griddashboard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Dash extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Dash> {
  List<String> imgList = [
    'https://covid19.mathdro.id/api/og',
    'https://covid19.mathdro.id/api/og',
    'https://covid19.mathdro.id/api/og',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = imgList.map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                GestureDetector(
                    child: Image.network(item, fit: BoxFit.cover, width: 1000.0),

                    onTap: ()
                  {
                    Navigator.pushNamed(context, '/datas',arguments: {
                      'temp':item,
                    });
                  },
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(

                    decoration: BoxDecoration(

                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'No. ${imgList.indexOf(item)} image',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    )).toList();
//vedalama

    return Scaffold(
      backgroundColor: Color(0xff392850),
      appBar: AppBar(
        backgroundColor:Colors.black12,
        title: Text(
          "COVID-19 TRACKER",

        ),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.apps,
            size: 40,
            ),
            onPressed: ()
            {
              Navigator.pushNamed(context, '/datas');
            },
          )
        ],

      ),
      body: Column(
        children: <Widget>[


          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      "Covid-19 Status",
//                      style: GoogleFonts.openSans(
//                          textStyle: TextStyle(
//                              color: Colors.white,
//                              fontSize: 20,
//                              fontWeight: FontWeight.bold)),
//                    ),
//                    SizedBox(
//                      height: 4,
//                    ),
//                    Text(
//                      "by Veda Prakash",
//                      style: GoogleFonts.openSans(
//                          textStyle: TextStyle(
//                              color: Color(0xffa29aac),
//                              fontSize: 16,
//                              fontWeight: FontWeight.w600)),
//                    ),
//                  ],
//                ),
//                IconButton(
//                  alignment: Alignment.topCenter,
//                  icon: Icon(Icons.apps),
//                  iconSize: 40,
//
//                  color: Colors.white,
//
//                  onPressed: () {
//                    Navigator.pushNamed(context, '/datas');
//                  },
//                )
              ],
            ),
          ),
//          SizedBox(
//            height: 5,
//          ),
          Container(
              child: Column(children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(

                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imageSliders,

                ),
              ],)
          ),
          SizedBox(
            height: 15,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}

