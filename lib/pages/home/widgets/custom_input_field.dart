import 'package:e_learning_app/common/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.sizeText = 14.0,
  });
  final String label;
  final IconData prefixIcon;
  final double sizeText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.w),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.w),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.w),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
        ),
        hintText: label,
        hintStyle: popinsFont.copyWith(
          color: kblack.withOpacity(0.5),
          fontWeight: FontWeight.w500,
          fontSize: sizeText,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: kblack.withOpacity(0.5),
        ),
      ),
      obscureText: false,
    );
  }
}
