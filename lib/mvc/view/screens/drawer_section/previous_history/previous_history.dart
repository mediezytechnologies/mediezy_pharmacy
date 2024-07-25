import 'dart:developer';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_medical/mvc/controller/controller/previous_history_controller/previous_history_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/home/widgets/order_list_widget.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';

class PreviousHistoryScreen extends StatefulWidget {
  const PreviousHistoryScreen({super.key});

  @override
  State<PreviousHistoryScreen> createState() => _PreviousHistoryScreenState();
}

class _PreviousHistoryScreenState extends State<PreviousHistoryScreen> {
  final PreviousHistoryController previousHistoryController =
      Get.put(PreviousHistoryController());

  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now().subtract(Duration(days: 1));
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    log("Initial date: $formattedDate");
    previousHistoryController.getPreviousHistory(date: formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EasyDateTimeLine(
              initialDate: selectedDate,
              disabledDates: _getDisabledDates(),
              onDateChange: (date) {
                String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                log(formattedDate);
                selectedDate = date;
                previousHistoryController.getPreviousHistory(
                    date: formattedDate);
              },
              activeColor: kMainColor,
              headerProps: EasyHeaderProps(
                selectedDateStyle: width > 450 ? blackTabMainText : black14B600,
                monthStyle: width > 450 ? blackTabMainText : black14B600,
                // ignore: deprecated_member_use
                selectedDateFormat: SelectedDateFormat.monthOnly,
              ),
              dayProps: EasyDayProps(
                height: width > 450 ? 70.h : 50.h,
                width: width > 450 ? 40.w : 50.w,
                dayStructure: DayStructure.dayNumDayStr,
                inactiveDayStyle: DayStyle(
                  dayStrStyle: TextStyle(
                      fontSize: width > 450 ? 9.sp : 11.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  borderRadius: 10,
                  dayNumStyle: TextStyle(
                      fontSize: width > 450 ? 12.sp : 17.sp, color: kTextColor),
                ),
                activeDayStyle: DayStyle(
                  borderRadius: 10,
                  dayNumStyle: TextStyle(
                      fontSize: width > 450 ? 13.sp : 17.sp,
                      fontWeight: FontWeight.bold,
                      color: kCardColor),
                ),
                // ignore: deprecated_member_use
                activeDayStrStyle: TextStyle(
                    fontSize: width > 450 ? 9.sp : 11.sp,
                    fontWeight: FontWeight.w400,
                    color: kCardColor),
              ),
            ),
            Obx(() {
              if (previousHistoryController.medicineOrder!.isEmpty) {
                return Column(
                  children: [
                    VerticalSpacingWidget(height: 130),
                    Center(
                      child: Image(
                        height: 200.h,
                        width: 200.w,
                        image: const AssetImage("assets/images/no orders.png"),
                      ),
                    ),
                  ],
                );
              }
              return OrderListWidget(
                type: 1,
                checkBoxVisibleId: 1,
                medicineOrder: previousHistoryController.medicineOrder!,
              );
            }),
          ],
        ),
      ),
    );
  }

  List<DateTime> _getDisabledDates() {
    DateTime currentDate = DateTime.now();
    List<DateTime> disabledDates = [];

    disabledDates.add(currentDate);

    for (int i = 1; i <= 365; i++) {
      disabledDates.add(currentDate.add(Duration(days: i)));
    }

    DateTime endOfYear = DateTime(currentDate.year, 12, 31);
    if (endOfYear.difference(currentDate).inDays > 365) {
      DateTime futureDate = currentDate.add(Duration(days: 366));
      while (futureDate.year > currentDate.year) {
        disabledDates.add(futureDate);
        futureDate = futureDate.add(Duration(days: 1));
      }
    }

    return disabledDates;
  }
}
