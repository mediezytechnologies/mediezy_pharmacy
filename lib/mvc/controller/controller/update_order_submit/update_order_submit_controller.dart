import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/controller/checkbox_controller/checkbox_controller.dart';
import 'package:mediezy_medical/mvc/controller/controller/completed/completed_controller.dart';
import 'package:mediezy_medical/mvc/controller/service/update_order_submit/update_order_submit_service.dart';
import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';

class UpdateOrderSubmitController extends GetxController {
  final CompletedController completedController =
      Get.put(CompletedController());

  final CheckboxController checkboxController = Get.put(CheckboxController());
  RxBool loading = false.obs;

  var newOrderSubmitModel = NewOrderSubmitModel().obs;

  Future<NewOrderSubmitModel?> updateNewOrderSubmit(
      {required String appointmentId,
      required String notes,
      List<int>? medicineList,
      List<int>? imageIdList,
      required BuildContext context}) async {
    try {
      loading.value = true;

      var data = await UpdateOrderSubmitService.updateOrderSubmitService(
          appointmentId: appointmentId,
          notes: notes,
          imageIdList: imageIdList,
          medicineList: medicineList);

      newOrderSubmitModel.value = data!;

      if (newOrderSubmitModel.value.status = true) {
        log(newOrderSubmitModel.value.status.toString());
        Get.snackbar(newOrderSubmitModel.value.message.toString(), "",
            snackPosition: SnackPosition.BOTTOM);
        Navigator.of(context).pop();

        // checkboxController.allChecked.value = true;
        checkboxController.isEditing.value = true;

        checkboxController.allChecked.value = false;
        checkboxController.checkedMedicines.clear();
        checkboxController.checkedPrescriptions.clear();

        checkboxController.isEditing.value = false;
        completedController.getCompletedOrders();
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar("Error", "An unexpected error occured",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      loading.value = false;
      update();
    }
    return null;
  }
}
