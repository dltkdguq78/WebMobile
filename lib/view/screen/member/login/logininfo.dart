class LogInInfo {

  final String result;
  final String accesstoken;

  LogInInfo({this.result, this.accesstoken});

  factory LogInInfo.fromJson(Map<String, dynamic> json) {
    return LogInInfo(
      result:json['result'],
      accesstoken:json['accesstoken'],
    );
  }
}