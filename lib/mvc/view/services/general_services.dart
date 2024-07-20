import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';

class GeneralServices {
  static GeneralServices instance = GeneralServices();


  //* to close the app
  appCloseDialogue(
      BuildContext context, String title, void Function()? yesFunction) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          content: Text(
            title,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: kTextColor),
          ),
          actions: [
            TextButton(
              child: Text(
                "No",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kTextColor),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              onPressed: yesFunction,
              child: Text(
                "Yes",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.red),
              ),
            )
          ],
        );
      }),
    );
  }
}
