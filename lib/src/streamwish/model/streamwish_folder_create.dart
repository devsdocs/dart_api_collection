// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishFolderCreate {
  StreamwishFolderCreate({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishFolderCreate.fromJson(String str) =>
      StreamwishFolderCreate.fromMap(json.decode(str));

  factory StreamwishFolderCreate.fromMap(Map<String, dynamic> json) =>
      StreamwishFolderCreate(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : StreamwishFolderCreateResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final StreamwishFolderCreateResult? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishFolderCreate copyWith({
    String? msg,
    StreamwishFolderCreateResult? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishFolderCreate(
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

class StreamwishFolderCreateResult {
  StreamwishFolderCreateResult({
    this.fldId,
  });

  factory StreamwishFolderCreateResult.fromJson(String str) =>
      StreamwishFolderCreateResult.fromMap(json.decode(str));

  factory StreamwishFolderCreateResult.fromMap(Map<String, dynamic> json) =>
      StreamwishFolderCreateResult(
        fldId: json['fld_id'],
      );
  final String? fldId;

  StreamwishFolderCreateResult copyWith({
    String? fldId,
  }) =>
      StreamwishFolderCreateResult(
        fldId: fldId ?? this.fldId,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'fld_id': fldId,
      };
}
