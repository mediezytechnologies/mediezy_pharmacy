import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';

ThemeData appThemeStyle(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return ThemeData(
    scaffoldBackgroundColor: kScaffoldColor,
    //* appbar
    appBarTheme: AppBarTheme(
      backgroundColor: kScaffoldColor,
      iconTheme: IconThemeData(
          color: kMainColor, size: size.width > 450 ? 18.sp : 22.sp),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: size.width > 450 ? 13.sp : 20.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black),
    ),
  );
}
