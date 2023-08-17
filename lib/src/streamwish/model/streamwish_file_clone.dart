// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishFileClone {
  StreamwishFileClone({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishFileClone.fromJson(String str) =>
      StreamwishFileClone.fromMap(json.decode(str));

  factory StreamwishFileClone.fromMap(Map<String, dynamic> json) =>
      StreamwishFileClone(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : StreamwishFileCloneResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final StreamwishFileCloneResult? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishFileClone copyWith({
    String? msg,
    StreamwishFileCloneResult? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishFileClone(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        serverTime: serverTime ?? this.serverTime,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result?.toMap(),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}

class StreamwishFileCloneResult {
  StreamwishFileCloneResult({
    this.filecode,
    this.url,
  });

  factory StreamwishFileCloneResult.fromJson(String str) =>
      StreamwishFileCloneResult.fromMap(json.decode(str));

  factory StreamwishFileCloneResult.fromMap(Map<String, dynamic> json) =>
      StreamwishFileCloneResult(
        filecode: json['filecode'],
        url: json['url'],
      );
  final String? filecode;
  final String? url;

  StreamwishFileCloneResult copyWith({
    String? filecode,
    String? url,
  }) =>
      StreamwishFileCloneResult(
        filecode: filecode ?? this.filecode,
        url: url ?? this.url,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'filecode': filecode,
        'url': url,
      };
}
