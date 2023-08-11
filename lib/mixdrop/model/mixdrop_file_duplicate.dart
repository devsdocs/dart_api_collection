// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class MixdropFileDuplicate {
  MixdropFileDuplicate({
    this.result,
    this.success,
  });

  factory MixdropFileDuplicate.fromJson(String str) =>
      MixdropFileDuplicate.fromMap(json.decode(str));

  factory MixdropFileDuplicate.fromMap(Map<String, dynamic> json) =>
      MixdropFileDuplicate(
        result: json['result'] == null
            ? null
            : FileDuplicateResult.fromMap(json['result']),
        success: json['success'],
      );
  final FileDuplicateResult? result;
  final bool? success;

  MixdropFileDuplicate copyWith({
    FileDuplicateResult? result,
    bool? success,
  }) =>
      MixdropFileDuplicate(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': result?.toMap(),
        'success': success,
      };
}

class FileDuplicateResult {
  FileDuplicateResult({
    this.fileref,
  });

  factory FileDuplicateResult.fromJson(String str) =>
      FileDuplicateResult.fromMap(json.decode(str));

  factory FileDuplicateResult.fromMap(Map<String, dynamic> json) =>
      FileDuplicateResult(
        fileref: json['fileref'],
      );
  final String? fileref;

  FileDuplicateResult copyWith({
    String? fileref,
  }) =>
      FileDuplicateResult(
        fileref: fileref ?? this.fileref,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'fileref': fileref,
      };
}
