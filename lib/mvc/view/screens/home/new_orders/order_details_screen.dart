import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';
import 'package:mediezy_medical/mvc/controller/controller/new_order_submit/new_order_submit_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/common_button_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/horizontal_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/view_image_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/home/widgets/medicine_widget.dart';
import '../../../../controller/controller/order_detai_controller.dart/order_detail_controller.dart';
import '../../../../model/new_order/new_order_model.dart';

// ignore: must_be_immutable
class OrderDetailsScreen extends StatefulWidget {
  OrderDetailsScreen({
    super.key,
    this.name,
    this.date,
    this.itemCount,
    required this.medicines,
    required this.drName,
    required this.patientImage,
    this.tokenId,
    this.drId,
    this.patientId,
    this.type,
    required this.checkBoxVisibleId,
    this.prescriptionImage,
  });
  final String? name;
  final String? date;
  final int? itemCount;
  final int? type;
  final String? patientId;
  final String drName;
  final String? tokenId;
  final String? drId;
  final String? patientImage;
  final String? prescriptionImage;
  List<Medicines>? medicines;
  final int checkBoxVisibleId;
  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  List<bool> checked = List.generate(10, (index) => false);
  bool selectAll = false;
  //final MedicineController controller = Get.put(MedicineController());
  final CheckboxController checkboxController = Get.put(CheckboxController());
  final NewOrderSubmitController newOrderSubmitController =
      Get.put(NewOrderSubmitController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order details"),
        centerTitle: true,
      ),
      bottomNavigationBar: widget.type == 1
          ? null
          : Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
              child: CommonButtonWidget(
                  title: "Submit",
                  onTapFunction: () {
                    newOrderSubmitController.addNewOrderSubmit(
                        context: context,
                        patientId: widget.patientId!,
                        tokenId: widget.tokenId!,
                        doctorId: widget.drId!,
                        orderStatus: "1",
                        medicineList: checkboxController.checkedIds,
                        prescriptionImage: widget.prescriptionImage.toString());
                  })),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  child: Row(
                    children: [
                      widget.patientImage == null
                          ? Image.asset(
                              "assets/images/no image.jpg",
                              height: 50.h,
                              width: 60.w,
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              widget.patientImage!,
                              height: 50.h,
                              width: 60.w,
                              fit: BoxFit.fill,
                            ),
                      const HorizontalSpacingWidget(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.name!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.sp),
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy')
                                .format(DateTime.parse(widget.date!)),
                          ),
                          Row(
                            children: [
                              const Text(
                                "Prescribed by : ",
                              ),
                              Text(
                                widget.drName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.type == 1 || widget.medicines!.isEmpty
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text('Select All'),
                              Obx(() {
                                return Checkbox(
                                  activeColor: kMainColor,
                                  value: checkboxController.allChecked.value,
                                  onChanged: (newValue) {
                                    checkboxController
                                        .toggleAllItems(widget.medicines!);
                                  },
                                );
                              }),
                            ],
                          ),
                    const VerticalSpacingWidget(height: 6),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.itemCount,
                      itemBuilder: (context, index) {
                        return GetMedicinesWidget(
                          type: widget.medicines![index].type,
                          noon: widget.medicines![index].noon,
                          night: widget.medicines![index].night,
                          morning: widget.medicines![index].morning,
                          interval:
                              widget.medicines![index].interval.toString(),
                          evening: widget.medicines![index].evening,
                          dosage: widget.medicines![index].dosage.toString(),
                          medicineName:
                              widget.medicines![index].medicineName.toString(),
                          noOfDays:
                              widget.medicines![index].noOfDays.toString(),
                          timeSection:
                              widget.medicines![index].timeSection.toString(),
                          index: index,
                          id: widget.medicines![index].id,
                          length: widget.medicines!.length,
                          checkBoxId: widget.checkBoxVisibleId,
                        );
                      },
                    ),
                  ],
                ),
              ),
              widget.prescriptionImage == null
                  ? Container()
                  : Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/rx logo.png",
                                  height: 25.h,
                                  width: 25.w,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "Prescription uploaded",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.to(ViewImageWidget(
                                      viewFile:
                                          widget.prescriptionImage.toString()));
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.blue,
                                ))
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
