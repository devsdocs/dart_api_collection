// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class MixdropFolderRename {
  MixdropFolderRename({
    this.result,
    this.success,
  });

  factory MixdropFolderRename.fromJson(String str) =>
      MixdropFolderRename.fromMap(json.decode(str));

  factory MixdropFolderRename.fromMap(Map<String, dynamic> json) =>
      MixdropFolderRename(
        result: json['result'] == null
            ? null
            : FolderRenameResult.fromMap(json['result']),
        success: json['success'],
      );
  final FolderRenameResult? result;
  final bool? success;

  MixdropFolderRename copyWith({
    FolderRenameResult? result,
    bool? success,
  }) =>
      MixdropFolderRename(
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
