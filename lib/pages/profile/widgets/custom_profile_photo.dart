import 'package:e_learning_app/common/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfilePhoto extends StatelessWidget {
  const CustomProfilePhoto({
    Key? key,
    this.urlImage =
        "https://assets.stickpng.com/images/585e4bcdcb11b227491c3396.png",
    required this.userName,
  }) : super(key: key);

  final String urlImage;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 85.w,
                height: 85.h,
                decoration: BoxDecoration(
                  color: kgrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15.w),
                  boxShadow: [
                    BoxShadow(
                      color: kgrey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 3,
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(urlImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 25.w,
                    height: 25.h,
                    child: Image.asset("assets/icons/edit_3.png"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            userName,
            style: blackTextStyle.copyWith(
              fontWeight: extraBold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
