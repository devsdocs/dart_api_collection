// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamListFile {
  DoodstreamListFile({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory DoodstreamListFile.fromJson(String str) =>
      DoodstreamListFile.fromMap(json.decode(str));

  factory DoodstreamListFile.fromMap(Map<String, dynamic> json) =>
      DoodstreamListFile(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : DoodstreamListFileResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final DoodstreamListFileResult? result;
  final DateTime? serverTime;
  final int? status;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result?.toMap(),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}

class DoodstreamListFileResult {
  DoodstreamListFileResult({
    this.files,
    this.results,
    this.resultsTotal,
    this.totalPages,
  });

  factory DoodstreamListFileResult.fromJson(String str) =>
      DoodstreamListFileResult.fromMap(json.decode(str));

  factory DoodstreamListFileResult.fromMap(Map<String, dynamic> json) =>
      DoodstreamListFileResult(
        files: json['files'] == null
            ? []
            : List<DoodstreamListFileElement>.from(
                json['files']!.map((x) => DoodstreamListFileElement.fromMap(x)),
              ),
        results: json['results'],
        resultsTotal: json['results_total'],
        totalPages: json['total_pages'],
      );
  final List<DoodstreamListFileElement>? files;
  final int? results;
  final int? resultsTotal;
  final int? totalPages;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'files': files == null
            ? []
            : List<dynamic>.from(files!.map((x) => x.toMap())),
        'results': results,
        'results_total': resultsTotal,
        'total_pages': totalPages,
      };
}

class DoodstreamListFileElement {
  DoodstreamListFileElement({
    this.canplay,
    this.downloadUrl,
    this.fileCode,
    this.fldId,
    this.length,
    this.public,
    this.singleImg,
    this.title,
    this.uploaded,
    this.views,
  });

  factory DoodstreamListFileElement.fromJson(String str) =>
      DoodstreamListFileElement.fromMap(json.decode(str));

  factory DoodstreamListFileElement.fromMap(Map<String, dynamic> json) =>
      DoodstreamListFileElement(
        canplay: json['canplay'],
        downloadUrl: json['download_url'],
        fileCode: json['file_code'],
        fldId: json['fld_id'],
        length: json['length'],
        public: json['public'],
        singleImg: json['single_img'],
        title: json['title'],
        uploaded:
            json['uploaded'] == null ? null : DateTime.parse(json['uploaded']),
        views: json['views'],
      );
  final int? canplay;
  final String? downloadUrl;
  final String? fileCode;
  final int? fldId;
  final int? length;
  final int? public;
  final String? singleImg;
  final String? title;
  final DateTime? uploaded;
  final int? views;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'canplay': canplay,
        'download_url': downloadUrl,
        'file_code': fileCode,
        'fld_id': fldId,
        'length': length,
        'public': public,
        'single_img': singleImg,
        'title': title,
        'uploaded': uploaded?.toIso8601String(),
        'views': views,
      };
}
