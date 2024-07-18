import 'dart:developer';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_medical/mvc/controller/controller/previous_history_controller/previous_history_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/home/widgets/order_list_widget.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';

class PreviousHistoryScreen extends StatefulWidget {
  const PreviousHistoryScreen({super.key});

  @override
  State<PreviousHistoryScreen> createState() => _PreviousHistoryScreenState();
}

class _PreviousHistoryScreenState extends State<PreviousHistoryScreen> {
  DateTime selectedDate = DateTime.now();
  final PreviousHistoryController previousHistoryController =
      Get.put(PreviousHistoryController());

  @override
  void initState() {
    String formattedDate = DateFormat('yyy-MM-dd').format(selectedDate);
    log("aaaaaaaaaaaaaaaa $formattedDate");

    previousHistoryController.getPreviousHistory(date: formattedDate);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                // setState(() {
                selectedDate = date;
                // });
                previousHistoryController.getPreviousHistory(
                    date: formattedDate);
              },
              activeColor: kMainColor,
              headerProps: const EasyHeaderProps(
                // ignore: deprecated_member_use
                selectedDateFormat: SelectedDateFormat.monthOnly,
              ),
              dayProps: EasyDayProps(
                height: 50.h,
                width: 50.w,
                dayStructure: DayStructure.dayNumDayStr,
                inactiveDayStyle: DayStyle(
                  borderRadius: 10,
                  dayNumStyle: TextStyle(fontSize: 18.0, color: kTextColor),
                ),
                activeDayStyle: DayStyle(
                  borderRadius: 10,
                  dayNumStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: kCardColor),
                ),
                // ignore: deprecated_member_use
                activeDayStrStyle: TextStyle(
                    fontSize: 12.0,
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

    // Add all future dates after today
    for (int day = currentDate.day + 1; day <= 31; day++) {
      disabledDates.add(DateTime(currentDate.year, currentDate.month, day));
    }

    // Iterate through the remaining months and add all dates in those months
    for (int month = currentDate.month + 1; month <= 12; month++) {
      for (int day = 1; day <= 31; day++) {
        disabledDates.add(DateTime(currentDate.year, month, day));
      }
    }

    return disabledDates;
  }
}
