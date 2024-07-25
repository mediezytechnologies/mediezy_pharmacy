import 'dart:developer';

import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/reset_password/reset_password_service.dart';
import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';
import 'package:mediezy_medical/mvc/view/screens/auth/login_screen.dart';
import 'package:mediezy_medical/mvc/view/services/get_local_storage.dart';

class ResetPasswordController extends GetxController {
  RxBool loading = false.obs;
  RxBool hideNewPassword = true.obs;
  RxBool hideConfirmPassword = true.obs;

  var newOrderSubmitModel = NewOrderSubmitModel().obs;

  void changeHideNewPassword() {
    hideNewPassword.value = !hideNewPassword.value;
    log(hideNewPassword.value.toString());
    update();
  }

  void changeHideConfirmPassword() {
    hideConfirmPassword.value = !hideConfirmPassword.value;
    log(hideConfirmPassword.value.toString());
    update();
  }

  Future<NewOrderSubmitModel?> addResetPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      loading.value = true;
      await Future.delayed(Duration(seconds: 2));
      var data = await ResetPasswordService.resetPasswordService(
          oldPassword: oldPassword, newPassword: newPassword);

      newOrderSubmitModel.value = data!;

      log("status : ${newOrderSubmitModel.value.status.toString()}");

      if (newOrderSubmitModel.value.status == true) {
        log("message");
        Get.snackbar(newOrderSubmitModel.value.message.toString(), "",
            snackPosition: SnackPosition.BOTTOM);
        GetLocalStorage.removeUserTokenAndUid();
        Get.offAll(() => LoginScreen());
      }
    } catch (e) {
      log(e.toString());
    } finally {
      loading.value = false;
      update();
    }
    return null;
  }
}
