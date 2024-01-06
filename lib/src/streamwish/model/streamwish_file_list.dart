// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishFileList {
  StreamwishFileList({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishFileList.fromJson(String str) =>
      StreamwishFileList.fromMap(json.decode(str));

  factory StreamwishFileList.fromMap(Map<String, dynamic> json) =>
      StreamwishFileList(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : StreamwishFileListResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final StreamwishFileListResult? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishFileList copyWith({
    String? msg,
    StreamwishFileListResult? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishFileList(
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

class StreamwishFileListResult {
  StreamwishFileListResult({
    this.files,
    this.pages,
    this.results,
    this.resultsTotal,
  });

  factory StreamwishFileListResult.fromJson(String str) =>
      StreamwishFileListResult.fromMap(json.decode(str));

  factory StreamwishFileListResult.fromMap(Map<String, dynamic> json) =>
      StreamwishFileListResult(
        files: json['files'] == null
            ? []
            : List<StreamwishFileListResultFileElement>.from(
                json['files']!
                    .map((x) => StreamwishFileListResultFileElement.fromMap(x)),
              ),
        pages: json['pages'],
        results: json['results'],
        resultsTotal: json['results_total'],
      );
  final List<StreamwishFileListResultFileElement>? files;
  final int? pages;
  final int? results;
  final int? resultsTotal;

  StreamwishFileListResult copyWith({
    List<StreamwishFileListResultFileElement>? files,
    int? pages,
    int? results,
    int? resultsTotal,
  }) =>
      StreamwishFileListResult(
        files: files ?? this.files,
        pages: pages ?? this.pages,
        results: results ?? this.results,
        resultsTotal: resultsTotal ?? this.resultsTotal,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'files': files == null
            ? []
            : List<dynamic>.from(files!.map((x) => x.toMap())),
        'pages': pages,
        'results': results,
        'results_total': resultsTotal,
      };
}

class StreamwishFileListResultFileElement {
  StreamwishFileListResultFileElement({
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

  factory StreamwishFileListResultFileElement.fromJson(String str) =>
      StreamwishFileListResultFileElement.fromMap(json.decode(str));

  factory StreamwishFileListResultFileElement.fromMap(
    Map<String, dynamic> json,
  ) =>
      StreamwishFileListResultFileElement(
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
  final int? fldId;
  final int? length;
  final String? link;
  final int? public;
  final String? thumbnail;
  final String? title;
  final DateTime? uploaded;
  final int? views;

  StreamwishFileListResultFileElement copyWith({
    int? canplay,
    String? fileCode,
    int? fldId,
    int? length,
    String? link,
    int? public,
    String? thumbnail,
    String? title,
    DateTime? uploaded,
    int? views,
  }) =>
      StreamwishFileListResultFileElement(
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
