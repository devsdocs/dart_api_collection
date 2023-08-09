// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class FileInfo {
  FileInfo({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory FileInfo.fromJson(String str) => FileInfo.fromMap(json.decode(str));

  factory FileInfo.fromMap(Map<String, dynamic> json) => FileInfo(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<FileInfoResult>.from(
                json['result']!.map((x) => FileInfoResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<FileInfoResult>? result;
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

class FileInfoResult {
  FileInfoResult({
    this.canplay,
    this.filecode,
    this.lastView,
    this.length,
    this.protectedDl,
    this.protectedEmbed,
    this.singleImg,
    this.size,
    this.splashImg,
    this.status,
    this.title,
    this.uploaded,
    this.views,
  });

  factory FileInfoResult.fromJson(String str) =>
      FileInfoResult.fromMap(json.decode(str));

  factory FileInfoResult.fromMap(Map<String, dynamic> json) => FileInfoResult(
        canplay: json['canplay'],
        filecode: json['filecode'],
        lastView: json['last_view'],
        length: json['length'],
        protectedDl: json['protected_dl'],
        protectedEmbed: json['protected_embed'],
        singleImg: json['single_img'],
        size: json['size'],
        splashImg: json['splash_img'],
        status: json['status'],
        title: json['title'],
        uploaded:
            json['uploaded'] == null ? null : DateTime.parse(json['uploaded']),
        views: json['views'],
      );
  final int? canplay;
  final String? filecode;
  final String? lastView;
  final int? length;
  final String? protectedDl;
  final String? protectedEmbed;
  final String? singleImg;
  final int? size;
  final String? splashImg;
  final int? status;
  final String? title;
  final DateTime? uploaded;
  final int? views;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'canplay': canplay,
        'filecode': filecode,
        'last_view': lastView,
        'length': length,
        'protected_dl': protectedDl,
        'protected_embed': protectedEmbed,
        'single_img': singleImg,
        'size': size,
        'splash_img': splashImg,
        'status': status,
        'title': title,
        'uploaded': uploaded?.toIso8601String(),
        'views': views,
      };
}
