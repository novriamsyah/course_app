import 'package:e_learning_app/common/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonProfile extends StatelessWidget {
  const CustomButtonProfile({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.w,
      height: 46.h,
      decoration: BoxDecoration(
        color: kpurple,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: 18.w,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 10.sp,
              fontWeight: extraBold,
            ),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
