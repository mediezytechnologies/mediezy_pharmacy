// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_medical/ddd/core/app_colors.dart';

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
      this.onPressed});

  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final FormFieldValidator validator;
  bool hideText;
  bool obscureText;
  final IconData icon;
  int? maxLine;
  int? maxLength;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return TextFormField(
      style: TextStyle(fontSize: 13.sp),
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
          size: 22.sp,
        ),
        suffixIcon: hideText
            ? IconButton(
                onPressed: onPressed,
                icon: obscureText
                    ? Icon(
                        IconlyLight.hide,
                        color: kMainColor,
                      )
                    : Icon(
                        IconlyLight.show,
                        color: kMainColor,
                      ),
              )
            : const SizedBox(),
        hintStyle: TextStyle(fontSize: 13.sp, color: kSubTextColor),
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
