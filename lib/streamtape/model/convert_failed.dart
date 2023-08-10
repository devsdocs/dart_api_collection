// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class ConvertFailed {
  ConvertFailed({
    this.msg,
    this.result,
    this.status,
  });

  factory ConvertFailed.fromJson(String str) =>
      ConvertFailed.fromMap(json.decode(str));

  factory ConvertFailed.fromMap(Map<String, dynamic> json) => ConvertFailed(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<ConvertFailedResult>.from(
                json['result']!.map((x) => ConvertFailedResult.fromMap(x)),
              ),
        status: json['status'],
      );
  final String? msg;
  final List<ConvertFailedResult>? result;
  final int? status;

  ConvertFailed copyWith({
    String? msg,
    List<ConvertFailedResult>? result,
    int? status,
  }) =>
      ConvertFailed(
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

class ConvertFailedResult {
  ConvertFailedResult({
    this.folderid,
    this.link,
    this.linkid,
    this.name,
    this.progress,
    this.retries,
    this.status,
  });

  factory ConvertFailedResult.fromJson(String str) =>
      ConvertFailedResult.fromMap(json.decode(str));

  factory ConvertFailedResult.fromMap(Map<String, dynamic> json) =>
      ConvertFailedResult(
        folderid: json['folderid'],
        link: json['link'],
        linkid: json['linkid'],
        name: json['name'],
        progress: json['progress'],
        retries: json['retries'],
        status: json['status'],
      );
  final String? folderid;
  final String? link;
  final String? linkid;
  final String? name;
  final int? progress;
  final int? retries;
  final String? status;

  ConvertFailedResult copyWith({
    String? folderid,
    String? link,
    String? linkid,
    String? name,
    int? progress,
    int? retries,
    String? status,
  }) =>
      ConvertFailedResult(
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
