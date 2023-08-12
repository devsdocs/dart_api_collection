// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class StreamtapeConvertRunning {
  StreamtapeConvertRunning({
    this.msg,
    this.result,
    this.status,
  });
  factory StreamtapeConvertRunning.fromJson(String str) =>
      StreamtapeConvertRunning.fromMap(json.decode(str));

  factory StreamtapeConvertRunning.fromMap(Map<String, dynamic> json) =>
      StreamtapeConvertRunning(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<StreamtapeConvertRunningResult>.from(
                json['result']!
                    .map((x) => StreamtapeConvertRunningResult.fromMap(x)),
              ),
        status: json['status'],
      );
  final String? msg;
  final List<StreamtapeConvertRunningResult>? result;
  final int? status;

  StreamtapeConvertRunning copyWith({
    String? msg,
    List<StreamtapeConvertRunningResult>? result,
    int? status,
  }) =>
      StreamtapeConvertRunning(
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

class StreamtapeConvertRunningResult {
  StreamtapeConvertRunningResult({
    this.folderid,
    this.link,
    this.linkid,
    this.name,
    this.progress,
    this.retries,
    this.status,
  });

  factory StreamtapeConvertRunningResult.fromJson(String str) =>
      StreamtapeConvertRunningResult.fromMap(json.decode(str));

  factory StreamtapeConvertRunningResult.fromMap(Map<String, dynamic> json) =>
      StreamtapeConvertRunningResult(
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

  StreamtapeConvertRunningResult copyWith({
    String? folderid,
    String? link,
    String? linkid,
    String? name,
    double? progress,
    int? retries,
    String? status,
  }) =>
      StreamtapeConvertRunningResult(
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
