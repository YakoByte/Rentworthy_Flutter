import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/indi_prof/statistics_report/get_reports/get_reports.dart';
import '../../../model/indi_prof/statistics_report/get_summary/get_summary.dart';

abstract class StatReportRepository {
  Future<GetReport?> getReportData();

  Future<GetSummary?> getSummaryData();
}

class StatReportRepositoryV1 extends StatReportRepository {
  final List<ReportData> _onReportDataList = [
    const ReportData(
        id: "1",
        report_title: "Report 1",
        report_subtitle: "Report 1 Subtitle",
        report_val: "10"),
  ];

  List<ReportData>? get onReportDataList => _onReportDataList;

  @override
  Future<GetReport?> getReportData() async {
    return GetReport(success: true, message: "OK", data: _onReportDataList);
  }

  @override
  Future<GetSummary?> getSummaryData() async {
    return const GetSummary(
        success: true,
        message: "OK",
        active_rental: "09",
        requests: "02",
        rented: "01",
        requested: "06");
  }
}

final statReportRepositoryProvider =
    Provider<StatReportRepository>((ref) => StatReportRepositoryV1());
