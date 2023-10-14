import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/business_prof/admin/analytics/get_admin_panel_analytics.dart';
import '../../../model/business_prof/admin/chart/get_chart.dart';
import '../../../model/indi_prof/address/get_address/get_address.dart';

abstract class AdminPanelRepository {
  Future<GetChart?> getDeviceChartData();

  Future<GetChart?> getLocationChartData();

  Future<AnalyticsResponse?> getAnalyticsResponseData();
}

class AdminPanelRepositoryV1 extends AdminPanelRepository {
  final List<GetChartData> _onDeviceChartData = [
    const GetChartData(xVal: "Linux", yVal: "15.0", type: "Traffic by Device"),
    const GetChartData(xVal: "Mac", yVal: "22.0", type: "Traffic by Device"),
    const GetChartData(xVal: "iOS", yVal: "18.0", type: "Traffic by Device"),
    const GetChartData(
        xVal: "Windows", yVal: "25.0", type: "Traffic by Device"),
    const GetChartData(xVal: "Android", yVal: "5.0", type: "Traffic by Device"),
    const GetChartData(xVal: "Other", yVal: "22.0", type: "Traffic by Device"),
  ];

  List<GetChartData>? get onDeviceChartData => _onDeviceChartData;

  final List<GetChartData> _onLocationChartData = [
    const GetChartData(
        xVal: "United States", yVal: "38.6", type: "Traffic by Location"),
    const GetChartData(
        xVal: "Canada", yVal: "30.8", type: "Traffic by Location"),
    const GetChartData(xVal: "Other", yVal: "8.1", type: "Traffic by Location"),
    const GetChartData(
        xVal: "Mexico", yVal: "22.5", type: "Traffic by Location"),
  ];

  List<GetChartData>? get onLocationChartData => _onLocationChartData;

  final List<AnalyticsData> _onAnalyticsData = [
    const AnalyticsData(
        title: "Views", total_value: "721K", percent: "+11.01%"),
    const AnalyticsData(
        title: "Profile Views", total_value: "367K", percent: "-03.01%"),
    const AnalyticsData(
        title: "New Interactions", total_value: "1,156K", percent: "+15.03%"),
    const AnalyticsData(
        title: "Active Orders", total_value: "24K", percent: "+6.08%"),
  ];

  List<AnalyticsData>? get onAnalyticsData => _onAnalyticsData;

  @override
  Future<GetChart?> getDeviceChartData() async {
    return GetChart(success: true, message: "OK", data: _onDeviceChartData);
  }

  @override
  Future<GetChart?> getLocationChartData() async {
    return GetChart(success: true, message: "OK", data: _onLocationChartData);
  }

  @override
  Future<AnalyticsResponse?> getAnalyticsResponseData() async {
    return AnalyticsResponse(
        success: true, message: "OK", data: _onAnalyticsData);
  }
}

final adminPanelRepositoryProvider =
    Provider<AdminPanelRepository>((ref) => AdminPanelRepositoryV1());
