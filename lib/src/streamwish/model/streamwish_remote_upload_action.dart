// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishRemoteUploadAction {
  StreamwishRemoteUploadAction({
    this.msg,
    this.requestsAvailable,
    this.serverTime,
    this.status,
  });

  factory StreamwishRemoteUploadAction.fromJson(String str) =>
      StreamwishRemoteUploadAction.fromMap(json.decode(str));

  factory StreamwishRemoteUploadAction.fromMap(Map<String, dynamic> json) =>
      StreamwishRemoteUploadAction(
        msg: json['msg'],
        requestsAvailable: json['requests_available'],
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final int? requestsAvailable;
  final DateTime? serverTime;
  final int? status;

  StreamwishRemoteUploadAction copyWith({
    String? msg,
    int? requestsAvailable,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishRemoteUploadAction(
        msg: msg ?? this.msg,
        requestsAvailable: requestsAvailable ?? this.requestsAvailable,
        serverTime: serverTime ?? this.serverTime,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'requests_available': requestsAvailable,
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}
