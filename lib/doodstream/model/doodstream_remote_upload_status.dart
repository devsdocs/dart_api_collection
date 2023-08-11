// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamRemoteUploadStatus {
  DoodstreamRemoteUploadStatus({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory DoodstreamRemoteUploadStatus.fromJson(String str) =>
      DoodstreamRemoteUploadStatus.fromMap(json.decode(str));

  factory DoodstreamRemoteUploadStatus.fromMap(Map<String, dynamic> json) =>
      DoodstreamRemoteUploadStatus(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<RemoteUploadStatusResult>.from(
                json['result']!.map((x) => RemoteUploadStatusResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<RemoteUploadStatusResult>? result;
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

class RemoteUploadStatusResult {
  RemoteUploadStatusResult({
    this.bytesDownloaded,
    this.bytesTotal,
    this.created,
    this.fileCode,
    this.folderId,
    this.remoteUrl,
    this.status,
  });

  factory RemoteUploadStatusResult.fromJson(String str) =>
      RemoteUploadStatusResult.fromMap(json.decode(str));

  factory RemoteUploadStatusResult.fromMap(Map<String, dynamic> json) =>
      RemoteUploadStatusResult(
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
