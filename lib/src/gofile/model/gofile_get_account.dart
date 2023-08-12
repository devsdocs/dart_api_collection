// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../gofile.dart';

class GofileGetAccount {
  GofileGetAccount({
    this.data,
    this.status,
  });

  factory GofileGetAccount.fromJson(String str) =>
      GofileGetAccount.fromMap(json.decode(str));

  factory GofileGetAccount.fromMap(Map<String, dynamic> json) =>
      GofileGetAccount(
        data: json['data'] == null
            ? null
            : GofileGetAccountData.fromMap(json['data']),
        status: json['status'],
      );
  final GofileGetAccountData? data;
  final String? status;

  GofileGetAccount copyWith({
    GofileGetAccountData? data,
    String? status,
  }) =>
      GofileGetAccount(
        data: data ?? this.data,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
        'status': status,
      };
}

class GofileGetAccountData {
  GofileGetAccountData({
    this.email,
    this.filesCount,
    this.foldersCount,
    this.rootFolder,
    this.tier,
    this.token,
    this.totalDownloadCount,
    this.totalSize,
  });

  factory GofileGetAccountData.fromJson(String str) =>
      GofileGetAccountData.fromMap(json.decode(str));

  factory GofileGetAccountData.fromMap(Map<String, dynamic> json) =>
      GofileGetAccountData(
        email: json['email'],
        filesCount: json['filesCount'],
        foldersCount: json['foldersCount'],
        rootFolder: json['rootFolder'],
        tier: json['tier'],
        token: json['token'],
        totalDownloadCount: json['totalDownloadCount'],
        totalSize: json['totalSize'],
      );
  final String? email;
  final int? filesCount;
  final int? foldersCount;
  final String? rootFolder;
  final String? tier;
  final String? token;
  final int? totalDownloadCount;
  final int? totalSize;

  GofileGetAccountData copyWith({
    String? email,
    int? filesCount,
    int? foldersCount,
    String? rootFolder,
    String? tier,
    String? token,
    int? totalDownloadCount,
    int? totalSize,
  }) =>
      GofileGetAccountData(
        email: email ?? this.email,
        filesCount: filesCount ?? this.filesCount,
        foldersCount: foldersCount ?? this.foldersCount,
        rootFolder: rootFolder ?? this.rootFolder,
        tier: tier ?? this.tier,
        token: token ?? this.token,
        totalDownloadCount: totalDownloadCount ?? this.totalDownloadCount,
        totalSize: totalSize ?? this.totalSize,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'email': email,
        'filesCount': filesCount,
        'foldersCount': foldersCount,
        'rootFolder': rootFolder,
        'tier': tier,
        'token': token,
        'totalDownloadCount': totalDownloadCount,
        'totalSize': totalSize,
      };
}
