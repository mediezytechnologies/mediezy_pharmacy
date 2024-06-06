import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_medical/ddd/core/app_colors.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/horizontal_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';

class BuilderCardWidget extends StatelessWidget {
  const BuilderCardWidget(
      {super.key,
      required this.name,
      required this.date,
      required this.drName,
      this.patientImage});
  final String name;
  final String date;
  final String drName;
  final String? patientImage;

// final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 8.0.h, bottom: 18.0.h, left: 8.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FadedScaleAnimation(
                        scaleDuration: const Duration(milliseconds: 400),
                        fadeDuration: const Duration(milliseconds: 400),
                        child: patientImage == null
                            ? Image.asset(
                                "assets/images/no image.jpg",
                                height: 50.h,
                                width: 60.w,
                                fit: BoxFit.fill,
                              )
                            : Image.network(
                                patientImage!,
                                height: 50.h,
                                width: 60.w,
                                fit: BoxFit.fill,
                              ),
                      ),
                      HorizontalSpacingWidget(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const VerticalSpacingWidget(height: 5),
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const VerticalSpacingWidget(height: 5),
                          Text(
                            DateFormat('dd-MM-yyyy')
                                .format(DateTime.parse(date)),
                            style: TextStyle(
                                fontSize: 12.sp, color: kSubTextColor),
                          ),
                          Row(
                            children: [
                              const Text(
                                "Prescribed by : ",
                              ),
                              Text(
                                drName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
