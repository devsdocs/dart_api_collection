// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishRemoteUpload {
  StreamwishRemoteUpload({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishRemoteUpload.fromJson(String str) =>
      StreamwishRemoteUpload.fromMap(json.decode(str));

  factory StreamwishRemoteUpload.fromMap(Map<String, dynamic> json) =>
      StreamwishRemoteUpload(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : StreamwishRemoteUploadResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final StreamwishRemoteUploadResult? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishRemoteUpload copyWith({
    String? msg,
    StreamwishRemoteUploadResult? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishRemoteUpload(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        serverTime: serverTime ?? this.serverTime,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result?.toMap(),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}

class StreamwishRemoteUploadResult {
  StreamwishRemoteUploadResult({
    this.filecode,
  });

  factory StreamwishRemoteUploadResult.fromJson(String str) =>
      StreamwishRemoteUploadResult.fromMap(json.decode(str));

  factory StreamwishRemoteUploadResult.fromMap(Map<String, dynamic> json) =>
      StreamwishRemoteUploadResult(
        filecode: json['filecode'],
      );
  final String? filecode;

  StreamwishRemoteUploadResult copyWith({
    String? filecode,
  }) =>
      StreamwishRemoteUploadResult(
        filecode: filecode ?? this.filecode,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'filecode': filecode,
      };
}
