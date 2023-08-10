// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class FileRename {
  FileRename({
    this.msg,
    this.result,
    this.status,
  });

  factory FileRename.fromJson(String str) =>
      FileRename.fromMap(json.decode(str));

  factory FileRename.fromMap(Map<String, dynamic> json) => FileRename(
        msg: json['msg'],
        result: json['result'],
        status: json['status'],
      );
  final String? msg;
  final bool? result;
  final int? status;

  FileRename copyWith({
    String? msg,
    bool? result,
    int? status,
  }) =>
      FileRename(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result,
        'status': status,
      };
}
