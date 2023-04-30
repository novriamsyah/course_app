import 'package:e_learning_app/common/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMenuButton extends StatelessWidget {
  const CustomMenuButton({
    Key? key,
    this.marginTop = 0.0,
    this.marginBottom = 0.0,
  }) : super(key: key);
  final double marginTop;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      width: double.infinity,
      child: Row(
        children: [
          const ContentCategory(
            title: "All",
          ),
          ContentCategory(
            title: "Popular",
            colorContainer: kWhite,
            colorText: kblack.withOpacity(0.7),
            borderColor: kgrey.withOpacity(0.3),
          ),
          ContentCategory(
            title: "Newest",
            colorContainer: kWhite,
            colorText: kblack.withOpacity(0.7),
            borderColor: kgrey.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}

class ContentCategory extends StatelessWidget {
  const ContentCategory(
      {Key? key,
      required this.title,
      this.colorText = const Color(0XFFFFFFFF),
      this.sizeText = 12.0,
      this.colorContainer = const Color(0xff5142E6),
      this.borderColor = const Color(0xff5142E6)})
      : super(key: key);

  final String title;
  final Color? colorText;
  final double? sizeText;
  final Color? colorContainer;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 18.w),
      padding: EdgeInsets.symmetric(
        vertical: 5.w,
        horizontal: 15.w,
      ),
      decoration: BoxDecoration(
        color: colorContainer,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        title,
        style: popinsFont.copyWith(color: colorText, fontSize: 12.sp),
      ),
    );
  }
}
