// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class StreamtapeDownloadLink {
  StreamtapeDownloadLink({
    this.msg,
    this.result,
    this.status,
  });

  factory StreamtapeDownloadLink.fromJson(String str) =>
      StreamtapeDownloadLink.fromMap(json.decode(str));

  factory StreamtapeDownloadLink.fromMap(Map<String, dynamic> json) =>
      StreamtapeDownloadLink(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : StreamtapeDownloadLinkResult.fromMap(json['result']),
        status: json['status'],
      );
  final String? msg;
  final StreamtapeDownloadLinkResult? result;
  final int? status;

  StreamtapeDownloadLink copyWith({
    String? msg,
    StreamtapeDownloadLinkResult? result,
    int? status,
  }) =>
      StreamtapeDownloadLink(
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

class StreamtapeDownloadLinkResult {
  StreamtapeDownloadLinkResult({
    this.name,
    this.size,
    this.url,
  });

  factory StreamtapeDownloadLinkResult.fromJson(String str) =>
      StreamtapeDownloadLinkResult.fromMap(json.decode(str));

  factory StreamtapeDownloadLinkResult.fromMap(Map<String, dynamic> json) =>
      StreamtapeDownloadLinkResult(
        name: json['name'],
        size: json['size'],
        url: json['url'],
      );
  final String? name;
  final int? size;
  final String? url;

  StreamtapeDownloadLinkResult copyWith({
    String? name,
    int? size,
    String? url,
  }) =>
      StreamtapeDownloadLinkResult(
        name: name ?? this.name,
        size: size ?? this.size,
        url: url ?? this.url,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'name': name,
        'size': size,
        'url': url,
      };
}
