// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class Upload {
  Upload({
    this.result,
    this.success,
  });

  factory Upload.fromJson(String str) => Upload.fromMap(json.decode(str));

  factory Upload.fromMap(Map<String, dynamic> json) => Upload(
        result: json['result'] == null
            ? null
            : UploadResult.fromMap(json['result']),
        success: json['success'],
      );
  final UploadResult? result;
  final bool? success;

  Upload copyWith({
    UploadResult? result,
    bool? success,
  }) =>
      Upload(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': result?.toMap(),
        'success': success,
      };
}

class UploadResult {
  UploadResult({
    this.fileref,
  });

  factory UploadResult.fromJson(String str) =>
      UploadResult.fromMap(json.decode(str));

  factory UploadResult.fromMap(Map<String, dynamic> json) => UploadResult(
        fileref: json['fileref'],
      );
  final String? fileref;

  UploadResult copyWith({
    String? fileref,
  }) =>
      UploadResult(
        fileref: fileref ?? this.fileref,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'fileref': fileref,
      };
}
