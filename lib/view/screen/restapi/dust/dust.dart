import 'dart:async';
import 'package:dambi/view/screen/restapi/dust/dustinfo.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Dust extends StatefulWidget{
  final Future<DustInfo> dustInfo;
  String timedetail;
  String region;
  @override
  State<StatefulWidget> createState() => DustScreenState();

  Dust({
    Key key,
    this.region,
    this.timedetail,
    this.dustInfo
  }) : super(key: key);
}
class DustScreenState extends State<Dust> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<DustInfo>(
          future: getDust(widget.region, widget.timedetail), //sets the getQuote method as the expected Future
          builder: (context, snapshot) {
            if (snapshot.hasData) { //checks if the response returns valid data
              return Center(
                child: Column(
                  children: <Widget>[
                    _buildDustIfoItem(snapshot.data.pm2, snapshot.data.pm10),
                  ],
                ),
              );
            } else if (snapshot.hasError) { //checks if the response throws an error
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();},
        )
    );
  }
  Future<DustInfo> getDust(String region, String timedetail) async {

    String uri = 'http://kumoh42teamcontest.p-e.kr/dust';

    final response =
    await http.post(uri,
        body:{"region": "$region", "time": "$timedetail"},
        headers: {'Accept': 'application/json'}
    );

    print(response.body);

    if (response.statusCode == 200) {

      return DustInfo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  _buildDustIfoItem(String pm2, String pm10){
    String standard = "";
    if(int.tryParse(pm2) <= 15){
       standard = "좋음";
    }
    else if(int.tryParse(pm2) > 15 &&  int.tryParse(pm2) <= 50){
      standard = "보통";
    }
    else if(int.tryParse(pm2) > 50 &&  int.tryParse(pm2) <= 100){
      standard = "나쁨";
    }
    else{
      standard = "매우나쁨";
    }
    double screen_width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: screen_width/30.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(0xfffff2cc), border: Border.all(color: Color(0xfff4b183), width: 3), ),
        padding: EdgeInsets.only(top: screen_width/25.0, left: screen_width/15.0, right: screen_width/15.0, bottom: screen_width/25.0),
      child: Column(
        children: <Widget>[
          //SizedBox(height: 5.0,),
          Text("DUST",style: TextStyle(fontSize: screen_width/25.0),),
          Padding(
            padding:EdgeInsets.all(10),
            child:_buildDustIcon(standard),
          ),
          Column(
              children: <Widget>[
                Text("${standard}", style: TextStyle(fontSize: screen_width/25.0),),
                Text("$pm2 PM(2.5)", style: TextStyle(fontSize: screen_width/25.0)),
                Text("$pm10 PM(10)", style: TextStyle(fontSize: screen_width/25.0))
              ]
          )
        ],
      ),
      ),
    );
  }

  _buildDustIcon(String temp){
    switch(temp){
      case '매우나쁨':
        return Tab(icon: Image.asset('assets/very_bad.png'));
      case '나쁨':
        return Tab(icon: Image.asset('assets/bad.png'));
      case '보통':
        return Tab(icon: Image.asset('assets/soso.png'));
      case '좋음':
        return Tab(icon: Image.asset('assets/good.png'));
    }
  }
}