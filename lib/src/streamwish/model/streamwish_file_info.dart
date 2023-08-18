// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishFileInfo {
  StreamwishFileInfo({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishFileInfo.fromJson(String str) =>
      StreamwishFileInfo.fromMap(json.decode(str));

  factory StreamwishFileInfo.fromMap(Map<String, dynamic> json) =>
      StreamwishFileInfo(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<StreamwishFileInfoResult>.from(
                json['result']!.map((x) => StreamwishFileInfoResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<StreamwishFileInfoResult>? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishFileInfo copyWith({
    String? msg,
    List<StreamwishFileInfoResult>? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishFileInfo(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        serverTime: serverTime ?? this.serverTime,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toMap())),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}

class StreamwishFileInfoResult {
  StreamwishFileInfoResult({
    this.canplay,
    this.catId,
    this.fileAdult,
    this.fileCode,
    this.fileCreated,
    this.fileFldId,
    this.fileLastDownload,
    this.fileLength,
    this.filePremiumOnly,
    this.filePublic,
    this.fileTitle,
    this.fileViews,
    this.fileViewsFull,
    this.playerImg,
    this.status,
    this.tags,
  });

  factory StreamwishFileInfoResult.fromJson(String str) =>
      StreamwishFileInfoResult.fromMap(json.decode(str));

  factory StreamwishFileInfoResult.fromMap(Map<String, dynamic> json) =>
      StreamwishFileInfoResult(
        canplay: json['canplay'],
        catId: json['cat_id'],
        fileAdult: json['file_adult'],
        fileCode: json['file_code'],
        fileCreated: json['file_created'] == null
            ? null
            : DateTime.parse(json['file_created']),
        fileFldId: json['file_fld_id'],
        fileLastDownload: json['file_last_download'] == null
            ? null
            : DateTime.parse(json['file_last_download']),
        fileLength: json['file_length'],
        filePremiumOnly: json['file_premium_only'],
        filePublic: json['file_public'],
        fileTitle: json['file_title'],
        fileViews: json['file_views'],
        fileViewsFull: json['file_views_full'],
        playerImg: json['player_img'],
        status: json['status'],
        tags: json['tags'],
      );
  final int? canplay;
  final int? catId;
  final int? fileAdult;
  final String? fileCode;
  final DateTime? fileCreated;
  final int? fileFldId;
  final DateTime? fileLastDownload;
  final int? fileLength;
  final int? filePremiumOnly;
  final int? filePublic;
  final String? fileTitle;
  final int? fileViews;
  final int? fileViewsFull;
  final String? playerImg;
  final int? status;
  final String? tags;

  StreamwishFileInfoResult copyWith({
    int? canplay,
    int? catId,
    int? fileAdult,
    String? fileCode,
    DateTime? fileCreated,
    int? fileFldId,
    DateTime? fileLastDownload,
    int? fileLength,
    int? filePremiumOnly,
    int? filePublic,
    String? fileTitle,
    int? fileViews,
    int? fileViewsFull,
    String? playerImg,
    int? status,
    String? tags,
  }) =>
      StreamwishFileInfoResult(
        canplay: canplay ?? this.canplay,
        catId: catId ?? this.catId,
        fileAdult: fileAdult ?? this.fileAdult,
        fileCode: fileCode ?? this.fileCode,
        fileCreated: fileCreated ?? this.fileCreated,
        fileFldId: fileFldId ?? this.fileFldId,
        fileLastDownload: fileLastDownload ?? this.fileLastDownload,
        fileLength: fileLength ?? this.fileLength,
        filePremiumOnly: filePremiumOnly ?? this.filePremiumOnly,
        filePublic: filePublic ?? this.filePublic,
        fileTitle: fileTitle ?? this.fileTitle,
        fileViews: fileViews ?? this.fileViews,
        fileViewsFull: fileViewsFull ?? this.fileViewsFull,
        playerImg: playerImg ?? this.playerImg,
        status: status ?? this.status,
        tags: tags ?? this.tags,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'canplay': canplay,
        'cat_id': catId,
        'file_adult': fileAdult,
        'file_code': fileCode,
        'file_created': fileCreated?.toIso8601String(),
        'file_fld_id': fileFldId,
        'file_last_download': fileLastDownload?.toIso8601String(),
        'file_length': fileLength,
        'file_premium_only': filePremiumOnly,
        'file_public': filePublic,
        'file_title': fileTitle,
        'file_views': fileViews,
        'file_views_full': fileViewsFull,
        'player_img': playerImg,
        'status': status,
        'tags': tags,
      };
}
