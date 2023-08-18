// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishFileDmca {
  StreamwishFileDmca({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishFileDmca.fromJson(String str) =>
      StreamwishFileDmca.fromMap(json.decode(str));

  factory StreamwishFileDmca.fromMap(Map<String, dynamic> json) =>
      StreamwishFileDmca(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<StreamwishFileDmcaResult>.from(
                json['result']!.map((x) => StreamwishFileDmcaResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<StreamwishFileDmcaResult>? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishFileDmca copyWith({
    String? msg,
    List<StreamwishFileDmcaResult>? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishFileDmca(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        serverTime: serverTime ?? this.serverTime,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toMap())),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}

class StreamwishFileDmcaResult {
  StreamwishFileDmcaResult({
    this.delInSec,
    this.delTime,
    this.fileCode,
  });

  factory StreamwishFileDmcaResult.fromJson(String str) =>
      StreamwishFileDmcaResult.fromMap(json.decode(str));

  factory StreamwishFileDmcaResult.fromMap(Map<String, dynamic> json) =>
      StreamwishFileDmcaResult(
        delInSec: json['del_in_sec'],
        delTime:
            json['del_time'] == null ? null : DateTime.parse(json['del_time']),
        fileCode: json['file_code'],
      );
  final String? delInSec;
  final DateTime? delTime;
  final String? fileCode;

  StreamwishFileDmcaResult copyWith({
    String? delInSec,
    DateTime? delTime,
    String? fileCode,
  }) =>
      StreamwishFileDmcaResult(
        delInSec: delInSec ?? this.delInSec,
        delTime: delTime ?? this.delTime,
        fileCode: fileCode ?? this.fileCode,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'del_in_sec': delInSec,
        'del_time': delTime?.toIso8601String(),
        'file_code': fileCode,
      };
}
