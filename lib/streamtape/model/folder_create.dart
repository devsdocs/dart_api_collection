// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class FolderCreate {
  FolderCreate({
    this.status,
    this.msg,
    this.result,
  });

  factory FolderCreate.fromJson(String str) =>
      FolderCreate.fromMap(json.decode(str));

  factory FolderCreate.fromMap(Map<String, dynamic> json) => FolderCreate(
        status: json['status'],
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : FolderCreateResult.fromMap(json['result']),
      );
  final int? status;
  final String? msg;
  final FolderCreateResult? result;

  FolderCreate copyWith({
    int? status,
    String? msg,
    FolderCreateResult? result,
  }) =>
      FolderCreate(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        result: result ?? this.result,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'status': status,
        'msg': msg,
        'result': result?.toMap(),
      };
}

class FolderCreateResult {
  FolderCreateResult({
    this.folderid,
  });

  factory FolderCreateResult.fromJson(String str) =>
      FolderCreateResult.fromMap(json.decode(str));

  factory FolderCreateResult.fromMap(Map<String, dynamic> json) =>
      FolderCreateResult(
        folderid: json['folderid'],
      );
  final String? folderid;

  FolderCreateResult copyWith({
    String? folderid,
  }) =>
      FolderCreateResult(
        folderid: folderid ?? this.folderid,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'folderid': folderid,
      };
}
