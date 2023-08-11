// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class AddSubtitle {
  AddSubtitle({
    this.result,
    this.success,
  });

  factory AddSubtitle.fromJson(String str) =>
      AddSubtitle.fromMap(json.decode(str));

  factory AddSubtitle.fromMap(Map<String, dynamic> json) => AddSubtitle(
        result: json['result'],
        success: json['success'],
      );
  final String? result;
  final bool? success;

  AddSubtitle copyWith({
    String? result,
    bool? success,
  }) =>
      AddSubtitle(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': result,
        'success': success,
      };
}
