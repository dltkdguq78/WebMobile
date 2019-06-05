import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dambi/view/screen/market/itemList/item_list.dart';

class PointMarketScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PointMaterScreenState();
}

class PointMaterScreenState extends State<PointMarketScreen> {
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
              onTap: () {
                print("SEARCH ACTION");
              },
              child: Icon(
                Icons.search,
                size: 32.0,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Color(0xfffff2cc),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        _buildHorizontalScrollMenuBar(),
        Expanded(
          child: _buildMenuItemsList(),
        ),
      ],
    );
  }

  _buildDustIcon(String temp) {
    switch (temp) {
      case '캔디':
        return Tab(icon: Image.asset('assets/ItemMenu/candy.png'));
      case '과자':
        return Tab(icon: Image.asset('assets/ItemMenu/chips.png'));
      case '라면':
        return Tab(icon: Image.asset('assets/ItemMenu/ramen.png'));
      case '초콜릿':
        return Tab(icon: Image.asset('assets/ItemMenu/chocolate.png'));
      case '아이스크림':
        return Tab(icon: Image.asset('assets/ItemMenu/icecream.png'));
      case '커피':
        return Tab(icon: Image.asset('assets/ItemMenu/coffee.png'));
      case '음료':
        return Tab(icon: Image.asset('assets/ItemMenu/water.png'));
    }
  }

  _buildHorizontalScrollMenuBar() {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            //  _buildTopMenuItem(Image.asset('assets/candy.png'), "제휴 회사", 0),
            SizedBox(width: 10,),
            _buildTopMenuItem("캔디", 0),
            _buildTopMenuItem("과자", 1),
            _buildTopMenuItem("라면", 2),
            _buildTopMenuItem("초콜릿", 3),
            _buildTopMenuItem("아이스크림", 4),
            _buildTopMenuItem("커피", 5),
            _buildTopMenuItem("음료", 6),
            SizedBox(width: 10,),
          ],
        ),
      ),
    );
  }

  _buildTopMenuItem(String text, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 5.5,right: 5.5),
      child: InkWell(
        onTap: () {
          scrollController.animateTo(index * 400.0,
              duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
        child: Container(

          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xfff8cbad)),
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                _buildDustIcon(text),
                SizedBox(height: 5),
                Text(
                  text,
                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildMenuItemsList() {
    return ListView(
      controller: scrollController,
      children: <Widget>[
        Column(
          children: <Widget>[
            _buildCategoryItemlist("캔디"),
            _buildCategoryItemlist("과자"),
            _buildCategoryItemlist("라면"),
            _buildCategoryItemlist("초콜릿"),
            _buildCategoryItemlist("아이스크림"),
            _buildCategoryItemlist("커피"),
            _buildCategoryItemlist("음료"),
          ],
        ),
      ],
    );
  }

  _buildCategoryItemlist(String menu) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 3, top: 3),
            width: MediaQuery.of(context).size.width * 5.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xfffff2cc)),
            child: Text(
              menu,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          _buildList(),
        ],
      ),
    );
  }

  _buildList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          _buildCategoryItems(),
          _buildCategoryItems(),
          _buildCategoryItems(),
          _buildCategoryItems(),
          _buildCategoryItems(),
          _buildCategoryItems(),
        ],
      ),
    );
  }

  _buildCategoryItems() {
    return InkWell(
      onTap: () => onMarketInfoButtonAction(),
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.01,
            right: MediaQuery.of(context).size.width * 0.01,
            top: 10.0,
            bottom: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xfff8cbad)),
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
                imageUrl:
                'http://salesmall.co.kr/SM/UploadFiles/Shop/Article/0/SAI_20161205110056____1_.jpg',
                fit: BoxFit.cover),
            Text("상품준비중입니다."),
            Text("가격 : 0원"),
          ],
        ),
      ),
    );
  }

  onMarketInfoButtonAction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemListScreen()),
    );
  }
}