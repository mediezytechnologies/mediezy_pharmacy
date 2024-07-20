import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/new_order_service/new_order_service.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';
import 'package:mediezy_medical/mvc/model/new_order/upcoming_date_model.dart';

class MedicineController extends GetxController {
  RxBool loding = true.obs;
  var selectedIndex = 0.obs;
  late Timer pollingTimer;
  RxList<MedicineOrder> medicineOrder = <MedicineOrder>[].obs;

  Future<void> getMedicine(String date) async {
    try {
      // loding.value = true;
      var data = await MedicineService.medicineService(date);
      if (data != null) {
        medicineOrder.value = data;
        // updateEachTime();
        // selectedIndex.value = data.length - 1;
      }
    } catch (e) {
      log('Error fetching medicine: $e');
    } finally {
      loding.value = false;
    }
  }
}

//! upcoming date controller

class UpcomingDateController extends GetxController {
  RxBool loading = true.obs;
  RxList<Date> date = <Date>[].obs;
  RxInt tabLength = 0.obs;
  // final MedicineController medicineController = Get.find<MedicineController>();
  var nestedTabIndex = "".obs;

  @override
  void onInit() {
    super.onInit();
    getUpcomingDate();
  }

  Future<void> getUpcomingDate() async {
    try {
      loading.value = true;
      var data = await UpcomingDateService.upcomingDateService();
      if (data != null) {
        date.value = data;
        tabLength.value = data.length;
        nestedTabIndex.value = date.last.formatDate.toString();
        log("last val ${nestedTabIndex.value}");
      } else {
        tabLength.value = 0;
      }
    } catch (e) {
      log('Error fetching upcoming dates: $e');
      tabLength.value = 0;
    } finally {
      loading.value = false;
    }
  }
}
