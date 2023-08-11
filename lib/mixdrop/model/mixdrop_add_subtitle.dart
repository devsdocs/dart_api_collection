// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../mixdrop.dart';

class MixdropAddSubtitle {
  MixdropAddSubtitle({
    this.result,
    this.success,
  });

  factory MixdropAddSubtitle.fromJson(String str) =>
      MixdropAddSubtitle.fromMap(json.decode(str));

  factory MixdropAddSubtitle.fromMap(Map<String, dynamic> json) =>
      MixdropAddSubtitle(
        result: json['result'],
        success: json['success'],
      );
  final String? result;
  final bool? success;

  MixdropAddSubtitle copyWith({
    String? result,
    bool? success,
  }) =>
      MixdropAddSubtitle(
        result: result ?? this.result,
        success: success ?? this.success,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'result': result,
        'success': success,
      };
}
