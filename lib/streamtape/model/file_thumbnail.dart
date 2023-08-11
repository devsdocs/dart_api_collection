// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class FileThumbnail {
  FileThumbnail({
    this.msg,
    this.result,
    this.status,
  });

  factory FileThumbnail.fromJson(String str) =>
      FileThumbnail.fromMap(json.decode(str));

  factory FileThumbnail.fromMap(Map<String, dynamic> json) => FileThumbnail(
        msg: json['msg'],
        result: json['result'],
        status: json['status'],
      );
  final String? msg;
  final String? result;
  final int? status;

  FileThumbnail copyWith({
    String? msg,
    String? result,
    int? status,
  }) =>
      FileThumbnail(
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
