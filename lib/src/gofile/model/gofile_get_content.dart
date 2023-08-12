// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../gofile.dart';

class GofileGetContent {
  GofileGetContent({
    this.status,
    this.data,
  });

  factory GofileGetContent.fromJson(String str) =>
      GofileGetContent.fromMap(json.decode(str));

  factory GofileGetContent.fromMap(Map<String, dynamic> json) =>
      GofileGetContent(
        status: json['status'],
        data: json['data'] == null
            ? null
            : GofileGetContentData.fromMap(json['data']),
      );
  final String? status;
  final GofileGetContentData? data;

  GofileGetContent copyWith({
    String? status,
    GofileGetContentData? data,
  }) =>
      GofileGetContent(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'status': status,
        'data': data?.toMap(),
      };
}

class GofileGetContentData {
  GofileGetContentData({
    this.isOwner,
    this.id,
    this.type,
    this.name,
    this.parentFolder,
    this.code,
    this.createTime,
    this.public,
    this.childs,
    this.totalDownloadCount,
    this.totalSize,
    this.contents,
  });

  factory GofileGetContentData.fromJson(String str) =>
      GofileGetContentData.fromMap(json.decode(str));

  factory GofileGetContentData.fromMap(Map<String, dynamic> json) =>
      GofileGetContentData(
        isOwner: json['isOwner'],
        id: json['id'],
        type: json['type'],
        name: json['name'],
        parentFolder: json['parentFolder'],
        code: json['code'],
        createTime: json['createTime'],
        public: json['public'],
        childs: json['childs'] == null
            ? []
            : List<String>.from(json['childs']!.map((x) => x)),
        totalDownloadCount: json['totalDownloadCount'],
        totalSize: json['totalSize'],
        contents: Map.from(json['contents']!).map(
          (k, v) => MapEntry<String, GofileGetContentDataContent>(
            k,
            GofileGetContentDataContent.fromMap(v),
          ),
        ),
      );
  final bool? isOwner;
  final String? id;
  final String? type;
  final String? name;
  final String? parentFolder;
  final String? code;
  final int? createTime;
  final bool? public;
  final List<String>? childs;
  final int? totalDownloadCount;
  final int? totalSize;
  final Map<String, GofileGetContentDataContent>? contents;

  GofileGetContentData copyWith({
    bool? isOwner,
    String? id,
    String? type,
    String? name,
    String? parentFolder,
    String? code,
    int? createTime,
    bool? public,
    List<String>? childs,
    int? totalDownloadCount,
    int? totalSize,
    Map<String, GofileGetContentDataContent>? contents,
  }) =>
      GofileGetContentData(
        isOwner: isOwner ?? this.isOwner,
        id: id ?? this.id,
        type: type ?? this.type,
        name: name ?? this.name,
        parentFolder: parentFolder ?? this.parentFolder,
        code: code ?? this.code,
        createTime: createTime ?? this.createTime,
        public: public ?? this.public,
        childs: childs ?? this.childs,
        totalDownloadCount: totalDownloadCount ?? this.totalDownloadCount,
        totalSize: totalSize ?? this.totalSize,
        contents: contents ?? this.contents,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'isOwner': isOwner,
        'id': id,
        'type': type,
        'name': name,
        'parentFolder': parentFolder,
        'code': code,
        'createTime': createTime,
        'public': public,
        'childs':
            childs == null ? [] : List<dynamic>.from(childs!.map((x) => x)),
        'totalDownloadCount': totalDownloadCount,
        'totalSize': totalSize,
        'contents': Map.from(contents!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}

class GofileGetContentDataContent {
  GofileGetContentDataContent({
    this.id,
    this.type,
    this.name,
    this.parentFolder,
    this.createTime,
    this.size,
    this.downloadCount,
    this.md5,
    this.mimetype,
    this.serverChoosen,
    this.directLink,
    this.link,
  });

  factory GofileGetContentDataContent.fromJson(String str) =>
      GofileGetContentDataContent.fromMap(json.decode(str));

  factory GofileGetContentDataContent.fromMap(Map<String, dynamic> json) =>
      GofileGetContentDataContent(
        id: json['id'],
        type: json['type'],
        name: json['name'],
        parentFolder: json['parentFolder'],
        createTime: json['createTime'],
        size: json['size'],
        downloadCount: json['downloadCount'],
        md5: json['md5'],
        mimetype: json['mimetype'],
        serverChoosen: json['serverChoosen'],
        directLink: json['directLink'],
        link: json['link'],
      );
  final String? id;
  final String? type;
  final String? name;
  final String? parentFolder;
  final int? createTime;
  final int? size;
  final int? downloadCount;
  final String? md5;
  final String? mimetype;
  final String? serverChoosen;
  final String? directLink;
  final String? link;

  GofileGetContentDataContent copyWith({
    String? id,
    String? type,
    String? name,
    String? parentFolder,
    int? createTime,
    int? size,
    int? downloadCount,
    String? md5,
    String? mimetype,
    String? serverChoosen,
    String? directLink,
    String? link,
  }) =>
      GofileGetContentDataContent(
        id: id ?? this.id,
        type: type ?? this.type,
        name: name ?? this.name,
        parentFolder: parentFolder ?? this.parentFolder,
        createTime: createTime ?? this.createTime,
        size: size ?? this.size,
        downloadCount: downloadCount ?? this.downloadCount,
        md5: md5 ?? this.md5,
        mimetype: mimetype ?? this.mimetype,
        serverChoosen: serverChoosen ?? this.serverChoosen,
        directLink: directLink ?? this.directLink,
        link: link ?? this.link,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'type': type,
        'name': name,
        'parentFolder': parentFolder,
        'createTime': createTime,
        'size': size,
        'downloadCount': downloadCount,
        'md5': md5,
        'mimetype': mimetype,
        'serverChoosen': serverChoosen,
        'directLink': directLink,
        'link': link,
      };
}
