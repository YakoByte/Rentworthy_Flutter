import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  bool? leadingicon;
  bool? centerTitle;
  Color? backgroundColor;
  Widget? leadicon;
  String? appbarWidth;

  CommonAppBar(
      {Key? key,
      this.title,
      this.appbarWidth,
      this.leadicon,
      this.centerTitle,
      this.leadingicon,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor:
          backgroundColor == null ? AppColors.white : backgroundColor,
      elevation: 5,
      scrolledUnderElevation: 5,
      automaticallyImplyLeading: false,
      actions: <Widget>[
        Container(
          width: leadingicon != true ? width : width * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title != null
                  ? Expanded(
                      child: Text(title!,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: AppColors.colorPrimary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: width * 0.035))),
                    )
                  : SizedBox(),
              if (leadicon != null) leadicon!,
            ],
          ),
        ),
      ],
      leading: leadingicon != true
          ? null
          : GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.colorSecondary,
                    size: height * 0.03,
                  ),
                ),
              ),
            ),
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
