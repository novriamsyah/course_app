import 'package:e_learning_app/common/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridContent extends StatelessWidget {
  const CustomGridContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: kgrey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15.w),
        image: const DecorationImage(
          image: AssetImage("assets/icons/Image_2.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Best Course For IT",
            style: popinsFont.copyWith(
              color: kWhite,
              fontWeight: bold,
              fontSize: 12.sp,
            ),
          ),
          Text(
            "40 Lesson",
            style: popinsFont.copyWith(
              color: klightGrey,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
