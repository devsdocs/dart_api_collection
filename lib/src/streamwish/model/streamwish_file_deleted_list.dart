// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishFileDeletedList {
  StreamwishFileDeletedList({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishFileDeletedList.fromJson(String str) =>
      StreamwishFileDeletedList.fromMap(json.decode(str));

  factory StreamwishFileDeletedList.fromMap(Map<String, dynamic> json) =>
      StreamwishFileDeletedList(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<StreamwishFileDeletedListResult>.from(
                json['result']!
                    .map((x) => StreamwishFileDeletedListResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<StreamwishFileDeletedListResult>? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishFileDeletedList copyWith({
    String? msg,
    List<StreamwishFileDeletedListResult>? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishFileDeletedList(
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

class StreamwishFileDeletedListResult {
  StreamwishFileDeletedListResult({
    this.deleted,
    this.deletedAgoSec,
    this.deletedBy,
    this.fileCode,
    this.title,
  });

  factory StreamwishFileDeletedListResult.fromJson(String str) =>
      StreamwishFileDeletedListResult.fromMap(json.decode(str));

  factory StreamwishFileDeletedListResult.fromMap(Map<String, dynamic> json) =>
      StreamwishFileDeletedListResult(
        deleted:
            json['deleted'] == null ? null : DateTime.parse(json['deleted']),
        deletedAgoSec: json['deleted_ago_sec'],
        deletedBy: json['deleted_by'],
        fileCode: json['file_code'],
        title: json['title'],
      );
  final DateTime? deleted;
  final String? deletedAgoSec;
  final String? deletedBy;
  final String? fileCode;
  final String? title;

  StreamwishFileDeletedListResult copyWith({
    DateTime? deleted,
    String? deletedAgoSec,
    String? deletedBy,
    String? fileCode,
    String? title,
  }) =>
      StreamwishFileDeletedListResult(
        deleted: deleted ?? this.deleted,
        deletedAgoSec: deletedAgoSec ?? this.deletedAgoSec,
        deletedBy: deletedBy ?? this.deletedBy,
        fileCode: fileCode ?? this.fileCode,
        title: title ?? this.title,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'deleted': deleted?.toIso8601String(),
        'deleted_ago_sec': deletedAgoSec,
        'deleted_by': deletedBy,
        'file_code': fileCode,
        'title': title,
      };
}
