// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class LocalUpload {
  LocalUpload({
    this.result,
    this.success,
  });

  factory LocalUpload.fromJson(String str) =>
      LocalUpload.fromMap(json.decode(str));

  factory LocalUpload.fromMap(Map<String, dynamic> json) => LocalUpload(
        result: json['result'] == null
            ? null
            : LocalUploadResult.fromMap(json['result']),
        success: json['success'],
      );
  final LocalUploadResult? result;
  final bool? success;

  LocalUpload copyWith({
    LocalUploadResult? result,
    bool? success,
  }) =>
      LocalUpload(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': result?.toMap(),
        'success': success,
      };
}

class LocalUploadResult {
  LocalUploadResult({
    this.fileref,
  });

  factory LocalUploadResult.fromJson(String str) =>
      LocalUploadResult.fromMap(json.decode(str));

  factory LocalUploadResult.fromMap(Map<String, dynamic> json) =>
      LocalUploadResult(
        fileref: json['fileref'],
      );
  final String? fileref;

  LocalUploadResult copyWith({
    String? fileref,
  }) =>
      LocalUploadResult(
        fileref: fileref ?? this.fileref,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'fileref': fileref,
      };
}
