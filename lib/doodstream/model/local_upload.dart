// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class LocalUpload {
  const LocalUpload({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory LocalUpload.fromJson(String str) =>
      LocalUpload.fromMap(json.decode(str));

  factory LocalUpload.fromMap(Map<String, dynamic> json) => LocalUpload(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<LocalUploadResult>.from(
                json['result']!.map((x) => LocalUploadResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<LocalUploadResult>? result;
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

class LocalUploadResult {
  const LocalUploadResult({
    this.canplay,
    this.downloadUrl,
    this.filecode,
    this.length,
    this.protectedDl,
    this.protectedEmbed,
    this.singleImg,
    this.size,
    this.splashImg,
    this.status,
    this.title,
    this.uploaded,
  });

  factory LocalUploadResult.fromJson(String str) =>
      LocalUploadResult.fromMap(json.decode(str));

  factory LocalUploadResult.fromMap(Map<String, dynamic> json) =>
      LocalUploadResult(
        canplay: json['canplay'],
        downloadUrl: json['download_url'],
        filecode: json['filecode'],
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
      );
  final int? canplay;
  final String? downloadUrl;
  final String? filecode;
  final int? length;
  final String? protectedDl;
  final String? protectedEmbed;
  final String? singleImg;
  final int? size;
  final String? splashImg;
  final int? status;
  final String? title;
  final DateTime? uploaded;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'canplay': canplay,
        'download_url': downloadUrl,
        'filecode': filecode,
        'length': length,
        'protected_dl': protectedDl,
        'protected_embed': protectedEmbed,
        'single_img': singleImg,
        'size': size,
        'splash_img': splashImg,
        'status': status,
        'title': title,
        'uploaded': uploaded?.toIso8601String(),
      };
}
