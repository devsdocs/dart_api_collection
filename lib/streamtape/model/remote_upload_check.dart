// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class RemoteUploadCheck {

  RemoteUploadCheck({
    this.status,
    this.msg,
    this.result,
  });

  factory RemoteUploadCheck.fromJson(String str) =>
      RemoteUploadCheck.fromMap(json.decode(str));

  factory RemoteUploadCheck.fromMap(Map<String, dynamic> json) =>
      RemoteUploadCheck(
        status: json['status'],
        msg: json['msg'],
        result: Map.from(json['result']!).map((k, v) =>
            MapEntry<String, RemoteUploadCheckResult>(
                k, RemoteUploadCheckResult.fromMap(v),),),
      );
  final int? status;
  final String? msg;
  final Map<String, RemoteUploadCheckResult>? result;

  RemoteUploadCheck copyWith({
    int? status,
    String? msg,
    Map<String, RemoteUploadCheckResult>? result,
  }) =>
      RemoteUploadCheck(
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

class RemoteUploadCheckResult {

  RemoteUploadCheckResult({
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

  factory RemoteUploadCheckResult.fromJson(String str) =>
      RemoteUploadCheckResult.fromMap(json.decode(str));

  factory RemoteUploadCheckResult.fromMap(Map<String, dynamic> json) =>
      RemoteUploadCheckResult(
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

  RemoteUploadCheckResult copyWith({
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
      RemoteUploadCheckResult(
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
