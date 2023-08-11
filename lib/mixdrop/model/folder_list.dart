// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class FolderList {
  FolderList({
    this.pages,
    this.result,
    this.success,
  });

  factory FolderList.fromJson(String str) =>
      FolderList.fromMap(json.decode(str));

  factory FolderList.fromMap(Map<String, dynamic> json) => FolderList(
        pages: json['pages'],
        result: json['result'] == null
            ? null
            : FolderListResult.fromMap(json['result']),
        success: json['success'],
      );
  final int? pages;
  final FolderListResult? result;
  final bool? success;

  FolderList copyWith({
    int? pages,
    FolderListResult? result,
    bool? success,
  }) =>
      FolderList(
        pages: pages ?? this.pages,
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'pages': pages,
        'result': result?.toMap(),
        'success': success,
      };
}

class FolderListResult {
  FolderListResult({
    this.files,
    this.folders,
  });

  factory FolderListResult.fromJson(String str) =>
      FolderListResult.fromMap(json.decode(str));

  factory FolderListResult.fromMap(Map<String, dynamic> json) =>
      FolderListResult(
        files: json['files'] == null
            ? []
            : List<FileElement>.from(
                json['files']!.map((x) => FileElement.fromMap(x)),
              ),
        folders: json['folders'] == null
            ? []
            : List<Folder>.from(json['folders']!.map((x) => Folder.fromMap(x))),
      );
  final List<FileElement>? files;
  final List<Folder>? folders;

  FolderListResult copyWith({
    List<FileElement>? files,
    List<Folder>? folders,
  }) =>
      FolderListResult(
        files: files ?? this.files,
        folders: folders ?? this.folders,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'files': files == null
            ? []
            : List<dynamic>.from(files!.map((x) => x.toMap())),
        'folders': folders == null
            ? []
            : List<dynamic>.from(folders!.map((x) => x.toMap())),
      };
}

class FileElement {
  FileElement({
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
  });

  factory FileElement.fromJson(String str) =>
      FileElement.fromMap(json.decode(str));

  factory FileElement.fromMap(Map<String, dynamic> json) => FileElement(
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

  FileElement copyWith({
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
  }) =>
      FileElement(
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
      };
}

class Folder {
  Folder({
    this.id,
    this.title,
  });

  factory Folder.fromJson(String str) => Folder.fromMap(json.decode(str));

  factory Folder.fromMap(Map<String, dynamic> json) => Folder(
        id: json['id'],
        title: json['title'],
      );
  final String? id;
  final String? title;

  Folder copyWith({
    String? id,
    String? title,
  }) =>
      Folder(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
      };
}
