// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class FileRemoved {
  FileRemoved({
    this.pages,
    this.result,
    this.success,
  });

  factory FileRemoved.fromJson(String str) =>
      FileRemoved.fromMap(json.decode(str));

  factory FileRemoved.fromMap(Map<String, dynamic> json) => FileRemoved(
        pages: json['pages'],
        result: json['result'] == null
            ? []
            : List<FileRemovedResult>.from(
                json['result']!.map((x) => FileRemovedResult.fromMap(x)),
              ),
        success: json['success'],
      );
  final int? pages;
  final List<FileRemovedResult>? result;
  final bool? success;

  FileRemoved copyWith({
    int? pages,
    List<FileRemovedResult>? result,
    bool? success,
  }) =>
      FileRemoved(
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

class FileRemovedResult {
  FileRemovedResult({
    this.date,
    this.fileref,
    this.status,
    this.title,
  });

  factory FileRemovedResult.fromJson(String str) =>
      FileRemovedResult.fromMap(json.decode(str));

  factory FileRemovedResult.fromMap(Map<String, dynamic> json) =>
      FileRemovedResult(
        date: json['date'],
        fileref: json['fileref'],
        status: json['status'],
        title: json['title'],
      );
  final String? date;
  final String? fileref;
  final String? status;
  final String? title;

  FileRemovedResult copyWith({
    String? date,
    String? fileref,
    String? status,
    String? title,
  }) =>
      FileRemovedResult(
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
