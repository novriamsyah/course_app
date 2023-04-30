import 'package:e_learning_app/common/values/colors.dart';
import 'package:e_learning_app/common/values/constant.dart';

import 'package:e_learning_app/pages/home/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchSection extends StatelessWidget {
  const CustomSearchSection({
    super.key,
    this.marginTop = 0.0,
    this.marginBottom = 0.0,
  });

  final double marginTop;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.h,
      margin: EdgeInsets.only(
        top: marginTop,
        bottom: marginBottom,
      ),
      child: Row(
        children: [
          //textfield,
          Container(
            width: 280.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: const CustomInputField(
              label: "Search your course",
              prefixIcon: Icons.search,
              sizeText: 13.5,
            ),
          ),

          //icon button filter
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40.w,
              height: 40.w,
              margin: EdgeInsets.only(left: 6.w),
              decoration: BoxDecoration(
                color: kpurple,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/options.png",
                    width: 25.w,
                    height: 25.w,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
