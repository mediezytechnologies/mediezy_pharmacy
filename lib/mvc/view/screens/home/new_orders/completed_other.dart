import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/view/screens/home/new_orders/order_details_screen.dart';

import '../../../../controller/controller/completed/completed_controller.dart';
import '../../../common_widgets/builder_card_widget.dart';

class CompletedOrdersTab extends StatelessWidget {
  final TabController tabController;

  const CompletedOrdersTab({super.key, required this.tabController});
  @override
  Widget build(BuildContext context) {
    final CompletedController completedController =
        Get.find<CompletedController>();

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => OrderDetailsScreen(
                    name: completedController.medicineOrder![index].patientName
                        .toString(),
                    date: completedController.medicineOrder![index].date
                        .toString(),
                    itemCount: completedController
                        .medicineOrder![index].medicines!.length,
                    medicines:
                        completedController.medicineOrder![index].medicines,
                    drName: completedController.medicineOrder![index].doctorName
                        .toString(),
                    patientImage:
                        completedController.medicineOrder![index].userImage,
                    drId: completedController.medicineOrder![index].doctorId
                        .toString(),
                    patientId: completedController
                        .medicineOrder![index].patientId
                        .toString(),
                    tokenId: completedController.medicineOrder![index].tokenId
                        .toString(),
                    type: 1,
                    checkBoxVisibleId: tabController.index,
                    prescriptionImages: completedController
                        .medicineOrder![index].prescriptionImage!,
                  ),
                ),
              );
            },
            child: BuilderCardWidget(
              patientImage: completedController.medicineOrder![index].userImage,
              name: completedController.medicineOrder![index].patientName
                  .toString(),
              date: completedController.medicineOrder![index].date.toString(),
              drName: completedController.medicineOrder![index].doctorName
                  .toString(),
            ),
          );
        },
      );
    });
  }
}
