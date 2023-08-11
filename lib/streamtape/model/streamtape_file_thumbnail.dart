// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class StreamtapeFileThumbnail {
  StreamtapeFileThumbnail({
    this.msg,
    this.result,
    this.status,
  });

  factory StreamtapeFileThumbnail.fromJson(String str) =>
      StreamtapeFileThumbnail.fromMap(json.decode(str));

  factory StreamtapeFileThumbnail.fromMap(Map<String, dynamic> json) =>
      StreamtapeFileThumbnail(
        msg: json['msg'],
        result: json['result'],
        status: json['status'],
      );
  final String? msg;
  final String? result;
  final int? status;

  StreamtapeFileThumbnail copyWith({
    String? msg,
    String? result,
    int? status,
  }) =>
      StreamtapeFileThumbnail(
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
