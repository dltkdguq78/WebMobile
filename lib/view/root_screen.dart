import 'package:flutter/material.dart';

import 'screen/home_screen.dart';
import 'screen/member/login_screen.dart';

class RootScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => RootScreenState();

}

class RootScreenState extends State<RootScreen>{

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xfff4b183),
        title: Text("구미시 양호동"),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: InkWell(
            onTap: () => scaffoldKey.currentState.openDrawer(),
            child: Icon(Icons.menu, size: 32.0,),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: (){
                print("SEARCH ACTION");
              },
              child: Icon(Icons.search, size: 32.0,),
            ),
          )
        ],
      ),
      body: HomeScreen(),
      backgroundColor: Color(0xfff8cbad),
      drawer: _buildDrawer(),
    );
  }

  _buildDrawer(){
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: DrawerHeader(
              child: Text('사용자 정보'),
              decoration: BoxDecoration(
                color: Color(0xfff4b183),
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(user_id: "서정삼",))),
            title: Text("로그인"),
          )
        ],
      ),
    );
  }



}

