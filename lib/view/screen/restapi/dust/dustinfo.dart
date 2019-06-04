class DustInfo {

  final String region;
  final String datetime;
  final String pm2;
  final String pm10;

  DustInfo({this.region, this.datetime, this.pm2, this.pm10,});

  factory DustInfo.fromJson(Map<String, dynamic> json) {
    return DustInfo(
      region:json['region'],
      datetime:json['datetime'],
      pm2: json['PM2'],
      pm10: json['PM10'],
    );
  }
}