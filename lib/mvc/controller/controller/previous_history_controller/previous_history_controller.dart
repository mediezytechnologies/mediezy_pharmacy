import 'dart:developer';

import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/previous_history.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';

class PreviousHistoryController extends GetxController {
  RxBool loading = true.obs;

  RxList<MedicineOrder>? medicineOrder = <MedicineOrder>[].obs;

  Future<List<MedicineOrder>?> getPreviousHistory(
      {required String date}) async {
    try {
      var data =
          await PreviousHistoryService.previousHistoryService(date: date);
      update();
      loading.value = false;
      medicineOrder!.value = data!;
      update();
      return medicineOrder;
    } catch (e) {
      log(e.toString());
      loading.value = false;
    }
    return null;
  }
}
