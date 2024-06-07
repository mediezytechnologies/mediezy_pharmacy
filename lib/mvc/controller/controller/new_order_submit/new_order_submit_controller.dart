import 'dart:developer';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/new_order_submit/new_order_submit_service.dart';
import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';

class NewOrderSubmitController extends GetxController {
  RxBool loading = true.obs;

  var newOrderSubmitModel = NewOrderSubmitModel().obs;

  Future<NewOrderSubmitModel?> addNewOrderSubmit({
    required String patientId,
    required String tokenId,
    required String doctorId,
    required String orderStatus,
    required List<int> medicineList,
  }) async {
    try {
      var data = await NewOrderSubmitService.newOrderSubmitService(
          patientId: patientId,
          tokenId: tokenId,
          doctorId: doctorId,
          orderStatus: orderStatus,
          medicineList: medicineList);
      update();
      loading.value = false;
      newOrderSubmitModel.value = data!;
      update();
      return newOrderSubmitModel.value;
    } catch (e) {
      Get.snackbar("Warning", "Please check internet connection");
      log(e.toString());
      loading.value = false;
    }
    return null;
  }
}
