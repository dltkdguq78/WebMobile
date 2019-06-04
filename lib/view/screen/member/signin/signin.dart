import 'package:flutter/material.dart';
import 'package:dambi/view/screen/member/signin/signininfo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class SignIn extends StatefulWidget{
  String id;
  String idpass;
  String Tid;
  String Tpass;
  @override
  State<StatefulWidget> createState() => SignInState();

  SignIn({
    Key key,
    this.id,
    this.idpass,
    this.Tid,
    this.Tpass
  }): super(key: key);
}

class SignInState extends State<SignIn>{
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<SignInInfo>(
          future: getSign(widget.id, widget.idpass, widget.Tid, widget.Tpass), //sets the getQuote method as the expected Future
          builder: (context, snapshot) {
            if (snapshot.hasData) { //checks if the response returns valid data
              if(snapshot.data.info == null){
                return _buildAlert(snapshot.data.result);
              }
              else{
                return _buildAlert(snapshot.data.info);
              }
            } else if (snapshot.hasError) { //checks if the response throws an error
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();},
        )
    );
  }

  _buildAlert(String str) {
    return Text(
      "$str"
    );
  }

  Future<SignInInfo> getSign(String id, String idpass, String Tid, String Tpass) async {

    String uri = 'http://kumoh42teamcontest.p-e.kr/join';

    final response =
    await http.post(uri,
        body:{"id": "$id", "idpass": "$idpass", "Tid": "$Tid", "Tpass": "$Tpass"},
        headers: {'Accept': 'application/json'}
    );

    print(response.body);

    if (response.statusCode == 200) {
      return SignInInfo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}