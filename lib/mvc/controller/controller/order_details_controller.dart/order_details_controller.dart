import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../model/new_order/new_order_model.dart';

class CheckboxController extends GetxController {
  var allChecked = false.obs;
  final checkedItems = <int>{}.obs;
  toggleItem(int index, int length) {
    if (checkedItems.contains(index)) {
      checkedItems.remove(index);
      allChecked.value = false;
    } else {
      checkedItems.add(index);
      allChecked.value = false;
    }
    allChecked.value = checkedItems.length == length;
  }

  void toggleAllItems(List<Medicines> medicines) {
    if (allChecked.value) {
      checkedItems.clear();
      allChecked.value = false;
    } else {
      checkedItems.addAll(medicines.map((medicine) => medicine.id!));
      allChecked.value = true;
    }
  }

  List<int> get checkedIds => checkedItems.toList();
}
