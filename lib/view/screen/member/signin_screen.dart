import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dambi/view/screen/member/signin/signin.dart';

class SigninScreen extends StatefulWidget{

  String user_id;
  String user_pw;
  String user_checkpw;
  String user_name;
  String user_ctype;
  String user_cid;
  String user_cpw;

  SigninScreen({
    this.user_id = "",
    this.user_pw = "",
    this.user_name = "",
    this.user_ctype = "",
    this.user_cid = "",
    this.user_cpw = "",
    this.user_checkpw = "",
  });
  @override
  State<StatefulWidget> createState() => SigninScreenState();

}

class SigninScreenState extends State<SigninScreen> {

  ScrollController scrollController;
  TextEditingController id_controller;
  TextEditingController pw_controller;
  TextEditingController checkpw_controller;
  TextEditingController cid_controller;
  TextEditingController cpw_controller;
  TextEditingController ctype_controller;
  TextEditingController name_controller;
  String cardCompany = '카드를 선택해 주세요.';
  bool agree = false;
  List<String> companies = <String>['카드를 선택해 주세요.','T-MONEY','CASH-BEE'];

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
          title: Text("회원 가입"),
          centerTitle: true
      ),
      backgroundColor: Color(0xfffff2cc),
      body: _buildBody(),
    );
  }
  _buildBody(){
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10.0,),
            _buildInfoField("ID", false, id_controller),
            _buildInfoField("패스워드", true, pw_controller),
            _buildInfoField("패스워드 확인", true, checkpw_controller),
            _buildInfoField("이름", false, name_controller),
            _buildChosseCard(),
            _buildInfoField("교통카드 ID", false, cid_controller),
            _buildInfoField("교통카드 PW", true, cpw_controller),
            SizedBox(height: 20.0,),
            _buildTextFormField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  child: Container(
                    child: RaisedButton(
                      color: Color(0xfff4b183),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                      child: new Text("회원가입",
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                      onPressed: () => onCompleteButtonAction(),
                    ),
                  ),
                ),
                RaisedButton(
                  color: Color(0xfff4b183),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  child: new Text("취소",
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold)),
                  onPressed: () => onCancleButtonAction(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildInfoField(String fname, bool isObscure, TextEditingController ctrler){
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.125, right: MediaQuery.of(context).size.width * 0.125),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("${fname}", textAlign: TextAlign.left, style: TextStyle(fontSize: 14.0),),
                  TextFormField(
                    textAlign: TextAlign.center,
                    obscureText: isObscure,
                    controller: ctrler,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xfff4b183),
                              width: 1.5,
                          ),
                        ),
                    ),
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }

  _buildChosseCard(){
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.125, right: MediaQuery.of(context).size.width * 0.125),
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("교통카드 종류", textAlign: TextAlign.left, style: TextStyle(fontSize: 14.0),),
                SizedBox(height: 25.0,),
                Container(
                  padding: EdgeInsets.all(1.5),
                  decoration: BoxDecoration(color: Color(0xfffff2cc), border: Border.all(color: Color(0xfff4b183), width: 1.5),),
                  child:DropdownButtonHideUnderline(
                    child: DropdownButton(
                      iconSize: 30,
                      value: cardCompany,
                      isDense: true,
                      onChanged: (String newValue) {
                        setState(() {
                          cardCompany = newValue;
                        });
                        },
                      items: companies.map((String value){
                        return new DropdownMenuItem(
                          child: new Text(value, style: TextStyle(fontSize: 14),),
                          value: value,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
              ),
          ),
        ],
      ),
    );
  }
  _buildTextFormField(){
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(0xfffff2cc), border: Border.all(color: Color(0xfff4b183), width: 3), ),
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08, right: MediaQuery.of(context).size.width * 0.08, top: 20.0, bottom: 5.0),
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.125, right: MediaQuery.of(context).size.width * 0.125, top: 10.0, bottom: 5.0),
      child:Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Color(0xfff4b183), ),
            padding: EdgeInsets.all(7),
            child: AutoSizeText("거래내역 조회 본인 동의", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), maxLines: 1,),
          ),
          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(color: Color(0xfffff2cc)),
            padding: EdgeInsets.all(5),
            child: AutoSizeText("본인은 조회 하고자하는 해당 카드가 본인의 소유임을 확인하여, 조회된 거래내역 및 기록이 제 3자에게 유츌됨으로 인하여 발생하게 되는 모든 문제에 대하여는 그 책임이 본인에게 있음을 확인합니다.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12), maxLines: null),
          ),
          SizedBox(height: 10.0,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("동의 함"),
                Checkbox(
                  value: agree,
                  onChanged: (bool value) {
                    setState(() {
                      agree = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  onCompleteButtonAction(){
    id_controller = TextEditingController(text: widget.user_id);
    pw_controller = TextEditingController(text: widget.user_pw);
    name_controller = TextEditingController(text: widget.user_name);
    ctype_controller = TextEditingController(text: widget.user_ctype);
    cid_controller = TextEditingController(text: widget.user_cid);
    cpw_controller = TextEditingController(text: widget.user_cpw);
    checkpw_controller = TextEditingController(text: widget.user_checkpw);

    print("아이디 : ${id_controller.text}");
    print("비밀번호 : ${id_controller.text}");
    print("비밀번호 확인 : ${id_controller.text}");
    print("이름 : ${id_controller.text}");
    print("교통카드 종류 : ${cardCompany}");
    print("교통카드 아이디 : ${id_controller.text}");
    print("교통카드 비밀번호 : ${id_controller.text}");
    print("동의함 : ${agree}");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type AlertDialog
        return AlertDialog(
          title: Text("알림"),
          content: SignIn(id: id_controller.text,
              idpass: id_controller.text,
              Tid: id_controller.text,
              Tpass: id_controller.text),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
  }
  onCancleButtonAction(){
    Navigator.pop(context);
  }
}