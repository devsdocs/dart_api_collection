// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class FileRename {
  FileRename({
    this.result,
    this.success,
  });

  factory FileRename.fromJson(String str) =>
      FileRename.fromMap(json.decode(str));

  factory FileRename.fromMap(Map<String, dynamic> json) => FileRename(
        result: json['result'] == null
            ? null
            : FileRenameResult.fromMap(json['result']),
        success: json['success'],
      );
  final FileRenameResult? result;
  final bool? success;

  FileRename copyWith({
    FileRenameResult? result,
    bool? success,
  }) =>
      FileRename(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': result?.toMap(),
        'success': success,
      };
}

class FileRenameResult {
  FileRenameResult({
    this.msg,
    this.title,
  });

  factory FileRenameResult.fromJson(String str) =>
      FileRenameResult.fromMap(json.decode(str));

  factory FileRenameResult.fromMap(Map<String, dynamic> json) =>
      FileRenameResult(
        msg: json['msg'],
        title: json['title'],
      );
  final String? msg;
  final String? title;

  FileRenameResult copyWith({
    String? msg,
    String? title,
  }) =>
      FileRenameResult(
        msg: msg ?? this.msg,
        title: title ?? this.title,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'title': title,
      };
}
