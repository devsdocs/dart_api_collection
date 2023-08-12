// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamDmcaList {
  DoodstreamDmcaList({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory DoodstreamDmcaList.fromJson(String str) =>
      DoodstreamDmcaList.fromMap(json.decode(str));

  factory DoodstreamDmcaList.fromMap(Map<String, dynamic> json) =>
      DoodstreamDmcaList(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<DoodstreamDmcaListResult>.from(
                json['result']!.map((x) => DoodstreamDmcaListResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<DoodstreamDmcaListResult>? result;
  final DateTime? serverTime;
  final int? status;

  DoodstreamDmcaList copyWith({
    String? msg,
    List<DoodstreamDmcaListResult>? result,
    DateTime? serverTime,
    int? status,
  }) =>
      DoodstreamDmcaList(
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

class DoodstreamDmcaListResult {
  DoodstreamDmcaListResult({
    this.disabledOn,
    this.fileCode,
    this.fldId,
    this.protectedDownload,
    this.protectedEmbed,
    this.reportedOn,
  });

  factory DoodstreamDmcaListResult.fromJson(String str) =>
      DoodstreamDmcaListResult.fromMap(json.decode(str));

  factory DoodstreamDmcaListResult.fromMap(Map<String, dynamic> json) =>
      DoodstreamDmcaListResult(
        disabledOn: json['disabled_on'] == null
            ? null
            : DateTime.parse(json['disabled_on']),
        fileCode: json['file_code'],
        fldId: json['fld_id'],
        protectedDownload: json['protected_download'],
        protectedEmbed: json['protected_embed'],
        reportedOn: json['reported_on'] == null
            ? null
            : DateTime.parse(json['reported_on']),
      );
  final DateTime? disabledOn;
  final String? fileCode;
  final String? fldId;
  final String? protectedDownload;
  final String? protectedEmbed;
  final DateTime? reportedOn;

  DoodstreamDmcaListResult copyWith({
    DateTime? disabledOn,
    String? fileCode,
    String? fldId,
    String? protectedDownload,
    String? protectedEmbed,
    DateTime? reportedOn,
  }) =>
      DoodstreamDmcaListResult(
        disabledOn: disabledOn ?? this.disabledOn,
        fileCode: fileCode ?? this.fileCode,
        fldId: fldId ?? this.fldId,
        protectedDownload: protectedDownload ?? this.protectedDownload,
        protectedEmbed: protectedEmbed ?? this.protectedEmbed,
        reportedOn: reportedOn ?? this.reportedOn,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'disabled_on': disabledOn?.toIso8601String(),
        'file_code': fileCode,
        'fld_id': fldId,
        'protected_download': protectedDownload,
        'protected_embed': protectedEmbed,
        'reported_on': reportedOn?.toIso8601String(),
      };
}
