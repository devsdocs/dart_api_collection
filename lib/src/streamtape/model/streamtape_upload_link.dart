// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class StreamtapeUploadLink {
  StreamtapeUploadLink({
    this.msg,
    this.result,
    this.status,
  });

  factory StreamtapeUploadLink.fromJson(String str) =>
      StreamtapeUploadLink.fromMap(json.decode(str));

  factory StreamtapeUploadLink.fromMap(Map<String, dynamic> json) =>
      StreamtapeUploadLink(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : StreamtapeUploadLinkResult.fromMap(json['result']),
        status: json['status'],
      );
  final String? msg;
  final StreamtapeUploadLinkResult? result;
  final int? status;

  StreamtapeUploadLink copyWith({
    String? msg,
    StreamtapeUploadLinkResult? result,
    int? status,
  }) =>
      StreamtapeUploadLink(
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

class StreamtapeUploadLinkResult {
  StreamtapeUploadLinkResult({
    this.url,
    this.validUntil,
  });

  factory StreamtapeUploadLinkResult.fromJson(String str) =>
      StreamtapeUploadLinkResult.fromMap(json.decode(str));

  factory StreamtapeUploadLinkResult.fromMap(Map<String, dynamic> json) =>
      StreamtapeUploadLinkResult(
        url: json['url'],
        validUntil: json['valid_until'] == null
            ? null
            : DateTime.parse(json['valid_until']),
      );
  final String? url;
  final DateTime? validUntil;

  StreamtapeUploadLinkResult copyWith({
    String? url,
    DateTime? validUntil,
  }) =>
      StreamtapeUploadLinkResult(
        url: url ?? this.url,
        validUntil: validUntil ?? this.validUntil,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'url': url,
        'valid_until': validUntil?.toIso8601String(),
      };
}
