import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/business_prof/admin/admin_panel_repo.dart';
import '../../../data/indi_prof/address/address_repo.dart';
import '../../../model/business_prof/admin/analytics/get_admin_panel_analytics.dart';
import '../../../model/business_prof/admin/chart/get_chart.dart';
import '../../../model/indi_prof/address/get_address/get_address.dart';

abstract class AddressService {
  Future<GetChart?> getLocationChartData();

  Future<GetChart?> getDeviceChartData();

  Future<AnalyticsResponse?> getAnalyticsResponseData();
}

class AddressServiceV1 implements AddressService {
  AddressServiceV1(
    this.adminPanelRepository,
  );

  final AdminPanelRepository adminPanelRepository;

  @override
  Future<GetChart?> getLocationChartData() async {
    return await adminPanelRepository.getLocationChartData();
  }

  @override
  Future<GetChart?> getDeviceChartData() async {
    return await adminPanelRepository.getDeviceChartData();
  }

  @override
  Future<AnalyticsResponse?> getAnalyticsResponseData() async {
    return await adminPanelRepository.getAnalyticsResponseData();
  }
}

final addressServiceProvider = Provider.autoDispose<AddressService>((ref) {
  final service = AddressServiceV1(
    ref.watch(adminPanelRepositoryProvider),
  );
  return service;
});
