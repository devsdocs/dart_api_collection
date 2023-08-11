// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class StreamtapeFileRename {
  StreamtapeFileRename({
    this.msg,
    this.result,
    this.status,
  });

  factory StreamtapeFileRename.fromJson(String str) =>
      StreamtapeFileRename.fromMap(json.decode(str));

  factory StreamtapeFileRename.fromMap(Map<String, dynamic> json) =>
      StreamtapeFileRename(
        msg: json['msg'],
        result: json['result'],
        status: json['status'],
      );
  final String? msg;
  final bool? result;
  final int? status;

  StreamtapeFileRename copyWith({
    String? msg,
    bool? result,
    int? status,
  }) =>
      StreamtapeFileRename(
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
