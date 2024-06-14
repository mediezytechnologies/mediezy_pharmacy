import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/controller/new_order_controller/new_order_controller.dart';
import 'package:mediezy_medical/mvc/controller/service/new_order_submit/new_order_submit_service.dart';
import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';

class NewOrderSubmitController extends GetxController {
  final MedicineController medicineController = Get.put(MedicineController());
  RxBool loading = true.obs;

  var newOrderSubmitModel = NewOrderSubmitModel().obs;

  Future<NewOrderSubmitModel?> addNewOrderSubmit(
      {required String patientId,
      required String tokenId,
      required String doctorId,
      required String orderStatus,
      required List<int> medicineList,
      required BuildContext context}) async {
    try {
      var data = await NewOrderSubmitService.newOrderSubmitService(
          patientId: patientId,
          tokenId: tokenId,
          doctorId: doctorId,
          orderStatus: orderStatus,
          medicineList: medicineList);
      newOrderSubmitModel.value = data!;

      if (newOrderSubmitModel.value.status == true) {
        Get.snackbar(newOrderSubmitModel.value.message.toString(), "",
            snackPosition: SnackPosition.BOTTOM);
        medicineController.getMedicine(date: '2024-06-11');
        Navigator.pop(context);
      }

      loading.value = false;

      update();
      return newOrderSubmitModel.value;
    } catch (e) {
      log("sdfkskldafjkolpdsa : $e");
      loading.value = false;
    }
    return null;
  }
}
