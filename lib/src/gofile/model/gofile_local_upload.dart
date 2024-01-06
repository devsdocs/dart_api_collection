// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../gofile.dart';

class GofileLocalUpload {
  GofileLocalUpload({
    this.data,
    this.status,
  });

  factory GofileLocalUpload.fromJson(String str) =>
      GofileLocalUpload.fromMap(json.decode(str));

  factory GofileLocalUpload.fromMap(Map<String, dynamic> json) =>
      GofileLocalUpload(
        data: json['data'] == null
            ? null
            : GofileLocalUploadData.fromMap(json['data']),
        status: json['status'],
      );
  final GofileLocalUploadData? data;
  final String? status;

  GofileLocalUpload copyWith({
    GofileLocalUploadData? data,
    String? status,
  }) =>
      GofileLocalUpload(
        data: data ?? this.data,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
        'status': status,
      };
}

class GofileLocalUploadData {
  GofileLocalUploadData({
    this.code,
    this.downloadPage,
    this.fileId,
    this.fileName,
    this.guestToken,
    this.md5,
    this.parentFolder,
  });

  factory GofileLocalUploadData.fromJson(String str) =>
      GofileLocalUploadData.fromMap(json.decode(str));

  factory GofileLocalUploadData.fromMap(Map<String, dynamic> json) =>
      GofileLocalUploadData(
        code: json['code'],
        downloadPage: json['downloadPage'],
        fileId: json['fileId'],
        fileName: json['fileName'],
        guestToken: json['guestToken'],
        md5: json['md5'],
        parentFolder: json['parentFolder'],
      );
  final String? code;
  final String? downloadPage;
  final String? fileId;
  final String? fileName;
  final String? guestToken;
  final String? md5;
  final String? parentFolder;

  GofileLocalUploadData copyWith({
    String? code,
    String? downloadPage,
    String? fileId,
    String? fileName,
    String? guestToken,
    String? md5,
    String? parentFolder,
  }) =>
      GofileLocalUploadData(
        code: code ?? this.code,
        downloadPage: downloadPage ?? this.downloadPage,
        fileId: fileId ?? this.fileId,
        fileName: fileName ?? this.fileName,
        guestToken: guestToken ?? this.guestToken,
        md5: md5 ?? this.md5,
        parentFolder: parentFolder ?? this.parentFolder,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'code': code,
        'downloadPage': downloadPage,
        'fileId': fileId,
        'fileName': fileName,
        'guestToken': guestToken,
        'md5': md5,
        'parentFolder': parentFolder,
      };
}
