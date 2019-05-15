import 'package:flutter/material.dart';

class PointMarketScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => PointMaterScreenState();

}

class PointMaterScreenState extends State<PointMarketScreen>{

  ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff4b183),
        title: Text("포인트 마켓"),
        centerTitle: true,
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
      backgroundColor: Color(0xfff8cbad),
      body: _buildBody(),
    );
  }

  _buildBody(){
   return  Column(
     children: <Widget>[
       _buildHorizontalScrollMenuBar(),
       Expanded(
         child: _buildMenuItemsList(),
       ),
     ],
   );
  }

  _buildHorizontalScrollMenuBar(){
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            _buildTopMenuItem(Icons.home, "아이스크림" , 0),
            _buildTopMenuItem(Icons.home, "아이스크림" , 1),
            _buildTopMenuItem(Icons.home, "아이스크림" , 2),
            _buildTopMenuItem(Icons.home, "아이스크림" , 3),
            _buildTopMenuItem(Icons.home, "아이스크림" , 4),
            _buildTopMenuItem(Icons.home, "아이스크림" , 5),
            _buildTopMenuItem(Icons.home, "아이스크림" , 6),
          ],
        ),
      ),
    );
  }

  _buildTopMenuItem(IconData icon, String text, int index){
    return Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: InkWell(
        onTap: (){
          scrollController.animateTo(index * 400.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
        child: Column(
          children: <Widget>[
            Icon(icon, size: 40.0,),
            Text(text, style: TextStyle(fontSize: 15.0),),
          ],
        ),
      ),
    );
  }

  _buildMenuItemsList(){
    return ListView(
      controller: scrollController,
      children: <Widget>[
        _buildCategoryItems(),
        _buildCategoryItems(),
        _buildCategoryItems(),
      ],
    );
  }

  _buildCategoryItems(){
    return Container(
      height: 500.0,
      child: Column(
        children: <Widget>[
          Text("아이스크림 (2)"),
          SizedBox(height: 10.0,),
          Row(
            children: <Widget>[

            ],
          )
        ],
      ),
    );
  }

}
