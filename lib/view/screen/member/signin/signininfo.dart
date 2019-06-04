class SignInInfo {

  final String result;
  final String info;

  SignInInfo({this.result, this.info});

  factory SignInInfo.fromJson(Map<String, dynamic> json) {
      return SignInInfo(
        info: json['info'],
        result: json['result'],
      );
    }
}