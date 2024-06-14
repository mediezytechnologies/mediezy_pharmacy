import 'dart:developer';

import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/new_order_service/new_order_service.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';
import 'package:mediezy_medical/mvc/model/new_order/upcoming_date_model.dart';

class MedicineController extends GetxController {
  RxBool loding = true.obs;

  RxList<MedicineOrder>? medicineOrder = <MedicineOrder>[].obs;

  Future<List<MedicineOrder>?> getMedicine() async {
    try {
      var data = await MedicineService.medicineService();
      update();
      loding.value = false;
      medicineOrder!.value = data!;
      update();
      return medicineOrder!;
    } catch (e) {
      log(e.toString());
      loding.value = false;
    }
    return null;
  }

  @override
  void onInit() {
    getMedicine();
    super.onInit();
  }
}

//! upcoming date controller

class UpcomingDateController extends GetxController {
  RxBool loading = true.obs;
  RxList<Date>? date = <Date>[].obs;

  Future<List<Date>?> getUpcomingDate() async {
    try {
      var data = await UpcomingDateService.upcomingDateService();
      update();
      loading.value = false;
      date!.value = data!;
      update();
      return date!;
    } catch (e) {
      log(e.toString());
      loading.value = false;
    }
    return null;
  }

  @override
  void onInit() {
    getUpcomingDate();
    super.onInit();
  }
}
