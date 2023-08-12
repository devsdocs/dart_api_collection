// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class StreamtapeFileInfo {
  StreamtapeFileInfo({
    this.status,
    this.msg,
    this.result,
  });

  factory StreamtapeFileInfo.fromJson(String str) =>
      StreamtapeFileInfo.fromMap(json.decode(str));

  factory StreamtapeFileInfo.fromMap(Map<String, dynamic> json) =>
      StreamtapeFileInfo(
        status: json['status'],
        msg: json['msg'],
        result: Map.from(json['result']!).map(
          (k, v) => MapEntry<String, StreamtapeFileInfoResult>(
            k,
            StreamtapeFileInfoResult.fromMap(v),
          ),
        ),
      );
  final int? status;
  final String? msg;
  final Map<String, StreamtapeFileInfoResult>? result;

  StreamtapeFileInfo copyWith({
    int? status,
    String? msg,
    Map<String, StreamtapeFileInfoResult>? result,
  }) =>
      StreamtapeFileInfo(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        result: result ?? this.result,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'status': status,
        'msg': msg,
        'result': Map.from(result!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}

class StreamtapeFileInfoResult {
  StreamtapeFileInfoResult({
    this.id,
    this.status,
    this.name,
    this.size,
    this.converted,
    this.thumb,
    this.type,
  });

  factory StreamtapeFileInfoResult.fromJson(String str) =>
      StreamtapeFileInfoResult.fromMap(json.decode(str));

  factory StreamtapeFileInfoResult.fromMap(Map<String, dynamic> json) =>
      StreamtapeFileInfoResult(
        id: json['id'],
        status: json['status'],
        name: json['name'] is String
            ? json['name'] as String
            : json['name'] as bool,
        size: json['size'],
        converted: json['converted'],
        thumb: json['thumb'],
        type: json['type'],
      );
  final String? id;
  final int? status;
  final dynamic name;
  final int? size;
  final bool? converted;
  final String? thumb;
  final String? type;

  StreamtapeFileInfoResult copyWith({
    String? id,
    int? status,
    dynamic name,
    int? size,
    bool? converted,
    String? thumb,
    String? type,
  }) =>
      StreamtapeFileInfoResult(
        id: id ?? this.id,
        status: status ?? this.status,
        name: name ?? this.name,
        size: size ?? this.size,
        converted: converted ?? this.converted,
        thumb: thumb ?? this.thumb,
        type: type ?? this.type,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'status': status,
        'name': name,
        'size': size,
        'converted': converted,
        'thumb': thumb,
        'type': type,
      };
}
