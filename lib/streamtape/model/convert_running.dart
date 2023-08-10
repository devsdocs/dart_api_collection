// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class ConvertRunning {
  ConvertRunning({
    this.msg,
    this.result,
    this.status,
  });
  factory ConvertRunning.fromJson(String str) =>
      ConvertRunning.fromMap(json.decode(str));

  factory ConvertRunning.fromMap(Map<String, dynamic> json) => ConvertRunning(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<ConvertRunningResult>.from(
                json['result']!.map((x) => ConvertRunningResult.fromMap(x)),
              ),
        status: json['status'],
      );
  final String? msg;
  final List<ConvertRunningResult>? result;
  final int? status;

  ConvertRunning copyWith({
    String? msg,
    List<ConvertRunningResult>? result,
    int? status,
  }) =>
      ConvertRunning(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toMap())),
        'status': status,
      };
}

class ConvertRunningResult {
  ConvertRunningResult({
    this.folderid,
    this.link,
    this.linkid,
    this.name,
    this.progress,
    this.retries,
    this.status,
  });

  factory ConvertRunningResult.fromJson(String str) =>
      ConvertRunningResult.fromMap(json.decode(str));

  factory ConvertRunningResult.fromMap(Map<String, dynamic> json) =>
      ConvertRunningResult(
        folderid: json['folderid'],
        link: json['link'],
        linkid: json['linkid'],
        name: json['name'],
        progress: json['progress']?.toDouble(),
        retries: json['retries'],
        status: json['status'],
      );
  final String? folderid;
  final String? link;
  final String? linkid;
  final String? name;
  final double? progress;
  final int? retries;
  final String? status;

  ConvertRunningResult copyWith({
    String? folderid,
    String? link,
    String? linkid,
    String? name,
    double? progress,
    int? retries,
    String? status,
  }) =>
      ConvertRunningResult(
        folderid: folderid ?? this.folderid,
        link: link ?? this.link,
        linkid: linkid ?? this.linkid,
        name: name ?? this.name,
        progress: progress ?? this.progress,
        retries: retries ?? this.retries,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'folderid': folderid,
        'link': link,
        'linkid': linkid,
        'name': name,
        'progress': progress,
        'retries': retries,
        'status': status,
      };
}
