// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class MixdropFolderCreate {
  MixdropFolderCreate({
    this.result,
    this.success,
  });

  factory MixdropFolderCreate.fromJson(String str) =>
      MixdropFolderCreate.fromMap(json.decode(str));

  factory MixdropFolderCreate.fromMap(Map<String, dynamic> json) =>
      MixdropFolderCreate(
        result: json['result'] == null
            ? null
            : MixdropFolderCreateResult.fromMap(json['result']),
        success: json['success'],
      );
  final MixdropFolderCreateResult? result;
  final bool? success;

  MixdropFolderCreate copyWith({
    MixdropFolderCreateResult? result,
    bool? success,
  }) =>
      MixdropFolderCreate(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': result?.toMap(),
        'success': success,
      };
}

class MixdropFolderCreateResult {
  MixdropFolderCreateResult({
    this.id,
    this.msg,
  });

  factory MixdropFolderCreateResult.fromJson(String str) =>
      MixdropFolderCreateResult.fromMap(json.decode(str));

  factory MixdropFolderCreateResult.fromMap(Map<String, dynamic> json) =>
      MixdropFolderCreateResult(
        id: json['id'],
        msg: json['msg'],
      );
  final int? id;
  final String? msg;

  MixdropFolderCreateResult copyWith({
    int? id,
    String? msg,
  }) =>
      MixdropFolderCreateResult(
        id: id ?? this.id,
        msg: msg ?? this.msg,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'msg': msg,
      };
}
