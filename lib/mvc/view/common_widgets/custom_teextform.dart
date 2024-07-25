// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';

// ignore: must_be_immutable
class CustomFomField extends StatelessWidget {
  CustomFomField(
      {super.key,
      required this.titles,
      required this.textinputType,
      required this.validator,
      required this.controller,
      this.focusNode,
      required this.prefixIcon,
      required this.readOnly,
      this.maxLength});
  final int? maxLength;
  String titles;
  final TextInputType textinputType;

  final FormFieldValidator validator;
  final TextEditingController controller;

  final FocusNode? focusNode;
  final IconData prefixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TextFormField(
      style: TextStyle(fontSize: width > 450 ? 11.sp : 13.sp),
      readOnly: readOnly,
      maxLength: maxLength,
      cursorColor: kMainColor,
      keyboardType: textinputType,
      controller: controller,
      textInputAction: TextInputAction.next,
      validator: validator,
      focusNode: focusNode,
      decoration: InputDecoration(
        counterText: '',
        prefixIcon: Icon(
          prefixIcon,
          color: kMainColor,
          size: width > 450 ? 15.sp : 22.sp,
        ),
        hintStyle: TextStyle(
            fontSize: width > 450 ? 12.sp : 13.sp, color: kSubTextColor),
        hintText: titles,
        filled: true,
        fillColor: kCardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide.none,
        ),
      ),
      // inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
    );
  }
}
