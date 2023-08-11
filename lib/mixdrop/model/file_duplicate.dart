// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class FileDuplicate {
  FileDuplicate({
    this.result,
    this.success,
  });

  factory FileDuplicate.fromJson(String str) =>
      FileDuplicate.fromMap(json.decode(str));

  factory FileDuplicate.fromMap(Map<String, dynamic> json) => FileDuplicate(
        result: json['result'] == null ? null : FileDuplicateResult.fromMap(json['result']),
        success: json['success'],
      );
  final FileDuplicateResult? result;
  final bool? success;

  FileDuplicate copyWith({
    FileDuplicateResult? result,
    bool? success,
  }) =>
      FileDuplicate(
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

  factory FileDuplicateResult.fromJson(String str) => FileDuplicateResult.fromMap(json.decode(str));

  factory FileDuplicateResult.fromMap(Map<String, dynamic> json) => FileDuplicateResult(
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
