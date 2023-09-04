import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../utils/color.dart';
import '../../../../../../utils/common_components/common_appbar.dart';
import '../../../../../../utils/common_components/common_button.dart';
import '../../../../../../utils/common_components/common_text.dart';
import '../../../../../../utils/common_components/text_input_field.dart';
import '../../../../../../utils/text.dart';
import 'all_review_controller.dart';

class AllReviewScreen extends ConsumerStatefulWidget {
  const AllReviewScreen({super.key});

  @override
  ConsumerState createState() => _AllReviewScreenState();
}

class _AllReviewScreenState extends ConsumerState<AllReviewScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(allReviewControllerProvider);
    controller() => ref.read(allReviewControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        leadingicon: true,
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.02,
          vertical: h * 0.005,
        ),
        backgroundColor: AppColors.white,
        centerTitle: false,
        centerwidget: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.02,
          ),
          child: CommonText(
            style: ptSansTextStyle(
                fontSize: w * 0.055,
                color: AppColors.black.withOpacity(0.8),
                fontWeight: FontWeight.w700),
            text: AppText.writereviews,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Divider(
                color: AppColors.black.withOpacity(0.1),
                height: h * 0.01,
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.045,
                  vertical: h * 0.005,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: h * 0.03,
                      ),
                      child: TextInputField(
                          isCounter: true,
                          maxLines: 3,
                          center: false,
                          isdescription: true,
                          hintText: AppText.writehere,
                          lableText: AppText.writeabouttheproduct,
                          enableunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                          disableunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                          focusunderlinecolor: AppColors.black.withOpacity(0.6),
                          underlinecolor: AppColors.black.withOpacity(0.6),
                          hintStyle: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.6),
                              fontSize: h * 0.019,
                              fontWeight: FontWeight.w400),
                          textstyle: ptSansTextStyle(
                              color: AppColors.black,
                              fontSize: h * 0.019,
                              fontWeight: FontWeight.w500),
                          lableStyle: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.6),
                              fontSize: h * 0.021,
                              fontWeight: FontWeight.w400),
                          errorText: "",
                          maxLength: 140,
                          onChanged: (value) {
                            setState(() {});
                          },
                          errorStyle: ptSansTextStyle(
                              color: AppColors.red,
                              fontSize: h * 0.019,
                              fontWeight: FontWeight.w400),
                          controller: controller().reviewController,
                          keyboardType: TextInputType.text,
                          containerwidth: w,
                          containerheight: h * 0.06,
                          containercolor: AppColors.white,
                          textCapitalization: TextCapitalization.none),
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      unratedColor: AppColors.dotcolor,
                      itemSize: h * 0.065,
                      itemPadding: EdgeInsets.zero,
                      itemBuilder: (context, _) => Icon(
                        Icons.star_rounded,
                        color: AppColors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: h * 0.04, horizontal: w * 0.045),
            child: CommonButton(
                containerwidth: w,
                containerheight: h * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(h * 0.005),
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.colorPrimary,
                          AppColors.colorSecondary
                        ])),
                backgroundColor: AppColors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(h * 0.005),
                ),
                text: AppText.submit,
                textStyle: ptSansTextStyle(
                    color: AppColors.white,
                    fontSize: h * 0.019,
                    fontWeight: FontWeight.w700),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
