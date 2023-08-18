// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishFileEncodings {
  StreamwishFileEncodings({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishFileEncodings.fromJson(String str) =>
      StreamwishFileEncodings.fromMap(json.decode(str));

  factory StreamwishFileEncodings.fromMap(Map<String, dynamic> json) =>
      StreamwishFileEncodings(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<StreamwishFileEncodingsResult>.from(
                json['result']!
                    .map((x) => StreamwishFileEncodingsResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<StreamwishFileEncodingsResult>? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishFileEncodings copyWith({
    String? msg,
    List<StreamwishFileEncodingsResult>? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishFileEncodings(
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

class StreamwishFileEncodingsResult {
  StreamwishFileEncodingsResult({
    this.fileCode,
    this.link,
    this.progress,
    this.quality,
    this.status,
    this.title,
  });

  factory StreamwishFileEncodingsResult.fromJson(String str) =>
      StreamwishFileEncodingsResult.fromMap(json.decode(str));

  factory StreamwishFileEncodingsResult.fromMap(Map<String, dynamic> json) =>
      StreamwishFileEncodingsResult(
        fileCode: json['file_code'],
        link: json['link'],
        progress: json['progress'],
        quality: json['quality'],
        status: json['status'],
        title: json['title'],
      );
  final String? fileCode;
  final String? link;
  final int? progress;
  final String? quality;
  final String? status;
  final String? title;

  StreamwishFileEncodingsResult copyWith({
    String? fileCode,
    String? link,
    int? progress,
    String? quality,
    String? status,
    String? title,
  }) =>
      StreamwishFileEncodingsResult(
        fileCode: fileCode ?? this.fileCode,
        link: link ?? this.link,
        progress: progress ?? this.progress,
        quality: quality ?? this.quality,
        status: status ?? this.status,
        title: title ?? this.title,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'file_code': fileCode,
        'link': link,
        'progress': progress,
        'quality': quality,
        'status': status,
        'title': title,
      };
}
