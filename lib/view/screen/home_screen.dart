import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeScreenState();

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
          _buildWeeklyWeather()
        ],
      ),
    );
  }

  _buildTodaysWeatherWidget(){
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0), color: Color(0xfffff2cc)),
      padding: EdgeInsets.all(10.0),
      child: Card(
        color: Color(0xfffff2cc),
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
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
                    "오늘 적립한 마일리지",
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
                        Icon(Icons.directions_bus, size: 30.0,),
                        SizedBox(width: 10.0,),
                        AutoSizeText("일주일 동안 탄 횟수 ${rideTimesInThisWeek}회", style: TextStyle(fontSize: 20.0),),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.monetization_on, size: 30.0,),
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

  _buildWeeklyWeather(){

   //DateTime now = DateTime.now();
    //String today_date = "${now.month}월 ${now.day}일";

    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0), color: Color(0xfffff2cc)),
      padding: EdgeInsets.all(10.0),
      child: Card(
        color: Color(0xfffff2cc),
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: AutoSizeText("Weekly WEATER", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),  maxLines: 1, overflow: TextOverflow.ellipsis)
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child:SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildWeeklyWeatherItem("토", 0, 6),
                  _buildWeeklyWeatherItem("일", 0, 9),
                  _buildWeeklyWeatherItem("월", 0, 12),
                  _buildWeeklyWeatherItem("화", 0, 15),
                  _buildWeeklyWeatherItem("수", 0, 15),
                  _buildWeeklyWeatherItem("목", 0, 15),
                  _buildWeeklyWeatherItem("금", 0, 15),
                ],
              ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildTodaysWeather(){

    DateTime now = DateTime.now();
    String today_date = "${now.month}월 ${now.day}일";

    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0), color: Color(0xfffff2cc)),
      padding: EdgeInsets.all(10.0),
      child: Card(
        color: Color(0xfffff2cc),
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: AutoSizeText(today_date+"WEATER", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),  maxLines: 1, overflow: TextOverflow.ellipsis)
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildTodaysWeatherItem(10, 0, 6),
                  _buildTodaysWeatherItem(9, 0, 9),
                  _buildTodaysWeatherItem(8, 0, 12),
                  _buildTodaysWeatherItem(4, 0, 15),
                  _buildTodaysWeatherItem(8, 0, 18),
                  _buildTodaysWeatherItem(9, 0, 21),
                  _buildTodaysWeatherItem(8, 0, 0),
                  _buildTodaysWeatherItem(4, 0, 3),
                ],
              ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildTodaysWeatherItem(int temp, int hu, int time){

    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Column(
        children: <Widget>[
          Icon(Icons.cloud, size: 60.0,),
          Text("$temp ℃", style: TextStyle(fontSize: 20.0),),
          SizedBox(height: 5.0,),
          Text("$hu%", style: TextStyle(fontSize: 20.0)),
          SizedBox(height: 5.0,),
          Text("$time시", style: TextStyle(fontSize: 20.0)),
        ],
      ),
    );
  }

  _buildWeeklyWeatherItem(String dayofweek, int min_temp, int max_temp){
    double screen_width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Column(
        children: <Widget>[
          Text("${dayofweek}", style: TextStyle(fontSize: screen_width/20.0),),
          SizedBox(height: 5.0,),
          Icon(Icons.cloud, size: screen_width / 10,),
          SizedBox(height: 5.0,),
          Text("$min_temp ℃/ $max_temp ℃", style: TextStyle(fontSize: screen_width/40.0)),
        ],
      ),
    );
  }

}