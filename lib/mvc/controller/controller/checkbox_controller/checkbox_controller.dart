import 'dart:developer';

import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var allChecked = false.obs;
  var isEditing = false.obs;

  var deliveredStatus = 0.obs;

  final checkedMedicines = <int>{}.obs;
  final checkedPrescriptions = <int>{}.obs;

  void toggleItem(int item, int totalMedicinesCount,
      int totalPrescriptionsCount, bool isMedicine) {
    if (isMedicine) {
      if (checkedMedicines.contains(item)) {
        checkedMedicines.remove(item);
      } else {
        checkedMedicines.add(item);
      }
    } else {
      if (checkedPrescriptions.contains(item)) {
        checkedPrescriptions.remove(item);
      } else {
        checkedPrescriptions.add(item);
      }
    }

    // Update the allChecked status based on the current selections
    allChecked.value = (checkedMedicines.length == totalMedicinesCount) &&
        (checkedPrescriptions.length == totalPrescriptionsCount);
  }

  void toggleAllItems(List<int> medicineIds, List<int> prescriptionImageIds) {
    if (allChecked.value) {
      checkedMedicines.clear();
      checkedPrescriptions.clear();
    } else {
      checkedMedicines.addAll(medicineIds);
      checkedPrescriptions.addAll(prescriptionImageIds);
    }
    allChecked.value = !allChecked.value;
  }

  changeEditIcon() {
    isEditing.value = !isEditing.value;
    // if (isEditing.value == true) {
    //   deliveredStatus.value = 1;
    // } else {
    //   deliveredStatus.value = 0;
    // }

    // log("stat val ===== ${deliveredStatus.value}");

    log(isEditing.value.toString());
    update();
  }

  List<int> get checkedMedicineIds => checkedMedicines.toList();
  List<int> get checkedPrescriptionImages => checkedPrescriptions.toList();
}
