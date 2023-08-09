// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../main.dart';

class AccountInfo {
  AccountInfo({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory AccountInfo.fromJson(String str) =>
      AccountInfo.fromMap(json.decode(str));

  factory AccountInfo.fromMap(Map<String, dynamic> json) => AccountInfo(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : AccountInfoResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final AccountInfoResult? result;
  final DateTime? serverTime;
  final int? status;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result?.toMap(),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}

class AccountInfoResult {
  AccountInfoResult({
    this.balance,
    this.email,
    this.premimExpire,
    this.storageLeft,
    this.storageUsed,
  });

  factory AccountInfoResult.fromJson(String str) =>
      AccountInfoResult.fromMap(json.decode(str));

  factory AccountInfoResult.fromMap(Map<String, dynamic> json) =>
      AccountInfoResult(
        balance: json['balance'],
        email: json['email'],
        premimExpire: json['premim_expire'] == null
            ? null
            : DateTime.parse(json['premim_expire']),
        storageLeft: json['storage_left'],
        storageUsed: json['storage_used'],
      );
  final String? balance;
  final String? email;
  final DateTime? premimExpire;
  final String? storageLeft;
  final int? storageUsed;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'balance': balance,
        'email': email,
        'premim_expire': premimExpire?.toIso8601String(),
        'storage_left': storageLeft,
        'storage_used': storageUsed,
      };
}
