// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class StreamtapeConvertFailed {
  StreamtapeConvertFailed({
    this.msg,
    this.result,
    this.status,
  });

  factory StreamtapeConvertFailed.fromJson(String str) =>
      StreamtapeConvertFailed.fromMap(json.decode(str));

  factory StreamtapeConvertFailed.fromMap(Map<String, dynamic> json) =>
      StreamtapeConvertFailed(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<StreamtapeConvertFailedResult>.from(
                json['result']!
                    .map((x) => StreamtapeConvertFailedResult.fromMap(x)),
              ),
        status: json['status'],
      );
  final String? msg;
  final List<StreamtapeConvertFailedResult>? result;
  final int? status;

  StreamtapeConvertFailed copyWith({
    String? msg,
    List<StreamtapeConvertFailedResult>? result,
    int? status,
  }) =>
      StreamtapeConvertFailed(
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

class StreamtapeConvertFailedResult {
  StreamtapeConvertFailedResult({
    this.folderid,
    this.link,
    this.linkid,
    this.name,
    this.progress,
    this.retries,
    this.status,
  });

  factory StreamtapeConvertFailedResult.fromJson(String str) =>
      StreamtapeConvertFailedResult.fromMap(json.decode(str));

  factory StreamtapeConvertFailedResult.fromMap(Map<String, dynamic> json) =>
      StreamtapeConvertFailedResult(
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

  StreamtapeConvertFailedResult copyWith({
    String? folderid,
    String? link,
    String? linkid,
    String? name,
    int? progress,
    int? retries,
    String? status,
  }) =>
      StreamtapeConvertFailedResult(
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
