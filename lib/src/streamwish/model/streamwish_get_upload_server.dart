// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishGetUploadServer {
  StreamwishGetUploadServer({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishGetUploadServer.fromJson(String str) =>
      StreamwishGetUploadServer.fromMap(json.decode(str));

  factory StreamwishGetUploadServer.fromMap(Map<String, dynamic> json) =>
      StreamwishGetUploadServer(
        msg: json['msg'],
        result: json['result'],
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final String? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishGetUploadServer copyWith({
    String? msg,
    String? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishGetUploadServer(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        serverTime: serverTime ?? this.serverTime,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result,
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}
