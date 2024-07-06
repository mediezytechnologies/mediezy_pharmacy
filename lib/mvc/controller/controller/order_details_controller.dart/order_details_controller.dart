import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var allChecked = false.obs;
  final checkedMedicines = <int>{}.obs;
  final checkedPrescriptions = <String>{}.obs;

  void toggleItem(dynamic item, int totalItemsCount) {
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
    allChecked.value =
        (checkedMedicines.length + checkedPrescriptions.length) ==
            totalItemsCount;
  }

  void toggleAllItems(List<dynamic> items) {
    if (allChecked.value) {
      checkedMedicines.clear();
      checkedPrescriptions.clear();
    } else {
      checkedMedicines.addAll(items.whereType<int>());
      checkedPrescriptions.addAll(items.whereType<String>());
    }
    allChecked.value = !allChecked.value;
  }

  List<int> get checkedMedicineIds => checkedMedicines.toList();
  List<String> get checkedPrescriptionImages => checkedPrescriptions.toList();
}
