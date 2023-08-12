// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class MixdropLocalUpload {
  MixdropLocalUpload({
    this.result,
    this.success,
  });

  factory MixdropLocalUpload.fromJson(String str) =>
      MixdropLocalUpload.fromMap(json.decode(str));

  factory MixdropLocalUpload.fromMap(Map<String, dynamic> json) =>
      MixdropLocalUpload(
        result: json['result'] == null
            ? null
            : MixdropLocalUploadResult.fromMap(json['result']),
        success: json['success'],
      );
  final MixdropLocalUploadResult? result;
  final bool? success;

  MixdropLocalUpload copyWith({
    MixdropLocalUploadResult? result,
    bool? success,
  }) =>
      MixdropLocalUpload(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': result?.toMap(),
        'success': success,
      };
}

class MixdropLocalUploadResult {
  MixdropLocalUploadResult({
    this.fileref,
  });

  factory MixdropLocalUploadResult.fromJson(String str) =>
      MixdropLocalUploadResult.fromMap(json.decode(str));

  factory MixdropLocalUploadResult.fromMap(Map<String, dynamic> json) =>
      MixdropLocalUploadResult(
        fileref: json['fileref'],
      );
  final String? fileref;

  MixdropLocalUploadResult copyWith({
    String? fileref,
  }) =>
      MixdropLocalUploadResult(
        fileref: fileref ?? this.fileref,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'fileref': fileref,
      };
}
