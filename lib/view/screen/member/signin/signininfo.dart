class SignInInfo {

  final String result;
  final String info;

  SignInInfo({this.result, this.info});

  factory SignInInfo.fromJson(Map<String, dynamic> json) {
    if (json['result'] == "success") {
      return SignInInfo(
        result: json['result'],
      );
    }
    else {
      return SignInInfo(
        info: json['info'],
        result: json['result'],
      );
    }
  }
}