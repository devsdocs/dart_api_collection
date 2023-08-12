// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamCloneFile {
  DoodstreamCloneFile({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory DoodstreamCloneFile.fromJson(String str) =>
      DoodstreamCloneFile.fromMap(json.decode(str));

  factory DoodstreamCloneFile.fromMap(Map<String, dynamic> json) =>
      DoodstreamCloneFile(
        msg: json['msg'],
        result:
            json['result'] == null ? null : DoodstreamCloneFileResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final DoodstreamCloneFileResult? result;
  final DateTime? serverTime;
  final int? status;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result?.toMap(),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };

}

class DoodstreamCloneFileResult {
  DoodstreamCloneFileResult({
    this.downloadUrl,
    this.embedUrl,
    this.filecode,
    this.protectedDownload,
    this.protectedEmbed,
  });

  factory DoodstreamCloneFileResult.fromJson(String str) =>
      DoodstreamCloneFileResult.fromMap(json.decode(str));

  factory DoodstreamCloneFileResult.fromMap(Map<String, dynamic> json) => DoodstreamCloneFileResult(
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
