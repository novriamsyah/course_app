import 'package:e_learning_app/common/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    Key? key,
    required this.title,
    this.secondTitle,
    this.sizeTitle = 16.0,
    this.sizeSecondTitle = 14.0,
    this.titleColor = Colors.black,
    this.secondTitleColor = Colors.grey,
    this.fontWeightTitle = FontWeight.bold,
    this.fontWeightSecondTitle = FontWeight.normal,
    this.marginBottom = 0.0,
    this.marginTop = 0.0,
  }) : super(key: key);

  final String title;
  final String? secondTitle;
  final double sizeTitle;
  final double sizeSecondTitle;
  final Color titleColor;
  final Color secondTitleColor;
  final FontWeight fontWeightTitle;
  final FontWeight fontWeightSecondTitle;
  final double marginBottom;
  final double marginTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: popinsFont.copyWith(
              color: titleColor,
              fontSize: sizeTitle,
              fontWeight: fontWeightTitle,
            ),
          ),
          Text(
            secondTitle ?? "",
            style: popinsFont.copyWith(
              color: secondTitleColor,
              fontSize: sizeSecondTitle,
              fontWeight: fontWeightSecondTitle,
            ),
          ),
        ],
      ),
    );
  }
}
