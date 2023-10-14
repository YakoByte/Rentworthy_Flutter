import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/statistics_report/statistics_report_repo.dart';
import '../../../model/indi_prof/statistics_report/get_reports/get_reports.dart';
import '../../../model/indi_prof/statistics_report/get_summary/get_summary.dart';

abstract class StatReportService {
  Future<GetReport?> getReportData();

  Future<GetSummary?> getSummaryData();
}

class StatReportServiceV1 implements StatReportService {
  StatReportServiceV1(
    this.statReportRepository,
  );

  final StatReportRepository statReportRepository;

  @override
  Future<GetReport?> getReportData() async {
    return await statReportRepository.getReportData();
  }

  @override
  Future<GetSummary?> getSummaryData() async {
    return await statReportRepository.getSummaryData();
  }
}

final statReportServiceProvider =
    Provider.autoDispose<StatReportService>((ref) {
  final service = StatReportServiceV1(
    ref.watch(statReportRepositoryProvider),
  );
  return service;
});
