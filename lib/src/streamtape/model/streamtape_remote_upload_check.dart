// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class StreamtapeRemoteUploadCheck {
  StreamtapeRemoteUploadCheck({
    this.status,
    this.msg,
    this.result,
  });

  factory StreamtapeRemoteUploadCheck.fromJson(String str) =>
      StreamtapeRemoteUploadCheck.fromMap(json.decode(str));

  factory StreamtapeRemoteUploadCheck.fromMap(Map<String, dynamic> json) =>
      StreamtapeRemoteUploadCheck(
        status: json['status'],
        msg: json['msg'],
        result: Map.from(json['result']!).map(
          (k, v) => MapEntry<String, StreamtapeRemoteUploadCheckResult>(
            k,
            StreamtapeRemoteUploadCheckResult.fromMap(v),
          ),
        ),
      );
  final int? status;
  final String? msg;
  final Map<String, StreamtapeRemoteUploadCheckResult>? result;

  StreamtapeRemoteUploadCheck copyWith({
    int? status,
    String? msg,
    Map<String, StreamtapeRemoteUploadCheckResult>? result,
  }) =>
      StreamtapeRemoteUploadCheck(
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

class StreamtapeRemoteUploadCheckResult {
  StreamtapeRemoteUploadCheckResult({
    this.id,
    this.remoteurl,
    this.status,
    this.bytesLoaded,
    this.bytesTotal,
    this.folderid,
    this.added,
    this.lastUpdate,
    this.extid,
    this.url,
    this.linkid,
  });

  factory StreamtapeRemoteUploadCheckResult.fromJson(String str) =>
      StreamtapeRemoteUploadCheckResult.fromMap(json.decode(str));

  factory StreamtapeRemoteUploadCheckResult.fromMap(
    Map<String, dynamic> json,
  ) =>
      StreamtapeRemoteUploadCheckResult(
        id: json['id'],
        remoteurl: json['remoteurl'],
        status: json['status'],
        bytesLoaded: json['bytes_loaded'],
        bytesTotal: json['bytes_total'],
        folderid: json['folderid'],
        added: json['added'] == null ? null : DateTime.parse(json['added']),
        lastUpdate: json['last_update'] == null
            ? null
            : DateTime.parse(json['last_update']),
        extid: json['extid'],
        url: json['url'],
        linkid: json['linkid'],
      );
  final String? id;
  final String? remoteurl;
  final String? status;
  final int? bytesLoaded;
  final int? bytesTotal;
  final String? folderid;
  final DateTime? added;
  final DateTime? lastUpdate;
  final bool? extid;
  final bool? url;
  final bool? linkid;

  StreamtapeRemoteUploadCheckResult copyWith({
    String? id,
    String? remoteurl,
    String? status,
    int? bytesLoaded,
    int? bytesTotal,
    String? folderid,
    DateTime? added,
    DateTime? lastUpdate,
    bool? extid,
    bool? url,
    bool? linkid,
  }) =>
      StreamtapeRemoteUploadCheckResult(
        id: id ?? this.id,
        remoteurl: remoteurl ?? this.remoteurl,
        status: status ?? this.status,
        bytesLoaded: bytesLoaded ?? this.bytesLoaded,
        bytesTotal: bytesTotal ?? this.bytesTotal,
        folderid: folderid ?? this.folderid,
        added: added ?? this.added,
        lastUpdate: lastUpdate ?? this.lastUpdate,
        extid: extid ?? this.extid,
        url: url ?? this.url,
        linkid: linkid ?? this.linkid,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'remoteurl': remoteurl,
        'status': status,
        'bytes_loaded': bytesLoaded,
        'bytes_total': bytesTotal,
        'folderid': folderid,
        'added': added?.toIso8601String(),
        'last_update': lastUpdate?.toIso8601String(),
        'extid': extid,
        'url': url,
        'linkid': linkid,
      };
}
