import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';

class GeneralServices {
  static GeneralServices instance = GeneralServices();

  //* to close the app
  appCloseDialogue(
      BuildContext context, String title, void Function()? yesFunction) {
    final width = MediaQuery.of(context).size.width;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          content: Text(title,
              style: width > 450 ? blackTabMainText : blackMainText),
          actions: [
            TextButton(
              child: Text("No",
                  style: width > 450 ? blackTabMainText : blackMainText),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              onPressed: yesFunction,
              child: Text(
                "Yes",
                style: width > 450
                    ? TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.red)
                    : TextStyle(
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
