// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class FileRename {
  FileRename({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory FileRename.fromJson(String str) =>
      FileRename.fromMap(json.decode(str));

  factory FileRename.fromMap(Map<String, dynamic> json) => FileRename(
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

  String toReadableFormat() {
    if (result == null) {
      return msg!;
    } else {
      return 'Success';
    }
  }
}
