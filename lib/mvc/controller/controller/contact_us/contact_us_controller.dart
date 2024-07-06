import 'dart:developer';

import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/contact_us/contact_us_service.dart';
import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';

class ContactUsController extends GetxController {
  RxBool loading = true.obs;

  var newOrderSubmitModel = NewOrderSubmitModel().obs;

  Future<NewOrderSubmitModel?> addContactUs({
    required String email,
    required String description,
  }) async {
    try {
      var data = await ContactUsService.contactUsService(
          email: email, description: description);

      newOrderSubmitModel.value = data!;

      if (newOrderSubmitModel.value.status == true) {
        Get.snackbar(newOrderSubmitModel.value.message.toString(), "");

        loading.value = false;
        update();
        return newOrderSubmitModel.value;
      }
    } catch (e) {
      log(e.toString());

      loading.value = false;
    }
    return null;
  }
}
