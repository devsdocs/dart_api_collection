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
            : MixdropFolderRenameResult.fromMap(json['result']),
        success: json['success'],
      );
  final MixdropFolderRenameResult? result;
  final bool? success;

  MixdropFolderRename copyWith({
    MixdropFolderRenameResult? result,
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

class MixdropFolderRenameResult {
  MixdropFolderRenameResult({
    this.msg,
    this.title,
  });

  factory MixdropFolderRenameResult.fromJson(String str) =>
      MixdropFolderRenameResult.fromMap(json.decode(str));

  factory MixdropFolderRenameResult.fromMap(Map<String, dynamic> json) =>
      MixdropFolderRenameResult(
        msg: json['msg'],
        title: json['title'],
      );
  final String? msg;
  final String? title;

  MixdropFolderRenameResult copyWith({
    String? msg,
    String? title,
  }) =>
      MixdropFolderRenameResult(
        msg: msg ?? this.msg,
        title: title ?? this.title,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'title': title,
      };
}
