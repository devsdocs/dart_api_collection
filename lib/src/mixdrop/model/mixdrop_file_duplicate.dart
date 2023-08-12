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
            : MixdropFileDuplicateResult.fromMap(json['result']),
        success: json['success'],
      );
  final MixdropFileDuplicateResult? result;
  final bool? success;

  MixdropFileDuplicate copyWith({
    MixdropFileDuplicateResult? result,
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

class MixdropFileDuplicateResult {
  MixdropFileDuplicateResult({
    this.fileref,
  });

  factory MixdropFileDuplicateResult.fromJson(String str) =>
      MixdropFileDuplicateResult.fromMap(json.decode(str));

  factory MixdropFileDuplicateResult.fromMap(Map<String, dynamic> json) =>
      MixdropFileDuplicateResult(
        fileref: json['fileref'],
      );
  final String? fileref;

  MixdropFileDuplicateResult copyWith({
    String? fileref,
  }) =>
      MixdropFileDuplicateResult(
        fileref: fileref ?? this.fileref,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'fileref': fileref,
      };
}
