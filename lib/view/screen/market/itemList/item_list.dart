import 'package:flutter/material.dart';

class ItemListScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => ItemListScreenState();

}

class ItemListScreenState extends State<ItemListScreen> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff4b183),
        centerTitle: true,
      ),
      body: Container(
          child: Text("상품 준비중 입니다.")
      ),
      backgroundColor: Color(0xfffff2cc),
    );
  }
}

