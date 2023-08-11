// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamtape.dart';

class StreamtapeAccountInfo {
  StreamtapeAccountInfo({
    this.msg,
    this.result,
    this.status,
  });

  factory StreamtapeAccountInfo.fromJson(String str) =>
      StreamtapeAccountInfo.fromMap(json.decode(str));

  factory StreamtapeAccountInfo.fromMap(Map<String, dynamic> json) =>
      StreamtapeAccountInfo(
        msg: json['msg'],
        result: json['result'] == null
            ? null
            : AccountInfoResult.fromMap(json['result']),
        status: json['status'],
      );
  final String? msg;
  final AccountInfoResult? result;
  final int? status;

  StreamtapeAccountInfo copyWith({
    String? msg,
    AccountInfoResult? result,
    int? status,
  }) =>
      StreamtapeAccountInfo(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result?.toMap(),
        'status': status,
      };
}

class AccountInfoResult {
  AccountInfoResult({
    this.apiid,
    this.email,
    this.signupAt,
  });

  factory AccountInfoResult.fromJson(String str) =>
      AccountInfoResult.fromMap(json.decode(str));

  factory AccountInfoResult.fromMap(Map<String, dynamic> json) =>
      AccountInfoResult(
        apiid: json['apiid'],
        email: json['email'],
        signupAt: json['signup_at'] == null
            ? null
            : DateTime.parse(json['signup_at']),
      );
  final String? apiid;
  final String? email;
  final DateTime? signupAt;

  AccountInfoResult copyWith({
    String? apiid,
    String? email,
    DateTime? signupAt,
  }) =>
      AccountInfoResult(
        apiid: apiid ?? this.apiid,
        email: email ?? this.email,
        signupAt: signupAt ?? this.signupAt,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'apiid': apiid,
        'email': email,
        'signup_at': signupAt?.toIso8601String(),
      };
}
