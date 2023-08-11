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
            : List<FileStatusResult>.from(
                json['result']!.map((x) => FileStatusResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<FileStatusResult>? result;
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

  String toReadableFormat() {
    if (result == null) {
      return msg!;
    } else {
      if (result!.isEmpty) {
        return 'No result!';
      } else if (result!.length == 1) {
        return result!.single.toReadableFormat();
      } else {
        final data = result!
            .map((e) => e.toReadableFormat(index: result!.indexOf(e) + 1));
        return data.join('\n').trim();
      }
    }
  }
}

class FileStatusResult {
  FileStatusResult({
    this.filecode,
    this.status,
  });

  factory FileStatusResult.fromJson(String str) =>
      FileStatusResult.fromMap(json.decode(str));

  factory FileStatusResult.fromMap(Map<String, dynamic> json) =>
      FileStatusResult(
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
