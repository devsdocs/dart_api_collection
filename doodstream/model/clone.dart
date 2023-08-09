// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class Clone {
  Clone({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory Clone.fromJson(String str) => Clone.fromMap(json.decode(str));

  factory Clone.fromMap(Map<String, dynamic> json) => Clone(
        msg: json['msg'],
        result:
            json['result'] == null ? null : CloneResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final CloneResult? result;
  final DateTime? serverTime;
  final int? status;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result?.toMap(),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };

  String toReadableFormat() {
    final data =
        'File code: <code>${result!.filecode}</code>\nDownload url: <code>${result!.downloadUrl}</code>\nEmbed url: <code>${result!.embedUrl}</code>\nProtected download url: <code>${result!.protectedDownload}</code>\nProtected embed url: <code>${result!.protectedEmbed}</code>';

    return data;
  }
}

class CloneResult {
  CloneResult({
    this.downloadUrl,
    this.embedUrl,
    this.filecode,
    this.protectedDownload,
    this.protectedEmbed,
  });

  factory CloneResult.fromJson(String str) =>
      CloneResult.fromMap(json.decode(str));

  factory CloneResult.fromMap(Map<String, dynamic> json) => CloneResult(
        downloadUrl: json['download_url'],
        embedUrl: json['embed_url'],
        filecode: json['filecode'],
        protectedDownload: json['protected_download'],
        protectedEmbed: json['protected_embed'],
      );
  final String? downloadUrl;
  final String? embedUrl;
  final String? filecode;
  final String? protectedDownload;
  final String? protectedEmbed;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'download_url': downloadUrl,
        'embed_url': embedUrl,
        'filecode': filecode,
        'protected_download': protectedDownload,
        'protected_embed': protectedEmbed,
      };
}
