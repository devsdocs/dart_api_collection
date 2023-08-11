// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls, constant_identifier_names

part of '../../streamtape.dart';

class FileAndFolderList {
  FileAndFolderList({
    this.status,
    this.msg,
    this.result,
  });

  factory FileAndFolderList.fromJson(String str) =>
      FileAndFolderList.fromMap(json.decode(str));

  factory FileAndFolderList.fromMap(Map<String, dynamic> json) =>
      FileAndFolderList(
        status: json['status'],
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : FileAndFolderListResult.fromMap(json['result']),
      );
  final int? status;
  final String? msg;
  final FileAndFolderListResult? result;

  FileAndFolderList copyWith({
    int? status,
    String? msg,
    FileAndFolderListResult? result,
  }) =>
      FileAndFolderList(
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

class FileAndFolderListResult {
  FileAndFolderListResult({
    this.folders,
    this.files,
  });

  factory FileAndFolderListResult.fromJson(String str) =>
      FileAndFolderListResult.fromMap(json.decode(str));

  factory FileAndFolderListResult.fromMap(Map<String, dynamic> json) =>
      FileAndFolderListResult(
        folders: json['folders'] == null
            ? []
            : List<FolderElement>.from(
                json['folders']!.map((x) => FolderElement.fromMap(x)),
              ),
        files: json['files'] == null
            ? []
            : List<FileElement>.from(
                json['files']!.map((x) => FileElement.fromMap(x)),
              ),
      );
  final List<FolderElement>? folders;
  final List<FileElement>? files;

  FileAndFolderListResult copyWith({
    List<FolderElement>? folders,
    List<FileElement>? files,
  }) =>
      FileAndFolderListResult(
        folders: folders ?? this.folders,
        files: files ?? this.files,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'folders': folders == null
            ? []
            : List<dynamic>.from(folders!.map((x) => x.toMap())),
        'files': files == null
            ? []
            : List<dynamic>.from(files!.map((x) => x.toMap())),
      };
}

class FileElement {
  FileElement({
    this.name,
    this.size,
    this.link,
    this.createdAt,
    this.downloads,
    this.linkid,
    this.convert,
  });

  factory FileElement.fromJson(String str) =>
      FileElement.fromMap(json.decode(str));

  factory FileElement.fromMap(Map<String, dynamic> json) => FileElement(
        name: json['name'],
        size: json['size'],
        link: json['link'],
        createdAt: json['created_at'],
        downloads: json['downloads'],
        linkid: json['linkid'],
        convert: convertValues.map[json['convert']],
      );
  final String? name;
  final int? size;
  final String? link;
  final int? createdAt;
  final int? downloads;
  final String? linkid;
  final Convert? convert;

  FileElement copyWith({
    String? name,
    int? size,
    String? link,
    int? createdAt,
    int? downloads,
    String? linkid,
    Convert? convert,
  }) =>
      FileElement(
        name: name ?? this.name,
        size: size ?? this.size,
        link: link ?? this.link,
        createdAt: createdAt ?? this.createdAt,
        downloads: downloads ?? this.downloads,
        linkid: linkid ?? this.linkid,
        convert: convert ?? this.convert,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'name': name,
        'size': size,
        'link': link,
        'created_at': createdAt,
        'downloads': downloads,
        'linkid': linkid,
        'convert': convertValues.reverse[convert],
      };
}

enum Convert { CONVERTED, NO_NEED, PENDING }

final convertValues = EnumValues({
  'converted': Convert.CONVERTED,
  'no-need': Convert.NO_NEED,
  'pending': Convert.PENDING
});

class FolderElement {
  FolderElement({
    this.id,
    this.name,
  });

  factory FolderElement.fromJson(String str) =>
      FolderElement.fromMap(json.decode(str));

  factory FolderElement.fromMap(Map<String, dynamic> json) => FolderElement(
        id: json['id'],
        name: json['name'],
      );
  final String? id;
  final String? name;

  FolderElement copyWith({
    String? id,
    String? name,
  }) =>
      FolderElement(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };
}

class EnumValues<T> {
  EnumValues(this.map);
  Map<String, T> map;
  late Map<T, String> reverseMap;

  Map<T, String> get reverse {
    return reverseMap = map.map((k, v) => MapEntry(v, k));
  }
}
