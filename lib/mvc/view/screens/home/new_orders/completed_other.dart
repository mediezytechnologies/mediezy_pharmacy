import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:developer';

import '../../../../controller/controller/completed/completed_controller.dart';
import '../../../common_widgets/builder_card_widget.dart';
class CompletedOrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CompletedController completedController = Get.find<CompletedController>();
    
    return Obx(() {
      if (completedController.loading.value) {
        return Center(child: CircularProgressIndicator());
      }
      if (completedController.medicineOrder!.isEmpty) {
        return Center(
          child: Image(
            height: 200.h,
            width: 200.w,
            image: const AssetImage("assets/images/no orders.png"),
          ),
        );
      }
      return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: completedController.medicineOrder!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Navigate to order details
            },
            child: BuilderCardWidget(
              patientImage: completedController.medicineOrder![index].userImage,
              name: completedController.medicineOrder![index].patientName.toString(),
              date: completedController.medicineOrder![index].date.toString(),
              drName: completedController.medicineOrder![index].doctorName.toString(),
            ),
          );
        },
      );
    });
  }
}