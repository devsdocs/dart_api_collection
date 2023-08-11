// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamRemoteUploadList {
  DoodstreamRemoteUploadList({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory DoodstreamRemoteUploadList.fromJson(String str) =>
      DoodstreamRemoteUploadList.fromMap(json.decode(str));

  factory DoodstreamRemoteUploadList.fromMap(Map<String, dynamic> json) =>
      DoodstreamRemoteUploadList(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<RemoteUploadListResult>.from(
                json['result']!.map((x) => RemoteUploadListResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<RemoteUploadListResult>? result;
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

class RemoteUploadListResult {
  RemoteUploadListResult({
    this.bytesDownloaded,
    this.bytesTotal,
    this.created,
    this.fileCode,
    this.folderId,
    this.remoteUrl,
    this.status,
  });

  factory RemoteUploadListResult.fromJson(String str) =>
      RemoteUploadListResult.fromMap(json.decode(str));

  factory RemoteUploadListResult.fromMap(Map<String, dynamic> json) =>
      RemoteUploadListResult(
        bytesDownloaded: json['bytes_downloaded'],
        bytesTotal: json['bytes_total'],
        created:
            json['created'] == null ? null : DateTime.parse(json['created']),
        fileCode: json['file_code'],
        folderId: json['folder_id'],
        remoteUrl: json['remote_url'],
        status: json['status'],
      );
  final int? bytesDownloaded;
  final int? bytesTotal;
  final DateTime? created;
  final String? fileCode;
  final int? folderId;
  final String? remoteUrl;
  final String? status;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'bytes_downloaded': bytesDownloaded,
        'bytes_total': bytesTotal,
        'created': created?.toIso8601String(),
        'file_code': fileCode,
        'folder_id': folderId,
        'remote_url': remoteUrl,
        'status': status,
      };
}
