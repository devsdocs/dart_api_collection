// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishFolderEdit {
  StreamwishFolderEdit({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishFolderEdit.fromJson(String str) =>
      StreamwishFolderEdit.fromMap(json.decode(str));

  factory StreamwishFolderEdit.fromMap(Map<String, dynamic> json) =>
      StreamwishFolderEdit(
        msg: json['msg'],
        result: json['result'],
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final String? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishFolderEdit copyWith({
    String? msg,
    String? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishFolderEdit(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        serverTime: serverTime ?? this.serverTime,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result,
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}
