// ignore_for_file: argument_type_not_assignable, avoid_dynamic_calls

part of '../../streamwish.dart';

class StreamwishAccountStat {
  StreamwishAccountStat({
    this.msg,
    this.result,
    this.serverTime,
    this.status,
  });

  factory StreamwishAccountStat.fromJson(String str) =>
      StreamwishAccountStat.fromMap(json.decode(str));

  factory StreamwishAccountStat.fromMap(Map<String, dynamic> json) =>
      StreamwishAccountStat(
        msg: json['msg'],
        result: json['result'] == null
            ? []
            : List<StreamwishAccountStatResult>.from(
                json['result']!
                    .map((x) => StreamwishAccountStatResult.fromMap(x)),
              ),
        serverTime: json['server_time'] == null
            ? null
            : DateTime.parse(json['server_time']),
        status: json['status'],
      );
  final String? msg;
  final List<StreamwishAccountStatResult>? result;
  final DateTime? serverTime;
  final int? status;

  StreamwishAccountStat copyWith({
    String? msg,
    List<StreamwishAccountStatResult>? result,
    DateTime? serverTime,
    int? status,
  }) =>
      StreamwishAccountStat(
        msg: msg ?? this.msg,
        result: result ?? this.result,
        serverTime: serverTime ?? this.serverTime,
        status: status ?? this.status,
      );

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

class StreamwishAccountStatResult {
  StreamwishAccountStatResult({
    this.day,
    this.downloads,
    this.profitRefs,
    this.profitSales,
    this.profitSite,
    this.profitTotal,
    this.profitViews,
    this.refs,
    this.sales,
    this.views,
    this.viewsAdb,
    this.viewsPrem,
  });

  factory StreamwishAccountStatResult.fromJson(String str) =>
      StreamwishAccountStatResult.fromMap(json.decode(str));

  factory StreamwishAccountStatResult.fromMap(Map<String, dynamic> json) =>
      StreamwishAccountStatResult(
        day: json['day'] == null ? null : DateTime.parse(json['day']),
        downloads: json['downloads'],
        profitRefs: json['profit_refs'],
        profitSales: json['profit_sales'],
        profitSite: json['profit_site'],
        profitTotal: json['profit_total'],
        profitViews: json['profit_views'],
        refs: json['refs'],
        sales: json['sales'],
        views: json['views'],
        viewsAdb: json['views_adb'],
        viewsPrem: json['views_prem'],
      );
  final DateTime? day;
  final String? downloads;
  final String? profitRefs;
  final String? profitSales;
  final String? profitSite;
  final String? profitTotal;
  final String? profitViews;
  final String? refs;
  final String? sales;
  final String? views;
  final String? viewsAdb;
  final String? viewsPrem;

  StreamwishAccountStatResult copyWith({
    DateTime? day,
    String? downloads,
    String? profitRefs,
    String? profitSales,
    String? profitSite,
    String? profitTotal,
    String? profitViews,
    String? refs,
    String? sales,
    String? views,
    String? viewsAdb,
    String? viewsPrem,
  }) =>
      StreamwishAccountStatResult(
        day: day ?? this.day,
        downloads: downloads ?? this.downloads,
        profitRefs: profitRefs ?? this.profitRefs,
        profitSales: profitSales ?? this.profitSales,
        profitSite: profitSite ?? this.profitSite,
        profitTotal: profitTotal ?? this.profitTotal,
        profitViews: profitViews ?? this.profitViews,
        refs: refs ?? this.refs,
        sales: sales ?? this.sales,
        views: views ?? this.views,
        viewsAdb: viewsAdb ?? this.viewsAdb,
        viewsPrem: viewsPrem ?? this.viewsPrem,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'day':
            "${day!.year.toString().padLeft(4, '0')}-${day!.month.toString().padLeft(2, '0')}-${day!.day.toString().padLeft(2, '0')}",
        'downloads': downloads,
        'profit_refs': profitRefs,
        'profit_sales': profitSales,
        'profit_site': profitSite,
        'profit_total': profitTotal,
        'profit_views': profitViews,
        'refs': refs,
        'sales': sales,
        'views': views,
        'views_adb': viewsAdb,
        'views_prem': viewsPrem,
      };
}
