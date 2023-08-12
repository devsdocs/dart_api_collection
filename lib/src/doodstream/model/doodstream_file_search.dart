// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamFileSearch {
  DoodstreamFileSearch({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory DoodstreamFileSearch.fromJson(String str) =>
      DoodstreamFileSearch.fromMap(json.decode(str));

  factory DoodstreamFileSearch.fromMap(Map<String, dynamic> json) =>
      DoodstreamFileSearch(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<DoodstreamFileSearchResult>.from(
                json['result']!.map((x) => DoodstreamFileSearchResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<DoodstreamFileSearchResult>? result;
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

class DoodstreamFileSearchResult {
  DoodstreamFileSearchResult({
    this.canplay,
    this.fileCode,
    this.length,
    this.singleImg,
    this.splashImg,
    this.title,
    this.uploaded,
    this.views,
  });

  factory DoodstreamFileSearchResult.fromJson(String str) =>
      DoodstreamFileSearchResult.fromMap(json.decode(str));

  factory DoodstreamFileSearchResult.fromMap(Map<String, dynamic> json) =>
      DoodstreamFileSearchResult(
        canplay: json['canplay'],
        fileCode: json['file_code'],
        length: json['length'],
        singleImg: json['single_img'],
        splashImg: json['splash_img'],
        title: json['title'],
        uploaded:
            json['uploaded'] == null ? null : DateTime.parse(json['uploaded']),
        views: json['views'],
      );
  final int? canplay;
  final String? fileCode;
  final int? length;
  final String? singleImg;
  final String? splashImg;
  final String? title;
  final DateTime? uploaded;
  final int? views;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'canplay': canplay,
        'file_code': fileCode,
        'length': length,
        'single_img': singleImg,
        'splash_img': splashImg,
        'title': title,
        'uploaded': uploaded?.toIso8601String(),
        'views': views,
      };
}
