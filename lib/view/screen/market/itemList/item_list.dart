import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ItemListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ItemListScreenState();
}

class ItemListScreenState extends State<ItemListScreen> {
  ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        title: Text(
          "상품상세",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: buildItemBody(),
      backgroundColor: Colors.white,
    );
  }

  buildItemBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: buildItemInfo(),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: Colors.purple,
          child: RaisedButton(
            color: Color.fromARGB(0, 0, 0, 100),
            child: new Text(
              "구매하기",
              style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  buildItemInfo() {
    return ListView(
      controller: scrollController,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Image.asset(
              'assets/ItemImage/2.jpg',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "제주삼다수",
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "950P",
              style: TextStyle(fontSize: 20.0, color: Colors.purple),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "유효기간 365일",
              style: TextStyle(fontSize: 15.0, color: Colors.black54),
            ),
            SizedBox(
              height: 15.0,
            ),
            buildItemtab(),
            SizedBox(
              height: 30.0,
            ),
            builduseinfo(),
            SizedBox(
              height: 100.0,
            ),
          ],
        ),
      ],
    );
  }

  builduseinfo() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 10),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "\n\t상품권 이용안내\n",
                      textAlign: TextAlign.start,
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                        "· 전국 00에서 상품교환이 가능합니다.\n\n· 자체 행사상품에는 제외됩니다.\n\n· 1+1 / 2+1 등 행사 상품 +1은 적용되지 않습니다.\n\n· 각종 할인 적용 및 포인트 적립은 ㅇㅇ의 정책에 따릅니다."),
                    Text("\n\n\t고객센터\n",
                        style: new TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    Text("· 1577-0000 (운영시간 : 평일 09:00 ~ 21:00)"),
                  ],
                )

            ),

          ],
        ));
  }
  buildubuyinfo() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "\n구매 후 상품권 받기\n",
              textAlign: TextAlign.start,
              style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Text(
                "·전국 00에서 상품교환이 가능합니다.\n\n·자체 행사상품에는 제외됩니다.\n\n·1+1 / 2+1 등 행사 상품 +1은 적용되지 않습니다.\n\n·각종 할인 적용 및 포인트 적립은 ㅇㅇ의 정책에 따릅니다."),
            Text("\n\n상품권 점포에서 교환하기\n",
                style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            Text("·1577-0000 (운영시간 : 평일 09:00 ~ 21:00)"),
          ],
        ));
  }


  buildItemtab() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(

            width: MediaQuery.of(context).size.width / 2,
            height: 45,
            padding: EdgeInsets.only(left: 5,right: 5),
            child: RaisedButton(
              elevation: 5,
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              child: new Text(
                "이용안내",
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 45,
            padding: EdgeInsets.only(left: 5,right: 5),
            color: Colors.white,
            child: RaisedButton(
              elevation: 5,
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10)),
              child: new Text(
                "구매·교환 안내",
                style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ), onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}