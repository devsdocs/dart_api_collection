// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../gofile.dart';

class GofileCommonResult {
  GofileCommonResult({
    this.data,
    this.status,
  });

  factory GofileCommonResult.fromJson(String str) =>
      GofileCommonResult.fromMap(json.decode(str));

  factory GofileCommonResult.fromMap(Map<String, dynamic> json) =>
      GofileCommonResult(
        data: json['data'] == null
            ? null
            : GofileCommonResultData.fromMap(json['data']),
        status: json['status'],
      );
  final GofileCommonResultData? data;
  final String? status;

  GofileCommonResult copyWith({
    GofileCommonResultData? data,
    String? status,
  }) =>
      GofileCommonResult(
        data: data ?? this.data,
        status: status ?? this.status,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
        'status': status,
      };
}

class GofileCommonResultData {
  GofileCommonResultData({
    this.placeholder,
  });

  factory GofileCommonResultData.fromJson(String str) =>
      GofileCommonResultData.fromMap(json.decode(str));

  factory GofileCommonResultData.fromMap(Map<String, dynamic> json) =>
      GofileCommonResultData(
        placeholder: json['placeholder'],
      );
  final String? placeholder;

  GofileCommonResultData copyWith({
    String? placeholder,
  }) =>
      GofileCommonResultData(
        placeholder: placeholder ?? this.placeholder,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'placeholder': placeholder,
      };
}
