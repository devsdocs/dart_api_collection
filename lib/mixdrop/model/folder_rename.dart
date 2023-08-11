// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class FolderRename {
  FolderRename({
    this.result,
    this.success,
  });

  factory FolderRename.fromJson(String str) =>
      FolderRename.fromMap(json.decode(str));

  factory FolderRename.fromMap(Map<String, dynamic> json) => FolderRename(
        result: json['result'] == null
            ? null
            : FolderRenameResult.fromMap(json['result']),
        success: json['success'],
      );
  final FolderRenameResult? result;
  final bool? success;

  FolderRename copyWith({
    FolderRenameResult? result,
    bool? success,
  }) =>
      FolderRename(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': result?.toMap(),
        'success': success,
      };
}

class FolderRenameResult {
  FolderRenameResult({
    this.msg,
    this.title,
  });

  factory FolderRenameResult.fromJson(String str) =>
      FolderRenameResult.fromMap(json.decode(str));

  factory FolderRenameResult.fromMap(Map<String, dynamic> json) =>
      FolderRenameResult(
        msg: json['msg'],
        title: json['title'],
      );
  final String? msg;
  final String? title;

  FolderRenameResult copyWith({
    String? msg,
    String? title,
  }) =>
      FolderRenameResult(
        msg: msg ?? this.msg,
        title: title ?? this.title,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'title': title,
      };
}
