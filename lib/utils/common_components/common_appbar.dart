import 'package:flutter/material.dart';

import '../color.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  bool? leadingicon;
  bool? centerTitle;
  Color backgroundColor;
  Widget? leadicon;
  Widget? suffixicon;
  String? appbarWidth;
  EdgeInsetsGeometry padding;
  TextStyle? textstyle;

  CommonAppBar(
      {Key? key,
      this.title,
      this.appbarWidth,
      this.leadicon,
      this.suffixicon,
      this.centerTitle,
      this.textstyle,
      required this.padding,
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
        toolbarHeight: height * 0.08,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          SizedBox(
            width: width,
            child: Padding(
              padding: padding,
              child: Row(
                mainAxisAlignment: suffixicon == null
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceBetween,
                children: [
                  leadicon != null
                      ? leadicon!
                      : Padding(
                          padding: padding,
                          child: GestureDetector(
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
                        ),
                  title != null
                      ? Text(
                          title!,
                          style: textstyle,
                        )
                      : const SizedBox(),
                  if (suffixicon != null) suffixicon!,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
