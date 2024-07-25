// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';

class CustomeFormFieldWidget extends StatelessWidget {
  CustomeFormFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.textInputType,
      required this.textInputAction,
      required this.validator,
      required this.icon,
      this.obscureText = false,
      this.hideText = false,
      this.maxLine = 1,
      this.maxLength,
      this.onPressed,
      this.suffixIcon});

  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final FormFieldValidator validator;
  bool hideText;
  bool obscureText;
  final IconData icon;
  final Widget? suffixIcon;
  int? maxLine;
  int? maxLength;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return TextFormField(
      style: TextStyle(fontSize: width > 450 ? 11.sp : 13.sp),
      maxLines: maxLine,
      maxLength: maxLength,
      cursorColor: kMainColor,
      controller: controller,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        counterText: "",
        prefixIcon: Icon(
          icon,
          color: kMainColor,
          size: width > 450 ? 15.sp : 22.sp,
        ),
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
            fontSize: width > 450 ? 10.sp : 13.sp, color: kSubTextColor),
        hintText: hintText,
        filled: true,
        fillColor: kCardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: width * .010, vertical: height * .025),
      ),
    );
  }
}
