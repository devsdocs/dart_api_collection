// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class FolderCreate {
  FolderCreate({
    this.result,
    this.success,
  });

  factory FolderCreate.fromJson(String str) =>
      FolderCreate.fromMap(json.decode(str));

  factory FolderCreate.fromMap(Map<String, dynamic> json) => FolderCreate(
        result: json['result'] == null
            ? null
            : FolderCreateResult.fromMap(json['result']),
        success: json['success'],
      );
  final FolderCreateResult? result;
  final bool? success;

  FolderCreate copyWith({
    FolderCreateResult? result,
    bool? success,
  }) =>
      FolderCreate(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': result?.toMap(),
        'success': success,
      };
}

class FolderCreateResult {
  FolderCreateResult({
    this.id,
    this.msg,
  });

  factory FolderCreateResult.fromJson(String str) =>
      FolderCreateResult.fromMap(json.decode(str));

  factory FolderCreateResult.fromMap(Map<String, dynamic> json) =>
      FolderCreateResult(
        id: json['id'],
        msg: json['msg'],
      );
  final int? id;
  final String? msg;

  FolderCreateResult copyWith({
    int? id,
    String? msg,
  }) =>
      FolderCreateResult(
        id: id ?? this.id,
        msg: msg ?? this.msg,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'msg': msg,
      };
}
