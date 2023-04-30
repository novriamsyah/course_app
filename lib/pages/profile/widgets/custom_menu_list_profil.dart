import 'package:e_learning_app/common/routes/routes.dart';
import 'package:e_learning_app/common/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMenuListProfile extends StatelessWidget {
  const CustomMenuListProfile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.context,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.SETTING_PAGE);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        width: MediaQuery.of(context).size.width,
        height: 53.h,
        decoration: BoxDecoration(
          color: klightGrey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: kgrey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              padding: EdgeInsets.all(7.w),
              decoration: BoxDecoration(
                color: kpurple,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.asset(
                "assets/icons/$imageUrl",
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
