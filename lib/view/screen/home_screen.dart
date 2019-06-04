import 'package:dambi/view/screen/restapi/weather/weather.dart';
import 'package:dambi/view/screen/restapi/dust/dust.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomeScreen extends StatefulWidget{
  String region;
  @override
  State<StatefulWidget> createState() => HomeScreenState();

  HomeScreen({
    this.region
  });
}

class HomeScreenState extends State<HomeScreen>{

  int rideTimesInThisWeek = 7;
  int totalPoint = 1050;
  @override
  Widget build(BuildContext context) {
    return _builBody();
  }

  _builBody(){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildTodaysWeatherWidget(),
          _buildTodaysWeather(),
        ],
      ),
    );
  }

  _buildTodaysWeatherWidget(){
    double screen_width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: screen_width/50, right: screen_width/50, top: screen_width/50, bottom: screen_width/100),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0), color: Color(0xfffff2cc)),
      padding: EdgeInsets.all(10.0),
      child: Card(
        color: Color(0xfffff2cc),
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: screen_width/10, right: screen_width/10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("마일리지 현황", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold) ,),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                new CircularPercentIndicator(
                  radius: 120.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: 0.5,
                  center: new Text(
                    "50P",
                    style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  header: new Text(
                    "오늘 적립 가능 한 마일리지",
                    style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.purple,
                ),
                SizedBox(width: 10.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.directions_bus, size: 30.0, color:Colors.purple),
                        SizedBox(width: 10.0,),
                        AutoSizeText("일주일 동안 탄 횟수 ${rideTimesInThisWeek}회", style: TextStyle(fontSize: 20.0),),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.monetization_on, size: 30.0,color: Colors.amber,),
                        SizedBox(width: 10.0,),
                        Text("총 마일리지", style: TextStyle(fontSize: 20.0),),
                        Text("${totalPoint}P", style: TextStyle(color:Colors.amber, fontSize: 20.0),),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildTodaysWeather(){
    DateTime now = DateTime.now();
    String time_now = "${now.year}-0${now.month}-0${now.day} ${now.hour}";
    String today_date = "${now.month}월 ${now.day}일";
    double screen_width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: screen_width/50, right: screen_width/50, top: screen_width/50, bottom: screen_width/100),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0), color: Color(0xfffff2cc)),
      padding: EdgeInsets.all(10.0),
      child: Card(
        color: Color(0xfffff2cc),
        elevation: 0.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: screen_width/10, right: screen_width/10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(today_date+" 기상 정보",style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: EdgeInsets.all(screen_width/50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Weather(region: widget.region,),
                  Dust(region: widget.region, timedetail: time_now,),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screen_width/2.5),
             child: Text("업데이트 시간: ${now.hour}시",style: TextStyle(fontSize: 12),),
            )
          ],
        ),
      ),
    );
  }
}