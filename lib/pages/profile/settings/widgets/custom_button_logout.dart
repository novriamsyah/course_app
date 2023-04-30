import 'package:e_learning_app/common/routes/names.dart';
import 'package:e_learning_app/common/values/constant.dart';
import 'package:e_learning_app/common/values/contant_value.dart';
import 'package:e_learning_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonLogout extends StatelessWidget {
  const CustomButtonLogout({
    Key? key,
    required this.context,
    this.onPressed,
  }) : super(key: key);

  final BuildContext context;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Confirm logout !!",
                  style: blackTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: bold,
                  ),
                ),
                content: Text(
                  "Do you still logout from application ?",
                  style: blackTextStyle.copyWith(
                    fontSize: 14.0,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("cancel"),
                  ),
                  TextButton(
                    onPressed: onPressed,
                    child: const Text("confirm"),
                  )
                ],
              );
            });
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 56.0,
        child: Center(
          child: Image.asset(
            "assets/icons/Logout.png",
            width: 200.w,
            height: 100.h,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
