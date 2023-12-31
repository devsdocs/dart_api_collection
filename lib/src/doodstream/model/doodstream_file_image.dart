// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamFileImage {
  DoodstreamFileImage({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory DoodstreamFileImage.fromJson(String str) =>
      DoodstreamFileImage.fromMap(json.decode(str));

  factory DoodstreamFileImage.fromMap(Map<String, dynamic> json) =>
      DoodstreamFileImage(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<DoodstreamFileImageResult>.from(
                json['result']!
                    .map((x) => DoodstreamFileImageResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<DoodstreamFileImageResult>? result;
  final DateTime? serverTime;
  final int? status;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toMap())),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}

class DoodstreamFileImageResult {
  DoodstreamFileImageResult({
    this.filecode,
    this.singleImg,
    this.splashImg,
    this.status,
    this.thumbImg,
    this.title,
  });

  factory DoodstreamFileImageResult.fromJson(String str) =>
      DoodstreamFileImageResult.fromMap(json.decode(str));

  factory DoodstreamFileImageResult.fromMap(Map<String, dynamic> json) =>
      DoodstreamFileImageResult(
        filecode: json['filecode'],
        singleImg: json['single_img'],
        splashImg: json['splash_img'],
        status: json['status'],
        thumbImg: json['thumb_img'],
        title: json['title'],
      );
  final String? filecode;
  final String? singleImg;
  final String? splashImg;
  final int? status;
  final String? thumbImg;
  final String? title;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'filecode': filecode,
        'single_img': singleImg,
        'splash_img': splashImg,
        'status': status,
        'thumb_img': thumbImg,
        'title': title,
      };
}
