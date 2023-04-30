import 'package:e_learning_app/common/values/constant.dart';
import 'package:flutter/material.dart';

AppBar appbarCustom() {
  return AppBar(
    elevation: 0,
    backgroundColor: kWhite,
    iconTheme: IconThemeData(color: kblack),
    centerTitle: true,
    title: Text(
      "Settings",
      style: blackTextStyle.copyWith(
        fontWeight: bold,
      ),
    ),
  );
}
