// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class FileInfo {
  FileInfo({
    this.result,
    this.success,
  });

  factory FileInfo.fromJson(String str) => FileInfo.fromMap(json.decode(str));

  factory FileInfo.fromMap(Map<String, dynamic> json) => FileInfo(
        result: Map.from(json['result']!).map(
          (k, v) =>
              MapEntry<String, FileInfoResult>(k, FileInfoResult.fromMap(v)),
        ),
        success: json['success'],
      );
  final Map<String, FileInfoResult>? result;
  final bool? success;

  FileInfo copyWith({
    Map<String, FileInfoResult>? result,
    bool? success,
  }) =>
      FileInfo(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': Map.from(result!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        'success': success,
      };
}

class FileInfoResult {
  FileInfoResult({
    this.added,
    this.deleted,
    this.duration,
    this.fileref,
    this.isaudio,
    this.isvideo,
    this.size,
    this.status,
    this.subtitle,
    this.thumb,
    this.title,
    this.url,
    this.yourfile,
  });

  factory FileInfoResult.fromJson(String str) =>
      FileInfoResult.fromMap(json.decode(str));

  factory FileInfoResult.fromMap(Map<String, dynamic> json) => FileInfoResult(
        added: json['added'],
        deleted: json['deleted'],
        duration: json['duration'],
        fileref: json['fileref'],
        isaudio: json['isaudio'],
        isvideo: json['isvideo'],
        size: json['size'],
        status: json['status'],
        subtitle: json['subtitle'],
        thumb: json['thumb'],
        title: json['title'],
        url: json['url'],
        yourfile: json['yourfile'],
      );
  final String? added;
  final bool? deleted;
  final String? duration;
  final String? fileref;
  final bool? isaudio;
  final bool? isvideo;
  final String? size;
  final String? status;
  final bool? subtitle;
  final String? thumb;
  final String? title;
  final String? url;
  final bool? yourfile;

  FileInfoResult copyWith({
    String? added,
    bool? deleted,
    String? duration,
    String? fileref,
    bool? isaudio,
    bool? isvideo,
    String? size,
    String? status,
    bool? subtitle,
    String? thumb,
    String? title,
    String? url,
    bool? yourfile,
  }) =>
      FileInfoResult(
        added: added ?? this.added,
        deleted: deleted ?? this.deleted,
        duration: duration ?? this.duration,
        fileref: fileref ?? this.fileref,
        isaudio: isaudio ?? this.isaudio,
        isvideo: isvideo ?? this.isvideo,
        size: size ?? this.size,
        status: status ?? this.status,
        subtitle: subtitle ?? this.subtitle,
        thumb: thumb ?? this.thumb,
        title: title ?? this.title,
        url: url ?? this.url,
        yourfile: yourfile ?? this.yourfile,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'added': added,
        'deleted': deleted,
        'duration': duration,
        'fileref': fileref,
        'isaudio': isaudio,
        'isvideo': isvideo,
        'size': size,
        'status': status,
        'subtitle': subtitle,
        'thumb': thumb,
        'title': title,
        'url': url,
        'yourfile': yourfile,
      };
}
