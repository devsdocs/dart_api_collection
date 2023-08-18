// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishRemoteUploadStatus {
  StreamwishRemoteUploadStatus({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishRemoteUploadStatus.fromJson(String str) =>
      StreamwishRemoteUploadStatus.fromMap(json.decode(str));

  factory StreamwishRemoteUploadStatus.fromMap(Map<String, dynamic> json) =>
      StreamwishRemoteUploadStatus(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<StreamwishRemoteUploadStatusResult>.from(
                json['result']!
                    .map((x) => StreamwishRemoteUploadStatusResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<StreamwishRemoteUploadStatusResult>? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishRemoteUploadStatus copyWith({
    String? msg,
    List<StreamwishRemoteUploadStatusResult>? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishRemoteUploadStatus(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        serverTime: serverTime ?? this.serverTime,
        status: status ?? this.status,
      );

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

class StreamwishRemoteUploadStatusResult {
  StreamwishRemoteUploadStatusResult({
    this.fileCode,
    this.fldId,
    this.progress,
    this.remoteUrl,
    this.status,
  });

  factory StreamwishRemoteUploadStatusResult.fromJson(String str) =>
      StreamwishRemoteUploadStatusResult.fromMap(json.decode(str));

  factory StreamwishRemoteUploadStatusResult.fromMap(
    Map<String, dynamic> json,
  ) =>
      StreamwishRemoteUploadStatusResult(
        fileCode: json['file_code'],
        fldId: json['fld_id'],
        progress: json['progress'],
        remoteUrl: json['remote_url'],
        status: json['status'],
      );
  final String? fileCode;
  final int? fldId;
  final int? progress;
  final String? remoteUrl;
  final String? status;

  StreamwishRemoteUploadStatusResult copyWith({
    String? fileCode,
    int? fldId,
    int? progress,
    String? remoteUrl,
    String? status,
  }) =>
      StreamwishRemoteUploadStatusResult(
        fileCode: fileCode ?? this.fileCode,
        fldId: fldId ?? this.fldId,
        progress: progress ?? this.progress,
        remoteUrl: remoteUrl ?? this.remoteUrl,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'file_code': fileCode,
        'fld_id': fldId,
        'progress': progress,
        'remote_url': remoteUrl,
        'status': status,
      };
}
