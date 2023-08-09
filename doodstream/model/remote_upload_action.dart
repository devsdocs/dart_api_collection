// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class RemoteUploadAction {
  RemoteUploadAction({
    this.msg,
    this.serverTime,
    this.status,
  });

  factory RemoteUploadAction.fromJson(String str) =>
      RemoteUploadAction.fromMap(json.decode(str));

  factory RemoteUploadAction.fromMap(Map<String, dynamic> json) =>
      RemoteUploadAction(
        msg: json['msg'],
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final DateTime? serverTime;
  final int? status;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}
