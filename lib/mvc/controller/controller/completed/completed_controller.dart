import 'dart:developer';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/completed/completed_service.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';

class CompletedController extends GetxController {
  RxBool loading = true.obs;

  RxList<MedicineOrder>? medicineOrder = <MedicineOrder>[].obs;

  Future<List<MedicineOrder>?> getCompletedOrders() async {
    try {
      var data = await CompletedService.completedService();
      update();
      loading.value = false;
      medicineOrder!.value = data!;
      update();
      return medicineOrder;
    } catch (e) {
      Get.snackbar("Warning", e.toString());
      log("$e");
      loading.value = false;
    }
    return null;
  }

  @override
  void onInit() {
    getCompletedOrders();
    update();
    super.onInit();
  }
}
