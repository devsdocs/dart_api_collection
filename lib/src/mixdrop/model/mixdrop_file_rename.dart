// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class MixdropFileRename {
  MixdropFileRename({
    this.result,
    this.success,
  });

  factory MixdropFileRename.fromJson(String str) =>
      MixdropFileRename.fromMap(json.decode(str));

  factory MixdropFileRename.fromMap(Map<String, dynamic> json) =>
      MixdropFileRename(
        result: json['result'] == null
            ? null
            : MixdropFileRenameResult.fromMap(json['result']),
        success: json['success'],
      );
  final MixdropFileRenameResult? result;
  final bool? success;

  MixdropFileRename copyWith({
    MixdropFileRenameResult? result,
    bool? success,
  }) =>
      MixdropFileRename(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': result?.toMap(),
        'success': success,
      };
}

class MixdropFileRenameResult {
  MixdropFileRenameResult({
    this.msg,
    this.title,
  });

  factory MixdropFileRenameResult.fromJson(String str) =>
      MixdropFileRenameResult.fromMap(json.decode(str));

  factory MixdropFileRenameResult.fromMap(Map<String, dynamic> json) =>
      MixdropFileRenameResult(
        msg: json['msg'],
        title: json['title'],
      );
  final String? msg;
  final String? title;

  MixdropFileRenameResult copyWith({
    String? msg,
    String? title,
  }) =>
      MixdropFileRenameResult(
        msg: msg ?? this.msg,
        title: title ?? this.title,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'title': title,
      };
}
