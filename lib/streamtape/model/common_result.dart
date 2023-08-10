// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class CommonResult {
  CommonResult({
    this.msg,
    this.result,
    this.status,
  });

  factory CommonResult.fromJson(String str) =>
      CommonResult.fromMap(json.decode(str));

  factory CommonResult.fromMap(Map<String, dynamic> json) => CommonResult(
        msg: json['msg'],
        result: json['result'],
        status: json['status'],
      );
  final String? msg;
  final bool? result;
  final int? status;

  CommonResult copyWith({
    String? msg,
    bool? result,
    int? status,
  }) =>
      CommonResult(
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
