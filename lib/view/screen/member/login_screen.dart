import 'package:flutter/material.dart';
import 'package:dambi/view/screen/member/signin_screen.dart';

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
        backgroundColor: Color(0xfffff2cc),
        elevation: 0.0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back, color: Colors.black,),
        ),
      ),
      body: _buildBody(),
      backgroundColor: Color(0xfffff2cc),
    );
  }

  _buildBody() {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height/15,),
              Tab(icon: Image.asset('assets/loginlogo.png')),
              SizedBox(height: 10.0,),
              Text("담  비", style: TextStyle(fontSize: 40.0),),
              SizedBox(height: 20.0,),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2, right: MediaQuery.of(context).size.width * 0.2),
                child: Column(
                  children: <Widget>[
                    TextField(textAlign: TextAlign.center, decoration: InputDecoration(hintText: "ID"), controller: id_controller,),
                    SizedBox(height: 10.0,),
                    TextField(textAlign: TextAlign.center, decoration: InputDecoration(hintText: "PASSWORD"), obscureText: true, controller: pw_controller,),
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              InkWell(
                child: Container(
                  child: RaisedButton(
                    color: Color(0xfff8cbad),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    child: new Text("로그인",
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold)),
                    onPressed: () => onLoginButtonAction(),
                ),
                ),
              ),
              RaisedButton(
                color: Color(0xfff8cbad),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                child: new Text("회원가입",
                    style: new TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold)),
                onPressed: () => onSignInButtonAction(),
              ),
              SizedBox(height: 20.0,),
          Container(
            child:GestureDetector(
              onTap:() => onFindInfoButtonAction(),
              child: Text(
                "아이디/비밀번호 찾기",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: 12.0),
              ),
            ),
          ),
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
  onFindInfoButtonAction(){
    print("아직 안만들었어");
  }
  onSignInButtonAction(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SigninScreen()),
    );
  }
}