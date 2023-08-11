// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class StreamtapeDownloadTicket {
  StreamtapeDownloadTicket({
    this.msg,
    this.result,
    this.status,
  });

  factory StreamtapeDownloadTicket.fromJson(String str) =>
      StreamtapeDownloadTicket.fromMap(json.decode(str));

  factory StreamtapeDownloadTicket.fromMap(Map<String, dynamic> json) =>
      StreamtapeDownloadTicket(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : DownloadTicketResult.fromMap(json['result']),
        status: json['status'],
      );
  final String? msg;
  final DownloadTicketResult? result;
  final int? status;

  StreamtapeDownloadTicket copyWith({
    String? msg,
    DownloadTicketResult? result,
    int? status,
  }) =>
      StreamtapeDownloadTicket(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result?.toMap(),
        'status': status,
      };
}

class DownloadTicketResult {
  DownloadTicketResult({
    this.ticket,
    this.validUntil,
    this.waitTime,
  });

  factory DownloadTicketResult.fromJson(String str) =>
      DownloadTicketResult.fromMap(json.decode(str));

  factory DownloadTicketResult.fromMap(Map<String, dynamic> json) =>
      DownloadTicketResult(
        ticket: json['ticket'],
        validUntil: json['valid_until'] == null
            ? null
            : DateTime.parse(json['valid_until']),
        waitTime: json['wait_time'],
      );
  final String? ticket;
  final DateTime? validUntil;
  final int? waitTime;

  DownloadTicketResult copyWith({
    String? ticket,
    DateTime? validUntil,
    int? waitTime,
  }) =>
      DownloadTicketResult(
        ticket: ticket ?? this.ticket,
        validUntil: validUntil ?? this.validUntil,
        waitTime: waitTime ?? this.waitTime,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'ticket': ticket,
        'valid_until': validUntil?.toIso8601String(),
        'wait_time': waitTime,
      };
}
