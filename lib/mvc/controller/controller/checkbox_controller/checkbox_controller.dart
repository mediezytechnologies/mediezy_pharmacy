import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var allChecked = false.obs;
  final checkedMedicines = <int>{}.obs;
  final checkedPrescriptions = <String>{}.obs;

  void toggleItem(
      dynamic item, int totalMedicinesCount, int totalPrescriptionsCount) {
    if (item is int) {
      if (checkedMedicines.contains(item)) {
        checkedMedicines.remove(item);
      } else {
        checkedMedicines.add(item);
      }
    } else if (item is String) {
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

  void toggleAllItems(List<int> medicineIds, List<String> prescriptionImages) {
    if (allChecked.value) {
      checkedMedicines.clear();
      checkedPrescriptions.clear();
    } else {
      checkedMedicines.addAll(medicineIds);
      checkedPrescriptions.addAll(prescriptionImages);
    }
    allChecked.value = !allChecked.value;
  }

  List<int> get checkedMedicineIds => checkedMedicines.toList();
  List<String> get checkedPrescriptionImages => checkedPrescriptions.toList();
}
