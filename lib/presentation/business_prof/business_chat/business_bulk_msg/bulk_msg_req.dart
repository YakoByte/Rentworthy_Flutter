import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../../application/validate/validate.dart';
import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_button.dart';
import '../../../../utils/common_components/common_gridview.dart';
import '../../../../utils/common_components/common_outline_button.dart';
import '../../../../utils/common_components/common_searchbar.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/text_input_field.dart';
import '../../../../utils/globals.dart';
import '../../../../utils/images.dart';
import '../../../../utils/import_utils.dart';
import '../../../../utils/text.dart';
import '../../../indi_prof/error/error_screen.dart';
import '../../../shimmers/message_shimmer.dart';
import '../../business_widgets/business_nav_drawer.dart';
import '../../business_widgets/business_search.dart';
import '../business_chat_controller.dart';
import 'bulk_msg_req_controller.dart';

class BulkMsgReq extends ConsumerStatefulWidget {
  const BulkMsgReq({super.key});

  @override
  ConsumerState createState() => _BulkMsgReqState();
}

class _BulkMsgReqState extends ConsumerState<BulkMsgReq> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(bulkMsgReqControllerProvider);
    controller() => ref.read(bulkMsgReqControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: Globals.bulkchatkey,
      backgroundColor: AppColors.white,
      drawer: AdminNavDrawer(
        selectedindex: 4,
      ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
          begin: -1, end: 0, curve: Curves.easeInOutCubic, duration: 400.ms),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return CommonLoader();
            }
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.035),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BusinessSearch(adminscaffoldKey: Globals.bulkchatkey)
                          .animate()
                          .fadeIn(duration: 300.ms)
                          .then(delay: 300.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 600.ms,
                          ),
                      CommonSearchBar(
                        containerwidth: w * 0.9,
                        containerheight: h * 0.06,
                        prefix: const SizedBox(),
                        textStyle: ptSansTextStyle(
                            fontSize: w * 0.04,
                            color: AppColors.black,
                            fontWeight: FontWeight.w700),
                        containercolor: AppColors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        bordercolor: AppColors.black.withOpacity(0.1),
                        searchController: controller().searchController,
                        suffixicon: Icon(Icons.search,
                            color: AppColors.black, size: h * 0.035),
                        onsearchChanged: (str) {
                          controller().filterSearchResults(
                              controller().searchController.text);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.02, vertical: h * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CommonText(
                                text: "Selected user".toUpperCase(),
                                style: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.4),
                                    fontSize: h * 0.023,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      CommonGridView(
                          itemCount: 4,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: false,
                          padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                          childAspectRatio: 0.5,
                          crossAxisSpacing: w * 0.02,
                          mainAxisSpacing: 0,
                          crossAxisCount: 2,
                          maxCrossAxisExtent: w * 0.5,
                          mainAxisExtent: h * 0.12,
                          width: w,
                          height: h * 0.25,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: w * 0.016),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1000),
                                    child: Image.asset(
                                      AppImg.homelist,
                                      height: h * 0.06,
                                      width: h * 0.06,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                CommonText(
                                    text: AppText.hamzaali,
                                    maxLines: 1,
                                    style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.8),
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: w * 0.035,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Container(
                                    height: 18,
                                    width: 18,
                                    margin: EdgeInsets.only(left: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      gradient: LinearGradient(
                                        colors: [
                                          controller().getselectuser[index]
                                              ? AppColors.colorPrimary
                                              : AppColors.transparent,
                                          controller().getselectuser[index]
                                              ? AppColors.colorSecondary
                                              : AppColors.transparent,
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                    ),
                                    child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      side: BorderSide(
                                          color:
                                              controller().getselectuser[index]
                                                  ? AppColors.transparent
                                                  : AppColors.dotcolor,
                                          width: 1.5),
                                      value: controller().getselectuser[index],
                                      tristate: true,
                                      focusColor: AppColors.transparent,
                                      activeColor: AppColors.transparent,
                                      checkColor: AppColors.white,
                                      onChanged: (bool? v) {
                                        controller().selectUser(index);
                                      },
                                    )),
                              ],
                            );
                          }),
                      TextInputField(
                          isCounter: false,
                          maxLines: 10,
                          center: false,
                          hintText: "WRITE MESSAGE",
                          underline: false,
                          cursorHeight: h * 0.025,
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
                          titletextstyle: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.6),
                              fontSize: h * 0.021,
                              fontWeight: FontWeight.w500),
                          errorText: controller().isSubmit == true
                              ? validate(controller().descController.text)
                              : null,
                          onChanged: (value) {
                            setState(() {
                              validate(controller().descController.text);
                            });
                          },
                          maxLength: 4096,
                          errorStyle: ptSansTextStyle(
                              color: AppColors.red,
                              fontSize: h * 0.019,
                              fontWeight: FontWeight.w400),
                          controller: controller().descController,
                          keyboardType: TextInputType.text,
                          containerwidth: w,
                          borderRadius: BorderRadius.circular(4),
                          containerborder: Border.all(
                              color: AppColors.black.withOpacity(0.4)),
                          containerheight: h * 0.3,
                          containercolor: AppColors.white,
                          textCapitalization: TextCapitalization.none),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonOutlineButton(
                              containerwidth: w * 0.42,
                              containerheight: h * 0.065,
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(h * 0.006),
                                side: const BorderSide(
                                    color: AppColors.colorPrimary, width: 2),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: const GradientBoxBorder(
                                  gradient: LinearGradient(colors: [
                                    AppColors.colorPrimary,
                                    AppColors.colorSecondary
                                  ]),
                                  width: 2.5,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              text: "Cancel",
                              textStyle: ptSansTextStyle(
                                  foreground: Paint()
                                    ..shader = const LinearGradient(
                                      colors: <Color>[
                                        AppColors.colorPrimary,
                                        AppColors.colorSecondary
                                      ],
                                    ).createShader(
                                        const Rect.fromLTRB(100, 0, 250, 20)),
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w700),
                              onPressed: () {},
                              side: BorderSide.none,
                            ),
                            CommonButton(
                                containerwidth: w * 0.42,
                                containerheight: h * 0.065,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(h * 0.006),
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          AppColors.colorPrimary,
                                          AppColors.colorSecondary
                                        ])),
                                backgroundColor: AppColors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(h * 0.006),
                                ),
                                text: "Send",
                                textStyle: ptSansTextStyle(
                                    color: AppColors.white,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w700),
                                onPressed: () {
                                  controller().onSend();
                                }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            return CommonLoader();
          }),
    );
  }
}
