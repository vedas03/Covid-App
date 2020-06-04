import 'package:flutter/material.dart';
import 'package:covidextra/services/country.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map ddat;
  bool isloaded;
  List ttl=[];
    int ff=0;
  //List l=[{'name':'INDIA','flag':'in.png'},{'name':'CHINA','flag':'ch.jpg'},{'name':'USA','flag':'us.jpg'},{'name':'PAKISTAN','flag':'pa.png'},{'name':'GERMANY','flag':'ge.png'}];
  List l=[];
  List tl=[];
  List ll=[];
  void getdata(index)
  {
    Navigator.pushNamed(context, '/loading',arguments: {
      'country':l[index]['name'],
      'flag':l[index]['flag']
    });
  }


  void countrydata () async
  {
    Country cc=Country(country: 'fdsf',flag: 'fdsfds');
    await cc.getcountry();
    ll=cc.ll;
    for(var i=0;i<ll.length;i++)
      {
        tl.add({'name':ll[i],'flag':ll[i].substring(0,2).toString().toLowerCase()+'.png'});
      }
    setState(() {

      //print(ll);
      l=tl;
      ff=1;

    });



  }

@override
  void initState() {

    super.initState();
    print("hey");
    isloaded=false;
  }


  @override
  Widget build(BuildContext context) {

    if (!isloaded) {
      isloaded = true;
      //data=ModalRoute.of(context).settings.arguments;
     // print(data);
      ddat=ModalRoute.of(context).settings.arguments;
      print(ddat);
      countrydata();
    }



    if(ff==1) {
      return Scaffold(
        //backgroundColor: Colors.lightBlue[100],
          appBar: AppBar(
            title: Text("COVID STATUS"),
            backgroundColor: Colors.black,
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search..."
                  ),
                  onChanged: (text){
                    text=text.toLowerCase();
                    print(text);

                    ttl=ll.where((item){
                      var temp=item.toString().toLowerCase();
                      return temp.contains(text);
                    }).toList();
                    print(ttl);
                    tl=[];
                    setState(() {
                      for(var i=0;i<ttl.length;i++)
                      {
                        tl.add({'name':ttl[i],'flag':ttl[i].substring(0,2).toString().toLowerCase()+'.png'});
                      }
                      l=tl;


                    });
                  },
                ),
              ),

              Expanded(
                child: ListView.builder(
                    itemCount: l.length, itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                        onTap: () {
                          getdata(index);
                        },
                        title: Text(l[index]['name']),
                        leading: CircleAvatar(

                          backgroundImage: AssetImage("assets/${l[index]['flag']}"),
                        ),
                      )
                  );
                }),
              ),
            ],
          )

      );
    }
    else{
      return Center(
        child: SpinKitFadingCube  (
          color: Colors.white,
          size: 90.0,
        ),
      );
    }
  }
}
