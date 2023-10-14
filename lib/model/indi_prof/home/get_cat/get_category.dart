import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_category.freezed.dart';

part 'get_category.g.dart';

@freezed
abstract class GetCategory with _$GetCategory {
  const factory GetCategory({
    required bool? success,
    required String? message,
    required List<CategoryData>? data,
  }) = _GetCategory;

  factory GetCategory.fromJson(Map<String, dynamic> json) =>
      _$GetCategoryFromJson(json);
}

@freezed
abstract class CategoryData with _$CategoryData {
  const factory CategoryData({
    required String? id,
    required String? name,
    required String? img,
  }) = _CategoryData;

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}
