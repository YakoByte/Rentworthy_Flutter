import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding.freezed.dart';

mixin OnBoardingitem {
  String get img;

  String get titletext;

  String get subtitletext;
}

@freezed
abstract class OnBoardingModel with _$OnBoardingModel, OnBoardingitem {
  const factory OnBoardingModel({
    required String img,
    required String titletext,
    required String subtitletext,
  }) = _OnBoardingModel;

  factory OnBoardingModel.empty() => const OnBoardingModel(
        img: '',
        titletext: '',
        subtitletext: '',
      );
}
//onboarding get api response
// {
// 'id': id,
// 'img': img,
// 'titletext': titletext,
// 'subtitletext': subtitletext,
// };
