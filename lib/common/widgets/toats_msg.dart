import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String message,
  Color backgroundColor = const Color(0xffFF2566),
  Color textColor = const Color(0XFFFFFFFF),
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.sp,
  );
}

toastInfoMsg({
  required String message,
  BuildContext? context,
  Color backgroundColor = const Color(0xffFF2566),
  Color textColor = const Color(0XFFFFFFFF),
}) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 2),
    messageColor: textColor,
  ).show(context!);
}
