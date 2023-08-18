// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishFileDelete {
  StreamwishFileDelete({
    this.msg,
    this.serverTime,
    this.status,
  });

  factory StreamwishFileDelete.fromJson(String str) =>
      StreamwishFileDelete.fromMap(json.decode(str));

  factory StreamwishFileDelete.fromMap(Map<String, dynamic> json) =>
      StreamwishFileDelete(
        msg: json['msg'],
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final DateTime? serverTime;
  final int? status;

  StreamwishFileDelete copyWith({
    String? msg,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishFileDelete(
        msg: msg ?? this.msg,
        serverTime: serverTime ?? this.serverTime,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}
