import 'package:flutter/material.dart';
import 'package:covidextra/services/country.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



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
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  bool  isInitialized;
  Map data={};
  void foo () async
  {

    Country country=Country(country:data['country'],flag:data['flag']);
    await country.getdata();
    print(country.total_cases);
    print(country.today_cases);
    print(country.total_tests);
    print(country.total_deaths);
    Navigator.pushReplacementNamed(context,'/output',arguments: {
      'one':country.total_cases,
      'two':country.today_cases,
      'three':country.total_tests,
      'four':country.total_deaths,
      'img':country.flag
    });
  }
  @override
  void initState() {
    super.initState();
    isInitialized=false;

  }


  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      isInitialized = true;
      data=ModalRoute.of(context).settings.arguments;
      print(data);

      foo();
    }

    return Scaffold(

        appBar: AppBar(
          title: Text("Loading....."),
          backgroundColor: Colors.black,
        ),
        body:Center(
          child: SpinKitFadingCube  (
            color: Colors.black,
            size: 90.0,
          ),
        )


    );

  }
}
