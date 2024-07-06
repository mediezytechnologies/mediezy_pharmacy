import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';
import 'package:mediezy_medical/mvc/controller/controller/new_order_controller/new_order_controller.dart';
import 'package:mediezy_medical/mvc/controller/controller/order_details_controller.dart/order_details_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/short_names_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';

class GetMedicinesWidget extends StatefulWidget {
  final String medicineName;
  final String? dosage;
  final String timeSection;
  final String? interval;
  final String noOfDays;
  final int? type;
  final int? morning;
  final int? evening;
  final int? noon;
  final int? night;
  final int? index;
  final int? id;
  final int? length;
  final int? medicineType;
  final int checkBoxId;

  GetMedicinesWidget(
      {super.key,
      required this.medicineName,
      this.interval,
      required this.noOfDays,
      this.type,
      this.morning,
      this.evening,
      this.noon,
      this.night,
      required this.timeSection,
      this.dosage,
      this.index,
      this.id,
      this.length,
      this.medicineType,
      required this.checkBoxId});

  @override
  _GetMedicinesWidgetState createState() => _GetMedicinesWidgetState();
}

class _GetMedicinesWidgetState extends State<GetMedicinesWidget> {
  final MedicineController controller = Get.put(MedicineController());
  final CheckboxController checkboxController = Get.put(CheckboxController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ShortNamesWidget(
                    typeId: 1,
                    firstText: "Medicine : ",
                    secondText: widget.medicineName,
                  ),
                  widget.dosage == null
                      ? Container()
                      : ShortNamesWidget(
                          firstText: "Dosage : ",
                          secondText: widget.dosage.toString(),
                        ),
                  widget.interval == null || widget.interval == "null"
                      ? Container()
                      : ShortNamesWidget(
                          firstText: "Interval : ",
                          secondText:
                              "${widget.interval} ${widget.timeSection}",
                        ),
                  ShortNamesWidget(
                    typeId: 1,
                    firstText: "Days : ",
                    secondText: widget.noOfDays,
                  ),
                  ShortNamesWidget(
                    typeId: 1,
                    firstText: "",
                    secondText: widget.type == 1
                        ? "After food"
                        : widget.type == 2
                            ? "Before food"
                            : widget.type == 3
                                ? "With food"
                                : "If required",
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (widget.morning == 1)
                            Text(
                              "Morning",
                              style: size.width > 450
                                  ? blackTabMainText
                                  : blackMainText,
                            ),
                          if (widget.morning == 1 &&
                              (widget.noon == 1 ||
                                  widget.evening == 1 ||
                                  widget.night == 1))
                            Text(
                              ",",
                              style: size.width > 450
                                  ? blackTabMainText
                                  : blackMainText,
                            ),
                          if (widget.noon == 1)
                            Text(
                              "Noon",
                              style: size.width > 450
                                  ? blackTabMainText
                                  : blackMainText,
                            ),
                          if (widget.noon == 1 &&
                              (widget.evening == 1 || widget.night == 1))
                            Text(
                              ",",
                              style: size.width > 450
                                  ? blackTabMainText
                                  : blackMainText,
                            ),
                          if (widget.evening == 1)
                            Text(
                              "Evening",
                              style: size.width > 450
                                  ? blackTabMainText
                                  : blackMainText,
                            ),
                          if (widget.evening == 1 && widget.night == 1)
                            Text(
                              ",",
                              style: size.width > 450
                                  ? blackTabMainText
                                  : blackMainText,
                            ),
                          if (widget.night == 1)
                            Text(
                              "Night",
                              style: size.width > 450
                                  ? blackTabMainText
                                  : blackMainText,
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              widget.checkBoxId == 1
                  ? Container()
                  : Obx(() {
                      return Checkbox(
                        activeColor: kMainColor,
                        value: checkboxController.checkedMedicines
                            .contains(widget.id),
                        onChanged: (newValue) {
                          checkboxController.toggleItem(
                              widget.id!, widget.length!);
                        },
                      );
                    }),
            ],
          ),
        ),
      ),
    );
  }
}
