import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dambi/view/screen/market/itemList/item_list.dart';

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
      backgroundColor: Color(0xfffff2cc),
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
            _buildTopMenuItem(Icons.home, "제휴 회사" , 0),
            _buildTopMenuItem(Icons.home, "제휴 회사" , 1),
            _buildTopMenuItem(Icons.home, "제휴 회사" , 2),
            _buildTopMenuItem(Icons.home, "제휴 회사" , 3),
            _buildTopMenuItem(Icons.home, "제휴 회사" , 4),
            _buildTopMenuItem(Icons.home, "제휴 회사" , 5),
            _buildTopMenuItem(Icons.home, "제휴 회사" , 6),
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
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(0xfff8cbad)),
        child: Container(
          margin: EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Icon(icon, size: 40.0,),
            Text(text, style: TextStyle(fontSize: 15.0),),
          ],
        ),
        ),
        ),
      ),
    );
  }

  _buildMenuItemsList(){
    return ListView(
      controller: scrollController,
      children: <Widget>[
        Column(
          children: <Widget>[
            _buildCategoryItemlist(),
            _buildCategoryItemlist(),
            _buildCategoryItemlist(),
            _buildCategoryItemlist(),
            _buildCategoryItemlist(),
            _buildCategoryItemlist(),
            _buildCategoryItemlist(),
          ],
        ),
      ],
    );
  }

  _buildCategoryItemlist(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Text("제휴 회사 상품 리스트"),
            Row(
              children: <Widget>[
                SizedBox(width: 10.0,),
                _buildCategoryItems(),
                _buildCategoryItems(),
                _buildCategoryItems(),
                _buildCategoryItems(),
                _buildCategoryItems(),
                _buildCategoryItems(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildCategoryItems(){
    return InkWell(
      onTap: () => onMarketInfoButtonAction(),
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01, right: MediaQuery.of(context).size.width * 0.01, top: 10.0, bottom: 5.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(0xfff8cbad)),
        child: Column(
          children: <Widget>[
            CachedNetworkImage(imageUrl: 'http://salesmall.co.kr/SM/UploadFiles/Shop/Article/0/SAI_20161205110056____1_.jpg',fit: BoxFit.cover),
            Text("상품준비중입니다."),
            Text("가격 : 0원"),
          ],
        ),
      ),
    );
  }

  onMarketInfoButtonAction(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemListScreen()),
    );
  }
}
