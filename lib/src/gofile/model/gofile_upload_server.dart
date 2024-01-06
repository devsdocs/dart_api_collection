// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../gofile.dart';

class GofileUploadServer {
  GofileUploadServer({
    this.data,
    this.status,
  });

  factory GofileUploadServer.fromJson(String str) =>
      GofileUploadServer.fromMap(json.decode(str));

  factory GofileUploadServer.fromMap(Map<String, dynamic> json) =>
      GofileUploadServer(
        data: json['data'] == null
            ? null
            : GofileUploadServerData.fromMap(json['data']),
        status: json['status'],
      );
  final GofileUploadServerData? data;
  final String? status;

  GofileUploadServer copyWith({
    GofileUploadServerData? data,
    String? status,
  }) =>
      GofileUploadServer(
        data: data ?? this.data,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
        'status': status,
      };
}

class GofileUploadServerData {
  GofileUploadServerData({
    this.server,
  });

  factory GofileUploadServerData.fromJson(String str) =>
      GofileUploadServerData.fromMap(json.decode(str));

  factory GofileUploadServerData.fromMap(Map<String, dynamic> json) =>
      GofileUploadServerData(
        server: json['server'],
      );
  final String? server;

  GofileUploadServerData copyWith({
    String? server,
  }) =>
      GofileUploadServerData(
        server: server ?? this.server,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'server': server,
      };
}
