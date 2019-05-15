import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  String user_id;
  LoginScreen({
    this.user_id = "default",
  });

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  TextEditingController id_controller;
  TextEditingController pw_controller;

  @override
  void initState() {

    id_controller = TextEditingController(text: widget.user_id);
    pw_controller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff8cbad),
        elevation: 0.0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back, color: Colors.black,),
        ),
      ),
      body: _buildBody(),
      backgroundColor: Color(0xfff8cbad),
    );
  }

  _buildBody() {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.directions_bus, size: 40.0,),
              SizedBox(height: 10.0,),
              Text("담  비", style: TextStyle(fontSize: 40.0),),
              SizedBox(height: 20.0,),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2, right: MediaQuery.of(context).size.width * 0.2),
                child: Column(
                  children: <Widget>[
                    TextField(decoration: InputDecoration(hintText: "Id"), controller: id_controller,),
                    SizedBox(height: 10.0,),
                    TextField(decoration: InputDecoration(hintText: "Password"), obscureText: true, controller: pw_controller,),
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              InkWell(
                onTap: () => onLoginButtonAction(),
                child: Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 30.0, left: 30.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(0xff9dc3e6), border: Border.all(width: 0.3)),
                  child: Text("로그인"),
                ),
              ),
              RaisedButton(
                onPressed: (){},
                color: Color(0xffffe699),
                child: Text("회원가입"),
              ),
              SizedBox(height: 20.0,),
              FlatButton(
                onPressed: () {},
                child: Text("아이디/비밀번호 찾기"),
              )
            ],
          ),
        ),
      ),
    );
  }

  onLoginButtonAction() {
    print('로그인 버튼 터치');
    print('${id_controller.text} / ${pw_controller.text}');
  }

}