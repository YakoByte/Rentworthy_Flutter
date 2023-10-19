import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../application/dialog/dialog_service.dart';
import '../../../../application/validate/validate.dart';
import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_appbar.dart';
import '../../../../utils/common_components/common_button.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/text_input_field.dart';
import '../../../../utils/images.dart';
import '../../../../utils/import_utils.dart';
import '../../../../utils/text.dart';
import '../../../shimmers/edit_profile_shimmer.dart';
import '../../error/error_screen.dart';
import 'edit_profile_screen_cntroller.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(editProfileControllerProvider);
    controller() => ref.read(editProfileControllerProvider.notifier);

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
                  fontSize: w * 0.05,
                  color: AppColors.black.withOpacity(0.8),
                  fontWeight: FontWeight.w700),
              text: AppText.editprof,
            ),
          ),
        ),
        body: asyncState.when(
            data: (data) {
              if (controller().isLoading) {
                return CommonLoader();
              }
              return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                  height: h * 0.85,
                  color: AppColors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: h * 0.58,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CommonText(
                                style: ptSansTextStyle(
                                    fontSize: w * 0.05,
                                    color: AppColors.black.withOpacity(0.8),
                                    fontWeight: FontWeight.w700),
                                text: AppText.basicinfo,
                              )
                                  .animate()
                                  .fadeIn(duration: 150.ms)
                                  .then(delay: 150.ms)
                                  .slideX(
                                      begin: 10,
                                      end: 0,
                                      curve: Curves.easeInOutCubic,
                                      duration: 1000.ms),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(dialogServiceProvider)
                                          .commonImagePicker(
                                            picker: controller().imagePicker,
                                            pickedImage: (file) {
                                              controller().onImgSelect(
                                                val: file,
                                              );
                                            },
                                          );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(right: w * 0.02),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                        child: Stack(
                                          children: [
                                            controller().selectedImage == null
                                                ? Image.asset(
                                                    AppImg.homelist,
                                                    height: h * 0.075,
                                                    width: h * 0.075,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.file(
                                                    controller().selectedImage!,
                                                    height: h * 0.075,
                                                    width: h * 0.075,
                                                    fit: BoxFit.cover,
                                                  ),
                                            Positioned(
                                              bottom: 0,
                                              child: Container(
                                                width: h * 0.078,
                                                height: h * 0.031,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius
                                                            .vertical(
                                                            bottom:
                                                                Radius.circular(
                                                                    1000)),
                                                    color: AppColors
                                                        .colorPrimarylight
                                                        .withOpacity(0.7)),
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: AppColors.white,
                                                  size: h * 0.02,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextInputField(
                                      hintText: AppText.urname,
                                      lableText: AppText.urname,
                                      maxLength: 30,
                                      isCounter: true,
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      enableunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      disableunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      focusunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      underlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      hintStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w400),
                                      textstyle: ptSansTextStyle(
                                          color: AppColors.black,
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w500),
                                      lableStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          fontSize: h * 0.021,
                                          fontWeight: FontWeight.w400),
                                      errorText: "",
                                      errorStyle: ptSansTextStyle(
                                          color: AppColors.red,
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w400),
                                      controller: controller().nameController,
                                      keyboardType: TextInputType.text,
                                      containerwidth: w * 0.7,
                                      containerheight: h * 0.06,
                                      containercolor: AppColors.white,
                                      textCapitalization:
                                          TextCapitalization.none),
                                ],
                              )
                                  .animate()
                                  .fadeIn(duration: 200.ms)
                                  .then(delay: 200.ms)
                                  .slideX(
                                      begin: 10,
                                      end: 0,
                                      curve: Curves.easeInOutCubic,
                                      duration: 1000.ms),
                              TextInputField(
                                      isCounter: true,
                                      maxLines: 3,
                                      center: false,
                                      isdescription: true,
                                      hintText: AppText.smthingabtyou,
                                      lableText: AppText.smthingabtyou,
                                      hintStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w400),
                                      textstyle: ptSansTextStyle(
                                          color: AppColors.black,
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w500),
                                      lableStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          fontSize: h * 0.021,
                                          fontWeight: FontWeight.w400),
                                      errorText: "",
                                      maxLength: 140,
                                      enableunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      disableunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      focusunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      underlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      errorStyle: ptSansTextStyle(
                                          color: AppColors.red,
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w400),
                                      controller:
                                          controller().aboutyouController,
                                      keyboardType: TextInputType.text,
                                      containerwidth: w,
                                      containerheight: h * 0.06,
                                      containercolor: AppColors.white,
                                      textCapitalization:
                                          TextCapitalization.none)
                                  .animate()
                                  .fadeIn(duration: 250.ms)
                                  .then(delay: 250.ms)
                                  .slideX(
                                      begin: 10,
                                      end: 0,
                                      curve: Curves.easeInOutCubic,
                                      duration: 1000.ms),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: h * 0.02),
                                child: CommonText(
                                  style: ptSansTextStyle(
                                      fontSize: w * 0.05,
                                      color: AppColors.black.withOpacity(0.8),
                                      fontWeight: FontWeight.w700),
                                  text: AppText.continfo,
                                ),
                              )
                                  .animate()
                                  .fadeIn(duration: 300.ms)
                                  .then(delay: 300.ms)
                                  .slideX(
                                      begin: 10,
                                      end: 0,
                                      curve: Curves.easeInOutCubic,
                                      duration: 1000.ms),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextInputField(
                                      enableunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      disableunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      focusunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      underlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      hintText: AppText.countrycode,
                                      titleText: AppText.country,
                                      titletextstyle: ptSansTextStyle(
                                          color: AppColors.textcolor1,
                                          fontSize: h * 0.018,
                                          fontWeight: FontWeight.w400),
                                      hintStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w400),
                                      textstyle: ptSansTextStyle(
                                          color: AppColors.black,
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w500),
                                      lableStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          fontSize: h * 0.021,
                                          fontWeight: FontWeight.w400),
                                      errorText: controller().issubmit == true
                                          ? validate(controller()
                                              .countryCodeController
                                              .text)
                                          : null,
                                      onChanged: (value) {
                                        setState(() {
                                          controller().issubmit == true
                                              ? validate(controller()
                                                  .countryCodeController
                                                  .text)
                                              : null;
                                        });
                                      },
                                      errorStyle: ptSansTextStyle(
                                          color: AppColors.red,
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w400),
                                      controller:
                                          controller().countryCodeController,
                                      keyboardType: TextInputType.phone,
                                      containerwidth: w * 0.15,
                                      containerheight: h * 0.06,
                                      containercolor: AppColors.white,
                                      textCapitalization:
                                          TextCapitalization.none),
                                  TextInputField(
                                      maxLength: 10,
                                      enableunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      disableunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      focusunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      underlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      hintText: AppText.enterphone,
                                      titleText: " ",
                                      titletextstyle: ptSansTextStyle(
                                          color: AppColors.textcolor1,
                                          fontSize: h * 0.018,
                                          fontWeight: FontWeight.w400),
                                      hintStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w400),
                                      textstyle: ptSansTextStyle(
                                          color: AppColors.black,
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w500),
                                      lableStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          fontSize: h * 0.021,
                                          fontWeight: FontWeight.w400),
                                      errorText: controller().issubmit == true
                                          ? validatephone(
                                              controller().phoneController.text)
                                          : null,
                                      onChanged: (value) {
                                        setState(() {
                                          controller().issubmit == true
                                              ? validatephone(controller()
                                                  .phoneController
                                                  .text)
                                              : null;
                                        });
                                      },
                                      errorStyle: ptSansTextStyle(
                                          color: AppColors.red,
                                          fontSize: h * 0.017,
                                          fontWeight: FontWeight.w400),
                                      controller: controller().phoneController,
                                      keyboardType: TextInputType.phone,
                                      containerwidth: w * 0.6,
                                      containerheight: h * 0.06,
                                      containercolor: AppColors.white,
                                      textCapitalization:
                                          TextCapitalization.none),
                                ],
                              )
                                  .animate()
                                  .fadeIn(duration: 350.ms)
                                  .then(delay: 350.ms)
                                  .slideX(
                                      begin: 10,
                                      end: 0,
                                      curve: Curves.easeInOutCubic,
                                      duration: 1000.ms),
                              TextInputField(
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      enableunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      disableunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      focusunderlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      underlinecolor:
                                          AppColors.black.withOpacity(0.6),
                                      hintText: AppText.email,
                                      lableText: AppText.email,
                                      hintStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w400),
                                      textstyle: ptSansTextStyle(
                                          color: AppColors.black,
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w500),
                                      lableStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          fontSize: h * 0.021,
                                          fontWeight: FontWeight.w400),
                                      errorText: "",
                                      errorStyle: ptSansTextStyle(
                                          color: AppColors.red,
                                          fontSize: h * 0.019,
                                          fontWeight: FontWeight.w400),
                                      controller: controller().emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      containerwidth: w,
                                      isCounter: false,
                                      containerheight: h * 0.06,
                                      containercolor: AppColors.white,
                                      textCapitalization:
                                          TextCapitalization.none)
                                  .animate()
                                  .fadeIn(duration: 400.ms)
                                  .then(delay: 400.ms)
                                  .slideX(
                                      begin: 10,
                                      end: 0,
                                      curve: Curves.easeInOutCubic,
                                      duration: 1000.ms),
                              CommonText(
                                style: ptSansTextStyle(
                                    fontSize: h * 0.018,
                                    color: AppColors.black.withOpacity(0.8),
                                    fontWeight: FontWeight.w500),
                                text: AppText.verifiedemail,
                              )
                                  .animate()
                                  .fadeIn(duration: 450.ms)
                                  .then(delay: 450.ms)
                                  .slideX(
                                      begin: 10,
                                      end: 0,
                                      curve: Curves.easeInOutCubic,
                                      duration: 1000.ms),
                            ],
                          ),
                        ),
                        CommonButton(
                                containerwidth: w,
                                containerheight: h * 0.06,
                                decoration:
                                    BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(h * 0.005),
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
                                      BorderRadius.circular(h * 0.005),
                                ),
                                text: AppText.save,
                                textStyle: ptSansTextStyle(
                                    color: AppColors.white,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w700),
                                onPressed: () {
                                  controller().onSave();
                                })
                            .animate()
                            .fadeIn(duration: 500.ms)
                            .then(delay: 500.ms)
                            .slideX(
                                begin: 10,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 1000.ms),
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
            }));
  }
}
