import 'package:e_learning_app/common/values/colors.dart';
import 'package:e_learning_app/common/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppbar(String type) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColors.primaryText),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: kgrey.withOpacity(0.25),
        height: 1.0,
      ),
    ),
    title: Text(
      type,
      style: popinsFont.copyWith(
          color: kblack, fontSize: 16.sp, fontWeight: FontWeight.normal),
    ),
  );
}

//contex digunkan untuk mengakses Bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 30.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _reusableIcon("google", 40.w),
        SizedBox(width: 20.w),
        _reusableIcon("apple", 40.w),
        SizedBox(width: 20.w),
        _reusableIcon("facebook", 32.w),
      ],
    ),
  );
}

Widget _reusableIcon(String iconName, double radius) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/icons/$iconName.png"),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget reusableText(
    String title, Color color, FontWeight fontWeight, double size) {
  return SizedBox(
    child: Text(
      title,
      style: popinsFont.copyWith(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    ),
  );
}

//String hintText, String textType, String iconName
Widget buildTextField(
  String hintText,
  String textType,
  String iconName,
  void Function(String value)? func,
) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: kWhite,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: kgrey),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintStyle: TextStyle(
                color: kgrey,
              ),
            ),
            style: popinsFont.copyWith(
              color: kblack,
              fontSize: 14.sp,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot password ?",
        style: popinsFont.copyWith(
          color: kblack.withOpacity(0.7),
          fontSize: 14.sp,
          decoration: TextDecoration.underline,
          decorationColor: kblack.withOpacity(0.7),
        ),
      ),
    ),
  );
}

Widget buildCustomButton(
  String buttonName,
  String buttonType,
  void Function()? func,
) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        top: buttonType == "login" ? 25.h : 20.h,
      ),
      decoration: BoxDecoration(
        color: buttonType == "login" ? kBlue : kWhite,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          color: buttonType == "login" ? Colors.transparent : kgrey,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: popinsFont.copyWith(
            color: buttonType == "login" ? kWhite : kblack,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
