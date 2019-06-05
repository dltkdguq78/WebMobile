import 'package:flutter/material.dart';
import 'package:dambi/view/screen/member/signin/signininfo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class SignIn extends StatelessWidget{
  String id;
  String idpass;
  String Tid;
  String Tpass;
  bool is_SignIn;

  SignIn({
    Key key,
    this.id,
    this.idpass,
    this.Tid,
    this.Tpass,
    this.is_SignIn = false,
  }): super(key: key);

  bool getter(){
    return this.is_SignIn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<SignInInfo>(
          future: getSign(id, idpass, Tid, Tpass), //sets the getQuote method as the expected Future
          builder: (context, snapshot) {
            if (snapshot.hasData) { //checks if the response returns valid data
              if(snapshot.data.result == "success"){
                is_SignIn = true;
                return _buildAlert(snapshot.data.result);
              }
              else if(Tpass == "" || idpass == "" || id == "" || Tid == ""){
                is_SignIn = false;
                return _buildAlert("빈칸을 모두 채워 주세요.");
              }
              else{
                is_SignIn = false;
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
          body: {
            "id": "$id",
            "idpass": "$idpass",
            "Tid": "$Tid",
            "Tpass": "$Tpass"
          },
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