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
            : StreamtapeAccountInfoResult.fromMap(json['result']),
        status: json['status'],
      );
  final String? msg;
  final StreamtapeAccountInfoResult? result;
  final int? status;

  StreamtapeAccountInfo copyWith({
    String? msg,
    StreamtapeAccountInfoResult? result,
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

class StreamtapeAccountInfoResult {
  StreamtapeAccountInfoResult({
    this.apiid,
    this.email,
    this.signupAt,
  });

  factory StreamtapeAccountInfoResult.fromJson(String str) =>
      StreamtapeAccountInfoResult.fromMap(json.decode(str));

  factory StreamtapeAccountInfoResult.fromMap(Map<String, dynamic> json) =>
      StreamtapeAccountInfoResult(
        apiid: json['apiid'],
        email: json['email'],
        signupAt: json['signup_at'] == null
            ? null
            : DateTime.parse(json['signup_at']),
      );
  final String? apiid;
  final String? email;
  final DateTime? signupAt;

  StreamtapeAccountInfoResult copyWith({
    String? apiid,
    String? email,
    DateTime? signupAt,
  }) =>
      StreamtapeAccountInfoResult(
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
