import 'package:covidextra/services/country.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class GridDashboard extends StatefulWidget {



  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  int ttt=0;
    Items item1,item2,item3,item4,item5,item6;

  void sett() async{

    Country ccc=Country(country: 'fsdds',flag: 'fsdfsd');
    await ccc.getall();
    setState(() {

      RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
      Function mathFunc = (Match match) => '${match[1]},';
   item1 = new Items(

      title: "Total Cases",
      subtitle: "Updated recently",
      event:  (ccc.ftotalc).replaceAllMapped(reg, mathFunc),
      img: "assets/calendar.png");

  item2 = new Items(
    title: "Total Deaths",
    subtitle: "Updated recently",
    event: (ccc.ftotald).replaceAllMapped(reg, mathFunc),
    img: "assets/food.png",
  );

   item3 = new Items(
    title: "Total Recovered",
    subtitle: "Updated recently",
    event: (ccc.ftotalr).replaceAllMapped(reg, mathFunc),
    img: "assets/map.png",
  );

   item4 = new Items(
    title: "Recovery Precentage",
    subtitle: "Latest",
    event: ((int.parse(ccc.ftotalr)/int.parse(ccc.ftotalc))*100).toString().substring(0,5),
    img: "assets/festival.png",
  );

  item5 = new Items(
    title: "Death Percentage",
    subtitle: "Latest",
    event: ((int.parse(ccc.ftotald)/int.parse(ccc.ftotalc))*100).toString().substring(0,5),
    img: "assets/todo.png",
  );

  item6 = new Items(
    title: "Total Active Cases",
    subtitle: "Updated Recently",
    event: ((int.parse(ccc.ftotalc)-int.parse(ccc.ftotalr)).toString()).replaceAllMapped(reg, mathFunc),
    img: "assets/setting.png",
  );
  ttt=1;
    });
  }


  @override
  Widget build(BuildContext context) {
    sett();


    List<Items> myList = [item1, item2, item3, item6, item4, item5];
    var color = 0xff453658;
    if(ttt==0)
      return Center(
        child: SpinKitFadingCube  (
          color: Colors.white,
          size: 90.0,
        ),
      );
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,

          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Flexible(
                    child: Container(
                      child: Text(

                        data.title,
                        overflow: TextOverflow.visible,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Text(
                      data.subtitle,
                      
                      style: GoogleFonts.openSans(

                          textStyle: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,

                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      data.event,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}
