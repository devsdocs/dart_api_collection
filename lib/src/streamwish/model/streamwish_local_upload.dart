// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishLocalUpload {
  StreamwishLocalUpload({
    this.files,
    this.msg,
    this.status,
  });

  factory StreamwishLocalUpload.fromJson(String str) =>
      StreamwishLocalUpload.fromMap(json.decode(str));

  factory StreamwishLocalUpload.fromMap(Map<String, dynamic> json) =>
      StreamwishLocalUpload(
        files: json['files'] == null
            ? []
            : List<StreamwishLocalUploadFileElement>.from(
                json['files']!
                    .map((x) => StreamwishLocalUploadFileElement.fromMap(x)),
              ),
        msg: json['msg'],
        status: json['status'],
      );
  final List<StreamwishLocalUploadFileElement>? files;
  final String? msg;
  final int? status;

  StreamwishLocalUpload copyWith({
    List<StreamwishLocalUploadFileElement>? files,
    String? msg,
    int? status,
  }) =>
      StreamwishLocalUpload(
        files: files ?? this.files,
        msg: msg ?? this.msg,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'files': files == null
            ? []
            : List<dynamic>.from(files!.map((x) => x.toMap())),
        'msg': msg,
        'status': status,
      };
}

class StreamwishLocalUploadFileElement {
  StreamwishLocalUploadFileElement({
    this.filecode,
    this.filename,
    this.status,
  });

  factory StreamwishLocalUploadFileElement.fromJson(String str) =>
      StreamwishLocalUploadFileElement.fromMap(json.decode(str));

  factory StreamwishLocalUploadFileElement.fromMap(Map<String, dynamic> json) =>
      StreamwishLocalUploadFileElement(
        filecode: json['filecode'],
        filename: json['filename'],
        status: json['status'],
      );
  final String? filecode;
  final String? filename;
  final String? status;

  StreamwishLocalUploadFileElement copyWith({
    String? filecode,
    String? filename,
    String? status,
  }) =>
      StreamwishLocalUploadFileElement(
        filecode: filecode ?? this.filecode,
        filename: filename ?? this.filename,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'filecode': filecode,
        'filename': filename,
        'status': status,
      };
}
