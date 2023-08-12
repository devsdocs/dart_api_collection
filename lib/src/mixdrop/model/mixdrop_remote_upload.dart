// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class MixdropRemoteUpload {
  MixdropRemoteUpload({
    this.result,
    this.success,
  });

  factory MixdropRemoteUpload.fromJson(String str) =>
      MixdropRemoteUpload.fromMap(json.decode(str));

  factory MixdropRemoteUpload.fromMap(Map<String, dynamic> json) =>
      MixdropRemoteUpload(
        result: json['result'] == null
            ? null
            : MixdropRemoteUploadResult.fromMap(json['result']),
        success: json['success'],
      );
  final MixdropRemoteUploadResult? result;
  final bool? success;

  MixdropRemoteUpload copyWith({
    MixdropRemoteUploadResult? result,
    bool? success,
  }) =>
      MixdropRemoteUpload(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': result?.toMap(),
        'success': success,
      };
}

class MixdropRemoteUploadResult {
  MixdropRemoteUploadResult({
    this.fileref,
    this.id,
    this.status,
  });

  factory MixdropRemoteUploadResult.fromJson(String str) =>
      MixdropRemoteUploadResult.fromMap(json.decode(str));

  factory MixdropRemoteUploadResult.fromMap(Map<String, dynamic> json) =>
      MixdropRemoteUploadResult(
        fileref: json['fileref'],
        id: json['id'],
        status: json['status'],
      );
  final String? fileref;
  final int? id;
  final String? status;

  MixdropRemoteUploadResult copyWith({
    String? fileref,
    int? id,
    String? status,
  }) =>
      MixdropRemoteUploadResult(
        fileref: fileref ?? this.fileref,
        id: id ?? this.id,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'fileref': fileref,
        'id': id,
        'status': status,
      };
}
