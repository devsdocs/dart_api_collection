// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class MixdropFileRemoved {
  MixdropFileRemoved({
    this.pages,
    this.result,
    this.success,
  });

  factory MixdropFileRemoved.fromJson(String str) =>
      MixdropFileRemoved.fromMap(json.decode(str));

  factory MixdropFileRemoved.fromMap(Map<String, dynamic> json) =>
      MixdropFileRemoved(
        pages: json['pages'],
        result: json['result'] == null
            ? []
            : List<MixdropFileRemovedResult>.from(
                json['result']!.map((x) => MixdropFileRemovedResult.fromMap(x)),
              ),
        success: json['success'],
      );
  final int? pages;
  final List<MixdropFileRemovedResult>? result;
  final bool? success;

  MixdropFileRemoved copyWith({
    int? pages,
    List<MixdropFileRemovedResult>? result,
    bool? success,
  }) =>
      MixdropFileRemoved(
        pages: pages ?? this.pages,
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'pages': pages,
        'result': result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toMap())),
        'success': success,
      };
}

class MixdropFileRemovedResult {
  MixdropFileRemovedResult({
    this.date,
    this.fileref,
    this.status,
    this.title,
  });

  factory MixdropFileRemovedResult.fromJson(String str) =>
      MixdropFileRemovedResult.fromMap(json.decode(str));

  factory MixdropFileRemovedResult.fromMap(Map<String, dynamic> json) =>
      MixdropFileRemovedResult(
        date: json['date'],
        fileref: json['fileref'],
        status: json['status'],
        title: json['title'],
      );
  final String? date;
  final String? fileref;
  final String? status;
  final String? title;

  MixdropFileRemovedResult copyWith({
    String? date,
    String? fileref,
    String? status,
    String? title,
  }) =>
      MixdropFileRemovedResult(
        date: date ?? this.date,
        fileref: fileref ?? this.fileref,
        status: status ?? this.status,
        title: title ?? this.title,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'date': date,
        'fileref': fileref,
        'status': status,
        'title': title,
      };
}
