// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishFileDirectLink {
  StreamwishFileDirectLink({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishFileDirectLink.fromJson(String str) =>
      StreamwishFileDirectLink.fromMap(json.decode(str));

  factory StreamwishFileDirectLink.fromMap(Map<String, dynamic> json) =>
      StreamwishFileDirectLink(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : StreamwishFileDirectLinkResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final StreamwishFileDirectLinkResult? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishFileDirectLink copyWith({
    String? msg,
    StreamwishFileDirectLinkResult? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishFileDirectLink(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        serverTime: serverTime ?? this.serverTime,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result?.toMap(),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}

class StreamwishFileDirectLinkResult {
  StreamwishFileDirectLinkResult({
    this.fileLength,
    this.fileName,
    this.playerImg,
    this.versions,
  });

  factory StreamwishFileDirectLinkResult.fromJson(String str) =>
      StreamwishFileDirectLinkResult.fromMap(json.decode(str));

  factory StreamwishFileDirectLinkResult.fromMap(Map<String, dynamic> json) =>
      StreamwishFileDirectLinkResult(
        fileLength: json['file_length'],
        fileName: json['file_name'],
        playerImg: json['player_img'],
        versions: json['versions'] == null
            ? []
            : List<Version>.from(
                json['versions']!.map((x) => Version.fromMap(x)),
              ),
      );
  final int? fileLength;
  final String? fileName;
  final String? playerImg;
  final List<Version>? versions;

  StreamwishFileDirectLinkResult copyWith({
    int? fileLength,
    String? fileName,
    String? playerImg,
    List<Version>? versions,
  }) =>
      StreamwishFileDirectLinkResult(
        fileLength: fileLength ?? this.fileLength,
        fileName: fileName ?? this.fileName,
        playerImg: playerImg ?? this.playerImg,
        versions: versions ?? this.versions,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'file_length': fileLength,
        'file_name': fileName,
        'player_img': playerImg,
        'versions': versions == null
            ? []
            : List<dynamic>.from(versions!.map((x) => x.toMap())),
      };
}

class Version {
  Version({
    this.name,
    this.size,
    this.url,
  });

  factory Version.fromJson(String str) => Version.fromMap(json.decode(str));

  factory Version.fromMap(Map<String, dynamic> json) => Version(
        name: json['name'],
        size: json['size'],
        url: json['url'],
      );
  final String? name;
  final int? size;
  final String? url;

  Version copyWith({
    String? name,
    int? size,
    String? url,
  }) =>
      Version(
        name: name ?? this.name,
        size: size ?? this.size,
        url: url ?? this.url,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'name': name,
        'size': size,
        'url': url,
      };
}
