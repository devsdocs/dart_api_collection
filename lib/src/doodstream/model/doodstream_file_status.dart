// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamFileStatus {
  DoodstreamFileStatus({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory DoodstreamFileStatus.fromJson(String str) =>
      DoodstreamFileStatus.fromMap(json.decode(str));

  factory DoodstreamFileStatus.fromMap(Map<String, dynamic> json) =>
      DoodstreamFileStatus(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<DoodstreamFileStatusResult>.from(
                json['result']!
                    .map((x) => DoodstreamFileStatusResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<DoodstreamFileStatusResult>? result;
  final DateTime? serverTime;
  final int? status;

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

class DoodstreamFileStatusResult {
  DoodstreamFileStatusResult({
    this.filecode,
    this.status,
  });

  factory DoodstreamFileStatusResult.fromJson(String str) =>
      DoodstreamFileStatusResult.fromMap(json.decode(str));

  factory DoodstreamFileStatusResult.fromMap(Map<String, dynamic> json) =>
      DoodstreamFileStatusResult(
        filecode: json['filecode'],
        status: json['status'],
      );
  final String? filecode;
  final String? status;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'filecode': filecode,
        'status': status,
      };

  String toReadableFormat({int? index}) {
    final num = index == null ? '' : '$index. ';

    final end = index == null ? '' : '\n';

    final data = '${num}File code: $filecode, Status: $status$end';
    return data;
  }
}
