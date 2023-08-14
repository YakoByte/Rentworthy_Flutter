import 'package:flutter/material.dart';
import 'package:rentworthy/utils/common_components/common_text.dart';

import '../color.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  bool? leadingicon;
  bool? centerTitle;
  Color backgroundColor;
  Widget? leadicon;
  Widget? suffixicon;
  String? appbarWidth;

  CommonAppBar(
      {Key? key,
      this.title,
      this.appbarWidth,
      this.leadicon,
      this.suffixicon,
      this.centerTitle,
      this.leadingicon,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        toolbarHeight: height * 0.06,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            width: leadingicon != true ? width : width * 0.85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                title != null
                    ? Expanded(
                        child: Text(
                          title!,
                          style: ptSansTextStyle(
                              color: AppColors.black,
                              fontSize: height * 0.025,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    : SizedBox(),
                if (suffixicon != null) suffixicon!,
              ],
            ),
          ),
        ],
        leading: leadingicon != true
            ? leadicon
            : GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.black,
                      size: height * 0.03,
                    ),
                  ),
                ),
              ),
        centerTitle: centerTitle,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
