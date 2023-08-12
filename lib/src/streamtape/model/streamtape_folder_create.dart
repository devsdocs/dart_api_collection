// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class StreamtapeFolderCreate {
  StreamtapeFolderCreate({
    this.status,
    this.msg,
    this.result,
  });

  factory StreamtapeFolderCreate.fromJson(String str) =>
      StreamtapeFolderCreate.fromMap(json.decode(str));

  factory StreamtapeFolderCreate.fromMap(Map<String, dynamic> json) =>
      StreamtapeFolderCreate(
        status: json['status'],
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : StreamtapeFolderCreateResult.fromMap(json['result']),
      );
  final int? status;
  final String? msg;
  final StreamtapeFolderCreateResult? result;

  StreamtapeFolderCreate copyWith({
    int? status,
    String? msg,
    StreamtapeFolderCreateResult? result,
  }) =>
      StreamtapeFolderCreate(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        result: result ?? this.result,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'status': status,
        'msg': msg,
        'result': result?.toMap(),
      };
}

class StreamtapeFolderCreateResult {
  StreamtapeFolderCreateResult({
    this.folderid,
  });

  factory StreamtapeFolderCreateResult.fromJson(String str) =>
      StreamtapeFolderCreateResult.fromMap(json.decode(str));

  factory StreamtapeFolderCreateResult.fromMap(Map<String, dynamic> json) =>
      StreamtapeFolderCreateResult(
        folderid: json['folderid'],
      );
  final String? folderid;

  StreamtapeFolderCreateResult copyWith({
    String? folderid,
  }) =>
      StreamtapeFolderCreateResult(
        folderid: folderid ?? this.folderid,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'folderid': folderid,
      };
}
