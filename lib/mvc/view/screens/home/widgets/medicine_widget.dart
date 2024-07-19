import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';
import 'package:mediezy_medical/mvc/controller/controller/new_order_controller/new_order_controller.dart';
import 'package:mediezy_medical/mvc/controller/controller/checkbox_controller/checkbox_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/short_names_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';

// ignore: must_be_immutable
class GetMedicinesWidget extends StatefulWidget {
  final int checkBoxId;

  final List<Medicines> medicines;
  List<PrescriptionImages>? prescriptionImages;

  GetMedicinesWidget(
      {super.key,
      required this.checkBoxId,
      required this.medicines,
      this.prescriptionImages});

  @override
  _GetMedicinesWidgetState createState() => _GetMedicinesWidgetState();
}

class _GetMedicinesWidgetState extends State<GetMedicinesWidget> {
  final MedicineController controller = Get.put(MedicineController());
  final CheckboxController checkboxController = Get.put(CheckboxController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.medicines.length,
      itemBuilder: (context, index) {
        final medicine = widget.medicines[index];
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
                  Container(
                    // height: 100.h,
                    width: 260.w,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShortNamesWidget(
                          typeId: 1,
                          firstText: "Medicine : ",
                          secondText: medicine.medicineName!,
                        ),
                        medicine.dosage == null
                            ? Container()
                            : ShortNamesWidget(
                                firstText: "Dosage : ",
                                secondText: medicine.dosage.toString(),
                              ),
                        medicine.interval == null || medicine.interval == "null"
                            ? Container()
                            : ShortNamesWidget(
                                firstText: "Interval : ",
                                secondText:
                                    "${medicine.interval} ${medicine.timeSection}",
                              ),
                        Container(
                          width: widget.checkBoxId == 1
                              ? size.width * .9
                              : size.width * .7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ShortNamesWidget(
                                    typeId: 1,
                                    firstText: "Days : ",
                                    secondText: medicine.noOfDays.toString(),
                                  ),
                                  ShortNamesWidget(
                                    typeId: 1,
                                    firstText: "",
                                    secondText: medicine.type == 1
                                        ? "After food"
                                        : medicine.type == 2
                                            ? "Before food"
                                            : medicine.type == 3
                                                ? "With food"
                                                : "If required",
                                  ),
                                ],
                              ),
                              // medicine.status == 0
                              //     ? Container()
                              //     : Container(
                              //         height: 25.h,
                              //         width: 50.w,
                              //         child: ClipRRect(
                              //           child: Image.asset(
                              //               "assets/images/delivered.png"),
                              //         ),
                              //       ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                if (medicine.morning == 1)
                                  Text(
                                    "Morning",
                                    style: size.width > 450
                                        ? blackTabMainText
                                        : blackMainText,
                                  ),
                                if (medicine.morning == 1 &&
                                    (medicine.noon == 1 ||
                                        medicine.evening == 1 ||
                                        medicine.night == 1))
                                  Text(
                                    ",",
                                    style: size.width > 450
                                        ? blackTabMainText
                                        : blackMainText,
                                  ),
                                if (medicine.noon == 1)
                                  Text(
                                    "Noon",
                                    style: size.width > 450
                                        ? blackTabMainText
                                        : blackMainText,
                                  ),
                                if (medicine.noon == 1 &&
                                    (medicine.evening == 1 ||
                                        medicine.night == 1))
                                  Text(
                                    ",",
                                    style: size.width > 450
                                        ? blackTabMainText
                                        : blackMainText,
                                  ),
                                if (medicine.evening == 1)
                                  Text(
                                    "Evening",
                                    style: size.width > 450
                                        ? blackTabMainText
                                        : blackMainText,
                                  ),
                                if (medicine.evening == 1 &&
                                    medicine.night == 1)
                                  Text(
                                    ",",
                                    style: size.width > 450
                                        ? blackTabMainText
                                        : blackMainText,
                                  ),
                                if (medicine.night == 1)
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
                  ),
                  // Container(

                  //   child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       ShortNamesWidget(
                  //         typeId: 1,
                  //         firstText: "Medicine : ",
                  //         secondText: medicine.medicineName!,
                  //       ),
                  //       medicine.dosage == null
                  //           ? Container()
                  //           : ShortNamesWidget(
                  //               firstText: "Dosage : ",
                  //               secondText: medicine.dosage.toString(),
                  //             ),
                  //       medicine.interval == null || medicine.interval == "null"
                  //           ? Container()
                  //           : ShortNamesWidget(
                  //               firstText: "Interval : ",
                  //               secondText:
                  //                   "${medicine.interval} ${medicine.timeSection}",
                  //             ),
                  //       Container(
                  //         width: widget.checkBoxId == 1
                  //             ? size.width * .9
                  //             : size.width * .7,
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 ShortNamesWidget(
                  //                   typeId: 1,
                  //                   firstText: "Days : ",
                  //                   secondText: medicine.noOfDays.toString(),
                  //                 ),
                  //                 ShortNamesWidget(
                  //                   typeId: 1,
                  //                   firstText: "",
                  //                   secondText: medicine.type == 1
                  //                       ? "After food"
                  //                       : medicine.type == 2
                  //                           ? "Before food"
                  //                           : medicine.type == 3
                  //                               ? "With food"
                  //                               : "If required",
                  //                 ),
                  //               ],
                  //             ),
                  //             // medicine.status == 0
                  //             //     ? Container()
                  //             //     : Container(
                  //             //         height: 25.h,
                  //             //         width: 50.w,
                  //             //         child: ClipRRect(
                  //             //           child: Image.asset(
                  //             //               "assets/images/delivered.png"),
                  //             //         ),
                  //             //       ),
                  //           ],
                  //         ),
                  //       ),
                  //       Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Row(
                  //             children: [
                  //               if (medicine.morning == 1)
                  //                 Text(
                  //                   "Morning",
                  //                   style: size.width > 450
                  //                       ? blackTabMainText
                  //                       : blackMainText,
                  //                 ),
                  //               if (medicine.morning == 1 &&
                  //                   (medicine.noon == 1 ||
                  //                       medicine.evening == 1 ||
                  //                       medicine.night == 1))
                  //                 Text(
                  //                   ",",
                  //                   style: size.width > 450
                  //                       ? blackTabMainText
                  //                       : blackMainText,
                  //                 ),
                  //               if (medicine.noon == 1)
                  //                 Text(
                  //                   "Noon",
                  //                   style: size.width > 450
                  //                       ? blackTabMainText
                  //                       : blackMainText,
                  //                 ),
                  //               if (medicine.noon == 1 &&
                  //                   (medicine.evening == 1 ||
                  //                       medicine.night == 1))
                  //                 Text(
                  //                   ",",
                  //                   style: size.width > 450
                  //                       ? blackTabMainText
                  //                       : blackMainText,
                  //                 ),
                  //               if (medicine.evening == 1)
                  //                 Text(
                  //                   "Evening",
                  //                   style: size.width > 450
                  //                       ? blackTabMainText
                  //                       : blackMainText,
                  //                 ),
                  //               if (medicine.evening == 1 && medicine.night == 1)
                  //                 Text(
                  //                   ",",
                  //                   style: size.width > 450
                  //                       ? blackTabMainText
                  //                       : blackMainText,
                  //                 ),
                  //               if (medicine.night == 1)
                  //                 Text(
                  //                   "Night",
                  //                   style: size.width > 450
                  //                       ? blackTabMainText
                  //                       : blackMainText,
                  //                 ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(height: 100,width: 190,color: Colors.amber,),

                  // widget.checkBoxId == 1
                  //     ? (medicine.status == 0
                  //         ? Container()
                  //         : Container(
                  //             height: 25.h,
                  //             width: 50.w,
                  //             child: ClipRRect(
                  //               child:
                  //                   Image.asset("assets/images/delivered.png"),
                  //             ),
                  //           ))
                  //     : Obx(() {
                  //         final isChecked = checkboxController.checkedMedicines
                  //             .contains(medicine.id);
                  //         return Checkbox(
                  //           activeColor: kMainColor,
                  //           value: isChecked,
                  //           onChanged: (newValue) {
                  //             checkboxController.toggleItem(
                  //               medicine.id!,
                  //               widget.medicines.length,
                  //               widget.prescriptionImages!.length,
                  //               true,
                  //             );
                  //           },
                  //         );
                  //       })

                  widget.checkBoxId==1?
                  Obx(() {
      final isChecked = checkboxController.checkedMedicines.contains(medicine.id);
      return checkboxController.isEditing.value
          ? Checkbox(
              activeColor: kMainColor,
              value: isChecked,
              onChanged: (newValue) {
                checkboxController.toggleItem(
                  medicine.id!,
                  widget.medicines.length,
                  widget.prescriptionImages!.length,
                  true,
                );
              },
            )
          : (medicine.status == 0
              ? Container()
              : Container(
                  height: 25.h,
                  width: 50.w,
                  child: ClipRRect(
                    child: Image.asset("assets/images/delivered.png"),
                  ),
                ));
    }):

                  // widget.checkBoxId == 1
                  //     ? Container()
                  //     : 
                  Obx(() {
                          final isChecked = checkboxController.checkedMedicines
                              .contains(medicine.id);
                          return Checkbox(
                            activeColor: kMainColor,
                            value: isChecked,
                            onChanged: (newValue) {
                              checkboxController.toggleItem(
                                medicine.id!,
                                widget.medicines.length,
                                widget.prescriptionImages!.length,
                                true,
                              );
                            },
                          );
                        })

                  // widget.checkBoxId == 1
                  //     ? Container()
                  //     : Obx(() {
                  //         return Checkbox(
                  //           activeColor: kMainColor,
                  //           value: checkboxController.checkedMedicines
                  //               .contains(medicine.id),
                  //           onChanged: (newValue) {
                  //             checkboxController.toggleItem(
                  //                 medicine.id!, widget.medicines.length);
                  //           },
                  //         );
                  //       }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
