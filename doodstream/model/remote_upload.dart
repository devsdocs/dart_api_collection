// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class RemoteUpload {
  RemoteUpload({
    this.msg,
    this.newTitle,
    this.result,
    this.serverTime,
    this.status,
    this.totalSlots,
    this.usedSlots,
  });

  factory RemoteUpload.fromJson(String str) =>
      RemoteUpload.fromMap(json.decode(str));

  factory RemoteUpload.fromMap(Map<String, dynamic> json) => RemoteUpload(
        msg: json['msg'],
        newTitle: json['new_title'],
        result: json['result'] == null
            ? null
            : RemoteUploadResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
        totalSlots: json['total_slots'],
        usedSlots: json['used_slots'],
      );
  final String? msg;
  final String? newTitle;
  final RemoteUploadResult? result;
  final DateTime? serverTime;
  final int? status;
  final String? totalSlots;
  final int? usedSlots;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'new_title': newTitle,
        'result': result?.toMap(),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
        'total_slots': totalSlots,
        'used_slots': usedSlots,
      };
}

class RemoteUploadResult {
  RemoteUploadResult({
    this.filecode,
  });

  factory RemoteUploadResult.fromJson(String str) =>
      RemoteUploadResult.fromMap(json.decode(str));

  factory RemoteUploadResult.fromMap(Map<String, dynamic> json) =>
      RemoteUploadResult(
        filecode: json['filecode'],
      );
  final String? filecode;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'filecode': filecode,
      };
}
