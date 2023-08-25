import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/utils/common_components/common_listview.dart';
import 'package:rentworthy/utils/images.dart';

import '../../../../../../utils/color.dart';
import '../../../../../../utils/common_components/common_appbar.dart';
import '../../../../../../utils/common_components/common_navigator.dart';
import '../../../../../../utils/common_components/common_text.dart';
import '../../../../../../utils/text.dart';
import '../all_review/all_review.dart';

class WriteReviewScreen extends ConsumerWidget {
  const WriteReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final asyncState = ref.watch(editProfileControllerProvider);
    // controller() => ref.read(editProfileControllerProvider.notifier);

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
            text: AppText.reviews,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: AppColors.black.withOpacity(0.1),
              height: h * 0.01,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.035, vertical: h * 0.015),
              child: Column(
                children: [
                  Container(
                    height: h * 0.2,
                    width: w,
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.01),
                    decoration: BoxDecoration(
                      color: AppColors.backcolor,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: h * 0.01),
                          child: Container(
                            width: w * 0.35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    text: "3.7",
                                    style: ptSansTextStyle(
                                        color: AppColors.black.withOpacity(0.8),
                                        fontSize: h * 0.04,
                                        fontWeight: FontWeight.w900),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "/5",
                                        style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.8),
                                            fontSize: h * 0.025,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                                CommonText(
                                    text: AppText.basedonrev,
                                    maxLines: 2,
                                    style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.6),
                                      fontSize: h * 0.022,
                                      fontWeight: FontWeight.w600,
                                    )),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  unratedColor: AppColors.dotcolor,
                                  itemSize: h * 0.028,
                                  itemPadding: EdgeInsets.zero,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star_rounded,
                                    color: AppColors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: h * 0.01),
                          child: Container(
                            width: w * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonText(
                                        text: AppText.star5,
                                        maxLines: 1,
                                        style: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.023,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Container(
                                      width: w * 0.32,
                                      child: LinearProgressIndicator(
                                        minHeight: h * 0.013,
                                        borderRadius: BorderRadius.circular(10),
                                        value: 0.4,
                                        backgroundColor: AppColors.grey,
                                        color: AppColors.amber,
                                        semanticsLabel:
                                            'Linear progress indicator',
                                        semanticsValue:
                                            'Linear progress indicator',
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                AppColors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonText(
                                        text: AppText.star4,
                                        maxLines: 1,
                                        style: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.023,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Container(
                                      width: w * 0.32,
                                      child: LinearProgressIndicator(
                                        minHeight: h * 0.013,
                                        borderRadius: BorderRadius.circular(10),
                                        value: 0.5,
                                        backgroundColor: AppColors.grey,
                                        color: AppColors.amber,
                                        semanticsLabel:
                                            'Linear progress indicator',
                                        semanticsValue:
                                            'Linear progress indicator',
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                AppColors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonText(
                                        text: AppText.star3,
                                        maxLines: 1,
                                        style: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.023,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Container(
                                      width: w * 0.32,
                                      child: LinearProgressIndicator(
                                        minHeight: h * 0.013,
                                        borderRadius: BorderRadius.circular(10),
                                        value: 0.6,
                                        backgroundColor: AppColors.grey,
                                        color: AppColors.amber,
                                        semanticsLabel:
                                            'Linear progress indicator',
                                        semanticsValue:
                                            'Linear progress indicator',
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                AppColors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonText(
                                        text: AppText.star2,
                                        maxLines: 1,
                                        style: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.023,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Container(
                                      width: w * 0.32,
                                      child: LinearProgressIndicator(
                                        minHeight: h * 0.013,
                                        borderRadius: BorderRadius.circular(10),
                                        value: 0.7,
                                        backgroundColor: AppColors.grey,
                                        color: AppColors.amber,
                                        semanticsLabel:
                                            'Linear progress indicator',
                                        semanticsValue:
                                            'Linear progress indicator',
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                AppColors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonText(
                                        text: AppText.star1,
                                        maxLines: 1,
                                        style: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.023,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Container(
                                      width: w * 0.32,
                                      child: LinearProgressIndicator(
                                        minHeight: h * 0.013,
                                        borderRadius: BorderRadius.circular(10),
                                        value: 0.3,
                                        backgroundColor: AppColors.grey,
                                        color: AppColors.amber,
                                        semanticsLabel:
                                            'Linear progress indicator',
                                        semanticsValue:
                                            'Linear progress indicator',
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                AppColors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.03,
                    thickness: 1,
                  ),
                  InkWell(
                    onTap: () {
                      commonNavigator(
                        context: context,
                        child: AllReviewScreen(),
                        type: PageTransitionType.rightToLeftWithFade,
                      );
                    },
                    child: Container(
                      height: h * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: w * 0.03,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppImg.roundchat,
                                      height: h * 0.04,
                                      width: w * 0.08,
                                      fit: BoxFit.cover,
                                      color: AppColors.black.withOpacity(0.3),
                                    ),
                                  ],
                                ),
                              ),
                              CommonText(
                                  text: AppText.addreview,
                                  maxLines: 1,
                                  style: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.6),
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: h * 0.025,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_sharp,
                              color: AppColors.black.withOpacity(0.6),
                              size: h * 0.025)
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.025,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      CommonText(
                        style: ptSansTextStyle(
                            fontSize: w * 0.065,
                            color: AppColors.black.withOpacity(0.8),
                            fontWeight: FontWeight.w700),
                        text: AppText.userreviews,
                      ),
                    ],
                  ),
                  CommonListView(
                      itemCount: 16,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      width: w,
                      height: (h * 0.22) * 16,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: h * 0.01),
                          child: Container(
                            width: w,
                            decoration: BoxDecoration(
                              color: AppColors.backcolor,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.035, vertical: h * 0.01),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(1000),
                                            child: Image.asset(
                                              AppImg.homelist,
                                              height: h * 0.035,
                                              width: h * 0.035,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: w * 0.02),
                                            child: CommonText(
                                              text: index.isEven
                                                  ? "Dua Lipa"
                                                  : "Samantha",
                                              maxLines: 1,
                                              style: ptSansTextStyle(
                                                  fontSize: w * 0.045,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: AppColors.black
                                                      .withOpacity(0.8),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          CommonText(
                                            text: index.isEven
                                                ? "2 days ago"
                                                : "6 days ago",
                                            maxLines: 1,
                                            style: ptSansTextStyle(
                                                fontSize: w * 0.025,
                                                overflow: TextOverflow.ellipsis,
                                                color: AppColors.black
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      RatingBar.builder(
                                        initialRating: index * 0.3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        unratedColor: AppColors.dotcolor,
                                        itemSize: h * 0.02,
                                        itemPadding: EdgeInsets.zero,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star_rounded,
                                          color: AppColors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      )
                                    ],
                                  ),
                                  CommonText(
                                    text: index.isEven
                                        ? "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."
                                        : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet, consectetur adipiscing elit.  ",
                                    style: ptSansTextStyle(
                                        fontSize: w * 0.04,
                                        color: AppColors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
