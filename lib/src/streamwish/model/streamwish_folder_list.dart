// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishFolderList {
  StreamwishFolderList({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishFolderList.fromJson(String str) =>
      StreamwishFolderList.fromMap(json.decode(str));

  factory StreamwishFolderList.fromMap(Map<String, dynamic> json) =>
      StreamwishFolderList(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : StreamwishFolderListResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final StreamwishFolderListResult? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishFolderList copyWith({
    String? msg,
    StreamwishFolderListResult? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishFolderList(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        serverTime: serverTime ?? this.serverTime,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result?.toMap(),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}

class StreamwishFolderListResult {
  StreamwishFolderListResult({
    this.files,
    this.folders,
  });

  factory StreamwishFolderListResult.fromJson(String str) =>
      StreamwishFolderListResult.fromMap(json.decode(str));

  factory StreamwishFolderListResult.fromMap(Map<String, dynamic> json) =>
      StreamwishFolderListResult(
        files: json['files'] == null
            ? []
            : List<StreamwishFolderListResultFileElement>.from(
                json['files']!.map(
                  (x) => StreamwishFolderListResultFileElement.fromMap(x),
                ),
              ),
        folders: json['folders'] == null
            ? []
            : List<StreamwishFolderListResultFolderElement>.from(
                json['folders']!.map(
                  (x) => StreamwishFolderListResultFolderElement.fromMap(x),
                ),
              ),
      );
  final List<StreamwishFolderListResultFileElement>? files;
  final List<StreamwishFolderListResultFolderElement>? folders;

  StreamwishFolderListResult copyWith({
    List<StreamwishFolderListResultFileElement>? files,
    List<StreamwishFolderListResultFolderElement>? folders,
  }) =>
      StreamwishFolderListResult(
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

class StreamwishFolderListResultFileElement {
  StreamwishFolderListResultFileElement({
    this.canplay,
    this.fileCode,
    this.fldId,
    this.length,
    this.link,
    this.public,
    this.thumbnail,
    this.title,
    this.uploaded,
    this.views,
  });

  factory StreamwishFolderListResultFileElement.fromJson(String str) =>
      StreamwishFolderListResultFileElement.fromMap(json.decode(str));

  factory StreamwishFolderListResultFileElement.fromMap(
    Map<String, dynamic> json,
  ) =>
      StreamwishFolderListResultFileElement(
        canplay: json['canplay'],
        fileCode: json['file_code'],
        fldId: json['fld_id'],
        length: json['length'],
        link: json['link'],
        public: json['public'],
        thumbnail: json['thumbnail'],
        title: json['title'],
        uploaded:
            json['uploaded'] == null ? null : DateTime.parse(json['uploaded']),
        views: json['views'],
      );
  final int? canplay;
  final String? fileCode;
  final String? fldId;
  final String? length;
  final String? link;
  final String? public;
  final String? thumbnail;
  final String? title;
  final DateTime? uploaded;
  final String? views;

  StreamwishFolderListResultFileElement copyWith({
    int? canplay,
    String? fileCode,
    String? fldId,
    String? length,
    String? link,
    String? public,
    String? thumbnail,
    String? title,
    DateTime? uploaded,
    String? views,
  }) =>
      StreamwishFolderListResultFileElement(
        canplay: canplay ?? this.canplay,
        fileCode: fileCode ?? this.fileCode,
        fldId: fldId ?? this.fldId,
        length: length ?? this.length,
        link: link ?? this.link,
        public: public ?? this.public,
        thumbnail: thumbnail ?? this.thumbnail,
        title: title ?? this.title,
        uploaded: uploaded ?? this.uploaded,
        views: views ?? this.views,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'canplay': canplay,
        'file_code': fileCode,
        'fld_id': fldId,
        'length': length,
        'link': link,
        'public': public,
        'thumbnail': thumbnail,
        'title': title,
        'uploaded': uploaded?.toIso8601String(),
        'views': views,
      };
}

class StreamwishFolderListResultFolderElement {
  StreamwishFolderListResultFolderElement({
    this.code,
    this.fldId,
    this.name,
  });

  factory StreamwishFolderListResultFolderElement.fromJson(String str) =>
      StreamwishFolderListResultFolderElement.fromMap(json.decode(str));

  factory StreamwishFolderListResultFolderElement.fromMap(
    Map<String, dynamic> json,
  ) =>
      StreamwishFolderListResultFolderElement(
        code: json['code'],
        fldId: json['fld_id'],
        name: json['name'],
      );
  final String? code;
  final String? fldId;
  final String? name;

  StreamwishFolderListResultFolderElement copyWith({
    String? code,
    String? fldId,
    String? name,
  }) =>
      StreamwishFolderListResultFolderElement(
        code: code ?? this.code,
        fldId: fldId ?? this.fldId,
        name: name ?? this.name,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'code': code,
        'fld_id': fldId,
        'name': name,
      };
}
