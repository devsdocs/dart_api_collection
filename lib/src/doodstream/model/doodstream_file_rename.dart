// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamFileRename {
  DoodstreamFileRename({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory DoodstreamFileRename.fromJson(String str) =>
      DoodstreamFileRename.fromMap(json.decode(str));

  factory DoodstreamFileRename.fromMap(Map<String, dynamic> json) =>
      DoodstreamFileRename(
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

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result,
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}
