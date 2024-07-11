import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/view/screens/home/widgets/order_list_widget.dart';

import '../../../../controller/controller/completed/completed_controller.dart';

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
      return OrderListWidget(
        type: 1,
        checkBoxVisibleId: tabController.index,
        medicineOrder: completedController.medicineOrder!,
      );
    });
  }
}
