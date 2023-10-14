import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/indi_prof/home/get_cat/get_category.dart';
import '../../../model/indi_prof/home/get_items/get_items.dart';
import '../../../model/indi_prof/home/get_loc/get_location.dart';
import '../../../utils/import_utils.dart';

abstract class HomeRepository {
  Future<GetCategory?> getCategoryData();

  Future<GetItem?> getItemData();

  Future<GetLocation?> getLocationData();
}

class HomeRepositoryV1 extends HomeRepository {
  final List<ItemData> _onItemData = [
    const ItemData(
        id: "1",
        name: "Product 1",
        imgs: [AppImg.xbox, AppImg.xbox, AppImg.xbox],
        thumbnail: AppImg.xbox,
        desc: "Product 1 Description",
        location: "Location 1",
        time_period: "Time Period 1",
        lat: "1.0",
        long: "1.0",
        link: "Link 1",
        price: "100",
        isfav: false),
  ];

  List<ItemData>? get onItemData => _onItemData;
  final List<GetLocData> _onGetLocDatalist = [
    const GetLocData(
      loc_id: "1",
      location: "Location 1",
      lat: "1.0",
      long: "1.0",
    ),
  ];

  List<GetLocData>? get onGetLocDatalist => _onGetLocDatalist;
  final List<CategoryData> _onCategoryDatalist = [
    const CategoryData(id: "1", name: "Cat1", img: AppImg.xbox),
  ];

  List<CategoryData>? get onCategoryDatalist => _onCategoryDatalist;

  @override
  Future<GetCategory?> getCategoryData() async {
    return GetCategory(success: true, message: "OK", data: _onCategoryDatalist);
  }

  @override
  Future<GetItem?> getItemData() async {
    return GetItem(success: true, message: "OK", data: _onItemData);
  }

  @override
  Future<GetLocation?> getLocationData() async {
    return GetLocation(success: true, message: "OK", data: _onGetLocDatalist);
  }
}

final homeRepositoryProvider =
    Provider<HomeRepository>((ref) => HomeRepositoryV1());
