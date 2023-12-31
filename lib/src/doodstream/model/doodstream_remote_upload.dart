// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamRemoteUpload {
  DoodstreamRemoteUpload({
    this.msg,
    this.newTitle,
    this.result,
    this.serverTime,
    this.status,
    this.totalSlots,
    this.usedSlots,
  });

  factory DoodstreamRemoteUpload.fromJson(String str) =>
      DoodstreamRemoteUpload.fromMap(json.decode(str));

  factory DoodstreamRemoteUpload.fromMap(Map<String, dynamic> json) =>
      DoodstreamRemoteUpload(
        msg: json['msg'],
        newTitle: json['new_title'],
        result: json['result'] == null
            ? null
            : DoodstreamRemoteUploadResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
        totalSlots: json['total_slots'],
        usedSlots: json['used_slots'],
      );
  final String? msg;
  final String? newTitle;
  final DoodstreamRemoteUploadResult? result;
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

class DoodstreamRemoteUploadResult {
  DoodstreamRemoteUploadResult({
    this.filecode,
  });

  factory DoodstreamRemoteUploadResult.fromJson(String str) =>
      DoodstreamRemoteUploadResult.fromMap(json.decode(str));

  factory DoodstreamRemoteUploadResult.fromMap(Map<String, dynamic> json) =>
      DoodstreamRemoteUploadResult(
        filecode: json['filecode'],
      );
  final String? filecode;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'filecode': filecode,
      };
}
