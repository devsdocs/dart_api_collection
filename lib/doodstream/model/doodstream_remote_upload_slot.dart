// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamRemoteUploadSlot {
  DoodstreamRemoteUploadSlot({
    this.msg,
    this.serverTime,
    this.status,
    this.totalSlots,
    this.usedSlots,
  });

  factory DoodstreamRemoteUploadSlot.fromJson(String str) =>
      DoodstreamRemoteUploadSlot.fromMap(json.decode(str));

  factory DoodstreamRemoteUploadSlot.fromMap(Map<String, dynamic> json) =>
      DoodstreamRemoteUploadSlot(
        msg: json['msg'],
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
        totalSlots: json['total_slots'],
        usedSlots: json['used_slots'],
      );
  final String? msg;
  final DateTime? serverTime;
  final int? status;
  final String? totalSlots;
  final int? usedSlots;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'server_time': serverTime?.toIso8601String(),
        'status': status,
        'total_slots': totalSlots,
        'used_slots': usedSlots,
      };

  String toReadableFormat() {
    final data =
        'Total Slots: $totalSlots\nUsed Slots: $usedSlots\nRemaining Slots: ${int.parse(totalSlots!) - usedSlots!}';

    return data;
  }
}
