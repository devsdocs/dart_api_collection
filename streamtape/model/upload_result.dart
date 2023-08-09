// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class UploadResult {
  UploadResult({
    this.msg,
    this.result,
    this.status,
  });

  factory UploadResult.fromJson(String str) =>
      UploadResult.fromMap(json.decode(str));

  factory UploadResult.fromMap(Map<String, dynamic> json) => UploadResult(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : UploadResultDetail.fromMap(json['result']),
        status: json['status'],
      );
  final String? msg;
  final UploadResultDetail? result;
  final int? status;

  UploadResult copyWith({
    String? msg,
    UploadResultDetail? result,
    int? status,
  }) =>
      UploadResult(
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

class UploadResultDetail {
  UploadResultDetail({
    this.contentType,
    this.id,
    this.name,
    this.sha256,
    this.size,
    this.url,
  });

  factory UploadResultDetail.fromJson(String str) =>
      UploadResultDetail.fromMap(json.decode(str));

  factory UploadResultDetail.fromMap(Map<String, dynamic> json) =>
      UploadResultDetail(
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

  UploadResultDetail copyWith({
    String? contentType,
    String? id,
    String? name,
    String? sha256,
    String? size,
    String? url,
  }) =>
      UploadResultDetail(
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
