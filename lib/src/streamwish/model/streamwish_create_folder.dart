// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishCreateFolder {
  StreamwishCreateFolder({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishCreateFolder.fromJson(String str) =>
      StreamwishCreateFolder.fromMap(json.decode(str));

  factory StreamwishCreateFolder.fromMap(Map<String, dynamic> json) =>
      StreamwishCreateFolder(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : StreamwishCreateFolderResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final StreamwishCreateFolderResult? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishCreateFolder copyWith({
    String? msg,
    StreamwishCreateFolderResult? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishCreateFolder(
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

class StreamwishCreateFolderResult {
  StreamwishCreateFolderResult({
    this.fldId,
  });

  factory StreamwishCreateFolderResult.fromJson(String str) =>
      StreamwishCreateFolderResult.fromMap(json.decode(str));

  factory StreamwishCreateFolderResult.fromMap(Map<String, dynamic> json) =>
      StreamwishCreateFolderResult(
        fldId: json['fld_id'],
      );
  final String? fldId;

  StreamwishCreateFolderResult copyWith({
    String? fldId,
  }) =>
      StreamwishCreateFolderResult(
        fldId: fldId ?? this.fldId,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'fld_id': fldId,
      };
}
