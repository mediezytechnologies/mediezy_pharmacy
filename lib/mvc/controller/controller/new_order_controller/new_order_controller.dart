import 'dart:developer';

import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/new_order_service/new_order_service.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';

class MedicineController extends GetxController {
  RxBool loding = true.obs;
  // RxBool isChecked = false.obs;
  // RxBool _loading = true.obs;
  // RxBool get loading => _loading;

  RxList<bool> isCheckedList = <bool>[].obs;

  RxList<MedicineOrder>? medicineOrder = <MedicineOrder>[].obs;

  Future<List<MedicineOrder>?> getMedicineService() async {
    try {
      var data = await MedicineService.medidicineService();
      update();
      loding.value = false;
      medicineOrder!.value = data!;
      update();
      return medicineOrder!;
    } catch (e) {
      Get.snackbar('warnig', 'Please check Internet Connection');
      log(e.toString());
      loding.value = false;
    }
    return null;
  }

  @override
  void onInit() {
    getMedicineService();

    update();

    super.onInit();
  }
}
