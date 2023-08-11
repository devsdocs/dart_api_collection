// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../doodstream.dart';

class DoodstreamAccountReport {
  DoodstreamAccountReport({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory DoodstreamAccountReport.fromJson(String str) =>
      DoodstreamAccountReport.fromMap(json.decode(str));

  factory DoodstreamAccountReport.fromMap(Map<String, dynamic> json) =>
      DoodstreamAccountReport(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<AccountReportResult>.from(
                json['result']!.map((x) => AccountReportResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<AccountReportResult>? result;
  final DateTime? serverTime;
  final int? status;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'result': result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toMap())),
        'server_time': serverTime?.toIso8601String(),
        'status': status,
      };
}

class AccountReportResult {
  AccountReportResult({
    this.day,
    this.downloads,
    this.profitTotal,
    this.profitViews,
    this.views,
  });

  factory AccountReportResult.fromJson(String str) =>
      AccountReportResult.fromMap(json.decode(str));

  factory AccountReportResult.fromMap(Map<String, dynamic> json) =>
      AccountReportResult(
        day: json['day'] == null ? null : DateTime.parse(json['day']),
        downloads: json['downloads'],
        profitTotal: json['profit_total'],
        profitViews: json['profit_views'],
        views: json['views'],
      );
  final DateTime? day;
  final int? downloads;
  final String? profitTotal;
  final String? profitViews;
  final int? views;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'day':
            "${day!.year.toString().padLeft(4, '0')}-${day!.month.toString().padLeft(2, '0')}-${day!.day.toString().padLeft(2, '0')}",
        'downloads': downloads,
        'profit_total': profitTotal,
        'profit_views': profitViews,
        'views': views,
      };
}
