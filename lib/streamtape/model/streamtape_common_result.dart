// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class StreamtapeCommonResult {
  StreamtapeCommonResult({
    this.msg,
    this.result,
    this.status,
  });

  factory StreamtapeCommonResult.fromJson(String str) =>
      StreamtapeCommonResult.fromMap(json.decode(str));

  factory StreamtapeCommonResult.fromMap(Map<String, dynamic> json) =>
      StreamtapeCommonResult(
        msg: json['msg'],
        result: json['result'],
        status: json['status'],
      );
  final String? msg;
  final bool? result;
  final int? status;

  StreamtapeCommonResult copyWith({
    String? msg,
    bool? result,
    int? status,
  }) =>
      StreamtapeCommonResult(
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
