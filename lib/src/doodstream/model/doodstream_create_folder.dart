// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamCreateFolder {
  DoodstreamCreateFolder({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory DoodstreamCreateFolder.fromJson(String str) =>
      DoodstreamCreateFolder.fromMap(json.decode(str));

  factory DoodstreamCreateFolder.fromMap(Map<String, dynamic> json) =>
      DoodstreamCreateFolder(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : DoodstreamCreateFolderResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final DoodstreamCreateFolderResult? result;
  final DateTime? serverTime;
  final int? status;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result?.toMap(),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}

class DoodstreamCreateFolderResult {
  DoodstreamCreateFolderResult({
    this.fldId,
  });

  factory DoodstreamCreateFolderResult.fromJson(String str) =>
      DoodstreamCreateFolderResult.fromMap(json.decode(str));

  factory DoodstreamCreateFolderResult.fromMap(Map<String, dynamic> json) =>
      DoodstreamCreateFolderResult(
        fldId: json['fld_id'],
      );
  final String? fldId;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'fld_id': fldId,
      };
}
