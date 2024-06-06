import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_medical/presentation/core/app_colors.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget(
      {super.key,
      required this.onTap,
      required this.loading,
      required this.buttonText});

  final VoidCallback onTap;
  final bool loading;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: kMainColor,
          foregroundColor: kTextColor,
          elevation: 0,
          minimumSize: Size(double.infinity, height * .07),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      onPressed: onTap,
      child: loading
          ? CircularProgressIndicator(
              color: kScaffoldColor,
            )
          : Text(
              buttonText,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: kScaffoldColor),
            ),
    );
  }
}
