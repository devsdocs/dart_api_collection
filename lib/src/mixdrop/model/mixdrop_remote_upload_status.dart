// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class MixdropRemoteUploadStatus {
  MixdropRemoteUploadStatus({
    this.result,
    this.success,
  });

  factory MixdropRemoteUploadStatus.fromJson(String str) =>
      MixdropRemoteUploadStatus.fromMap(json.decode(str));

  factory MixdropRemoteUploadStatus.fromMap(Map<String, dynamic> json) =>
      MixdropRemoteUploadStatus(
        result: json['result'] == null
            ? null
            : MixdropRemoteStatusResult.fromMap(json['result']),
        success: json['success'],
      );
  final MixdropRemoteStatusResult? result;
  final bool? success;

  MixdropRemoteUploadStatus copyWith({
    MixdropRemoteStatusResult? result,
    bool? success,
  }) =>
      MixdropRemoteUploadStatus(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': result?.toMap(),
        'success': success,
      };
}

class MixdropRemoteStatusResult {
  MixdropRemoteStatusResult({
    this.added,
    this.completed,
    this.error,
    this.fileref,
    this.fileurl,
    this.name,
    this.progress,
    this.status,
    this.url,
  });

  factory MixdropRemoteStatusResult.fromJson(String str) =>
      MixdropRemoteStatusResult.fromMap(json.decode(str));

  factory MixdropRemoteStatusResult.fromMap(Map<String, dynamic> json) =>
      MixdropRemoteStatusResult(
        added: json['added'],
        completed: json['completed'],
        error: json['error'],
        fileref: json['fileref'],
        fileurl: json['fileurl'],
        name: json['name'],
        progress: json['progress'],
        status: json['status'],
        url: json['url'],
      );
  final String? added;
  final String? completed;
  final String? error;
  final String? fileref;
  final String? fileurl;
  final String? name;
  final String? progress;
  final String? status;
  final String? url;

  MixdropRemoteStatusResult copyWith({
    String? added,
    String? completed,
    String? error,
    String? fileref,
    String? fileurl,
    String? name,
    String? progress,
    String? status,
    String? url,
  }) =>
      MixdropRemoteStatusResult(
        added: added ?? this.added,
        completed: completed ?? this.completed,
        error: error ?? this.error,
        fileref: fileref ?? this.fileref,
        fileurl: fileurl ?? this.fileurl,
        name: name ?? this.name,
        progress: progress ?? this.progress,
        status: status ?? this.status,
        url: url ?? this.url,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'added': added,
        'completed': completed,
        'error': error,
        'fileref': fileref,
        'fileurl': fileurl,
        'name': name,
        'progress': progress,
        'status': status,
        'url': url,
      };
}
