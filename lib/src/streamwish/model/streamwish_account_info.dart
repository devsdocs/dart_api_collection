// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishAccountInfo {
  StreamwishAccountInfo({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishAccountInfo.fromJson(String str) =>
      StreamwishAccountInfo.fromMap(json.decode(str));

  factory StreamwishAccountInfo.fromMap(Map<String, dynamic> json) =>
      StreamwishAccountInfo(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : StreamwishAccountInfoResult.fromMap(json['result']),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final StreamwishAccountInfoResult? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishAccountInfo copyWith({
    String? msg,
    StreamwishAccountInfoResult? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishAccountInfo(
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

class StreamwishAccountInfoResult {
  StreamwishAccountInfoResult({
    this.balance,
    this.email,
    this.filesTotal,
    this.login,
    this.premium,
    this.premiumExpire,
    this.storageLeft,
    this.storageUsed,
  });

  factory StreamwishAccountInfoResult.fromJson(String str) =>
      StreamwishAccountInfoResult.fromMap(json.decode(str));

  factory StreamwishAccountInfoResult.fromMap(Map<String, dynamic> json) =>
      StreamwishAccountInfoResult(
        balance: json['balance'],
        email: json['email'],
        filesTotal: json['files_total'],
        login: json['login'],
        premium: json['premium'],
        premiumExpire: json['premium_expire'] == null
            ? null
            : DateTime.parse(json['premium_expire']),
        storageLeft: json['storage_left'],
        storageUsed: json['storage_used'],
      );
  final String? balance;
  final String? email;
  final int? filesTotal;
  final String? login;
  final int? premium;
  final DateTime? premiumExpire;
  final String? storageLeft;
  final int? storageUsed;

  StreamwishAccountInfoResult copyWith({
    String? balance,
    String? email,
    int? filesTotal,
    String? login,
    int? premium,
    DateTime? premiumExpire,
    String? storageLeft,
    int? storageUsed,
  }) =>
      StreamwishAccountInfoResult(
        balance: balance ?? this.balance,
        email: email ?? this.email,
        filesTotal: filesTotal ?? this.filesTotal,
        login: login ?? this.login,
        premium: premium ?? this.premium,
        premiumExpire: premiumExpire ?? this.premiumExpire,
        storageLeft: storageLeft ?? this.storageLeft,
        storageUsed: storageUsed ?? this.storageUsed,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'balance': balance,
        'email': email,
        'files_total': filesTotal,
        'login': login,
        'premium': premium,
        'premium_expire': premiumExpire?.toIso8601String(),
        'storage_left': storageLeft,
        'storage_used': storageUsed,
      };
}
