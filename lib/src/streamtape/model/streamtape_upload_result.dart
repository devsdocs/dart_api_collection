// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class StreamtapeUploadResult {
  StreamtapeUploadResult({
    this.msg,
    this.result,
    this.status,
  });

  factory StreamtapeUploadResult.fromJson(String str) =>
      StreamtapeUploadResult.fromMap(json.decode(str));

  factory StreamtapeUploadResult.fromMap(Map<String, dynamic> json) =>
      StreamtapeUploadResult(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : StreamtapeUploadResultDetail.fromMap(json['result']),
        status: json['status'],
      );
  final String? msg;
  final StreamtapeUploadResultDetail? result;
  final int? status;

  StreamtapeUploadResult copyWith({
    String? msg,
    StreamtapeUploadResultDetail? result,
    int? status,
  }) =>
      StreamtapeUploadResult(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result?.toMap(),
        'status': status,
      };
}

class StreamtapeUploadResultDetail {
  StreamtapeUploadResultDetail({
    this.contentType,
    this.id,
    this.name,
    this.sha256,
    this.size,
    this.url,
  });

  factory StreamtapeUploadResultDetail.fromJson(String str) =>
      StreamtapeUploadResultDetail.fromMap(json.decode(str));

  factory StreamtapeUploadResultDetail.fromMap(Map<String, dynamic> json) =>
      StreamtapeUploadResultDetail(
        contentType: json['content_type'],
        id: json['id'],
        name: json['name'],
        sha256: json['sha256'],
        size: json['size'],
        url: json['url'],
      );
  final String? contentType;
  final String? id;
  final String? name;
  final String? sha256;
  final String? size;
  final String? url;

  StreamtapeUploadResultDetail copyWith({
    String? contentType,
    String? id,
    String? name,
    String? sha256,
    String? size,
    String? url,
  }) =>
      StreamtapeUploadResultDetail(
        contentType: contentType ?? this.contentType,
        id: id ?? this.id,
        name: name ?? this.name,
        sha256: sha256 ?? this.sha256,
        size: size ?? this.size,
        url: url ?? this.url,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'content_type': contentType,
        'id': id,
        'name': name,
        'sha256': sha256,
        'size': size,
        'url': url,
      };
}
