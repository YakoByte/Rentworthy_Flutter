import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../utils/import_utils.dart';

class TermsService extends ConsumerWidget {
  const TermsService({super.key});

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
                fontSize: w * 0.05,
                color: AppColors.black.withOpacity(0.8),
                fontWeight: FontWeight.w700),
            text: AppText.tns,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImg.termsnservice,
                height: h * 0.4,
                width: w,
                fit: BoxFit.contain,
              ),
              CommonText(
                text:
                    "INFORMATION CONTAINED HEREIN SETS FORTH YOUR RIGHTS AND OBLIGATIONS WITH RESPECT TO THE TRANSACTION(S) CONTEMPLATED FOR HEREBY. "
                    "THESE TERMS REQUIRE THE USE OF ARBITRATION (ON AN INDIVIDUAL BASIS ONLY; I.E., CASE CONSOLIDATIONS AND CLASS-ACTIONS ARE NOT PERMITTED) "
                    "IN ORDER TO RESOLVE DISPUTES. PLEASE REVIEW THIS DOCUMENT IN ITS ENTIRETY BEFORE ENTERING INTO ANY TRANSACTION HEREUNDER IN ORDER TO CONFIRM "
                    "YOUR ACCEPTANCE HEREOF. YOU MAY NOT ORDER OR OBTAIN PRODUCTS OR SERVICES FROM THIS WEBSITE UNLESS AND UNTIL YOU: (A) AGREE TO THESE TERMS AND"
                    " CONDITIONS IN THEIR ENTIRETY; (B) ARE AT LEAST 18 YEARS OLD; AND (C) ARE NOT PROHIBITED FROM ACCESSING OR USING THIS WEBSITE OR ANY OF THIS"
                    " WEBSITE'S CONTENTS, GOODS, OR SERVICES BY ANY APPLICABLE LAW, RULE, OR REGULATION\n\n1. Applicability of Terms and Conditions.These terms and "
                    "conditions (these \"Terms\") shall apply to your purchase of products and related services through the Rent Worthy platform (the \"Site\"). "
                    "These Terms are subject to change at any time without prior written notice by [Rent Worthy] (referred to herein as either “Company,” “we,” “us,” or "
                    "“our”). The most recent version of these Terms shall be posted for your review at any time on the Site. Please review these Terms in their entirety"
                    " prior to engaging in any transaction on the Site. Your continued use of the Site after any posting of updated Terms (which shall be dated as of their"
                    " most recent update) shall constitute your acceptance of and agreement to any change",
                style: ptSansTextStyle(
                    color: AppColors.black.withOpacity(0.8),
                    fontSize: h * 0.018,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
