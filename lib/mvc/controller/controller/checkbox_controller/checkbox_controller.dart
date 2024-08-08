import 'dart:developer';

import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var allChecked = false.obs;
  var isEditing = false.obs;
  RxBool showListView = true.obs;

  final checkedMedicines = <int>{}.obs;
  final checkedPrescriptions = <int>{}.obs;

  // ! sorting function

  void sortingDoctor() {
    showListView.value = !showListView.value;
    update();
  }

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

  void changeEditIcon() {
    isEditing.value = !isEditing.value;
    log(isEditing.value.toString());
    update();
  }

  List<int> get checkedMedicineIds => checkedMedicines.toList();
  List<int> get checkedPrescriptionImages => checkedPrescriptions.toList();
}
