//https://coronavirus-19-api.herokuapp.com/countries


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Country
{
  String country;
  String flag;
  String total_cases;
  String today_cases;
  String total_tests;
  String total_deaths;
  String ftotalc;
  String ftotalr;
  String ftotald;
  List ll=[];
  Country({this.country,this.flag});
  Future<void> getdata() async
  {
    Response response= await get('https://coronavirus-19-api.herokuapp.com/countries/$country')  ;
    Map data=jsonDecode(response.body);
    total_cases=data['cases'].toString();
    today_cases=data['todayCases'].toString();
    total_tests=data['totalTests'].toString();
    total_deaths=data['deaths'].toString();
  }
  Future<void> getall() async{
    Response fres=await get('https://coronavirus-19-api.herokuapp.com/all');
    Map fdata=jsonDecode(fres.body);
    ftotalc=fdata['cases'].toString();
    ftotald=fdata['deaths'].toString();
    ftotalr=fdata['recovered'].toString();
  }


  Future<void> getcountry() async{
   Response rcon=await get('https://coronavirus-19-api.herokuapp.com/countries');
    var data=jsonDecode(rcon.body);

    for(var i=1;i<data.length;i++)
      {
        ll.add(data[i]['country']);

      }
      print("hello");
    print(ll);

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