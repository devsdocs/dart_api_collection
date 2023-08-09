// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class CreateFolder {
  CreateFolder({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory CreateFolder.fromJson(String str) =>
      CreateFolder.fromMap(json.decode(str));

  factory CreateFolder.fromMap(Map<String, dynamic> json) => CreateFolder(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : CreateFolderResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final CreateFolderResult? result;
  final DateTime? serverTime;
  final int? status;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result?.toMap(),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };

  String toReadableFormat() =>
      result == null ? '$msg' : 'Success!\nFolder ID: <code>${result!.fldId}</code>';
}

class CreateFolderResult {
  CreateFolderResult({
    this.fldId,
  });

  factory CreateFolderResult.fromJson(String str) =>
      CreateFolderResult.fromMap(json.decode(str));

  factory CreateFolderResult.fromMap(Map<String, dynamic> json) =>
      CreateFolderResult(
        fldId: json['fld_id'],
      );
  final String? fldId;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'fld_id': fldId,
      };
}
