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
            : DownloadLinkResult.fromMap(json['result']),
        status: json['status'],
      );
  final String? msg;
  final DownloadLinkResult? result;
  final int? status;

  StreamtapeDownloadLink copyWith({
    String? msg,
    DownloadLinkResult? result,
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

class DownloadLinkResult {
  DownloadLinkResult({
    this.name,
    this.size,
    this.url,
  });

  factory DownloadLinkResult.fromJson(String str) =>
      DownloadLinkResult.fromMap(json.decode(str));

  factory DownloadLinkResult.fromMap(Map<String, dynamic> json) =>
      DownloadLinkResult(
        name: json['name'],
        size: json['size'],
        url: json['url'],
      );
  final String? name;
  final int? size;
  final String? url;

  DownloadLinkResult copyWith({
    String? name,
    int? size,
    String? url,
  }) =>
      DownloadLinkResult(
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
