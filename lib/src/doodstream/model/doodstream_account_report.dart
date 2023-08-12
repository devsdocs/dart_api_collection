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
            : List<DoodstreamAccountReportResult>.from(
                json['result']!.map((x) => DoodstreamAccountReportResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<DoodstreamAccountReportResult>? result;
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

class DoodstreamAccountReportResult {
  DoodstreamAccountReportResult({
    this.day,
    this.downloads,
    this.profitTotal,
    this.profitViews,
    this.views,
  });

  factory DoodstreamAccountReportResult.fromJson(String str) =>
      DoodstreamAccountReportResult.fromMap(json.decode(str));

  factory DoodstreamAccountReportResult.fromMap(Map<String, dynamic> json) =>
      DoodstreamAccountReportResult(
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
