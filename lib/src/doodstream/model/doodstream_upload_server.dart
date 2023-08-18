// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamUploadServer {
  DoodstreamUploadServer({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory DoodstreamUploadServer.fromJson(String str) =>
      DoodstreamUploadServer.fromMap(json.decode(str));

  factory DoodstreamUploadServer.fromMap(Map<String, dynamic> json) =>
      DoodstreamUploadServer(
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

  DoodstreamUploadServer copyWith({
    String? msg,
    String? result,
    DateTime? serverTime,
    int? status,
  }) =>
      DoodstreamUploadServer(
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
