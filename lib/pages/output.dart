import 'package:flutter/material.dart';



class Output extends StatefulWidget {
  @override
  _OutputState createState() => _OutputState();
}

class _OutputState extends State<Output> {
  Map data;
  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Covid Status"),
        ),
        body:
        Padding(
            padding:EdgeInsets.fromLTRB(30, 40, 30, 0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child:CircleAvatar(
                    backgroundImage: AssetImage("assets/${data['img']}"),
                    radius: 40,

                  ),
                ),
                Divider(
                  height: 50,
                ),
                Text(
                  "Total no of cases",
                  style: TextStyle(
                    letterSpacing: 3,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  data['one'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    fontSize: 29,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Total no of cases TODAY",
                  style: TextStyle(
                    letterSpacing: 3,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  data['two'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                    fontSize: 29,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Total no of Tests",
                  style: TextStyle(
                    letterSpacing: 3,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  data['three'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    fontSize: 29,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height:30),
                Text(
                  "Total no of Deaths",
                  style: TextStyle(
                    letterSpacing: 3,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  data['four'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    fontSize: 29,
                    color: Colors.black,
                  ),
                ),
              ],
            )
        )
    );
  }
}


//
//country	"Pakistan"
//cases	61227
//todayCases	2076
//deaths	1260
//todayDeaths	35
//recovered	20231
//active	39736
//critical	111
//casesPerOneMillion	278
//deathsPerOneMillion	6
//totalTests	508086
//testsPerOneMillion	2305