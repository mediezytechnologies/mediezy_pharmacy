import 'dart:developer';

import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/forgot_password/forgot_password_service.dart';
import 'package:mediezy_medical/mvc/model/forgot_password/forgot_password_one_model.dart';
import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';
import 'package:mediezy_medical/mvc/view/screens/auth/forgot_password/forgot_password_three.dart';
import 'package:mediezy_medical/mvc/view/screens/auth/forgot_password/forgot_password_two.dart';
import 'package:mediezy_medical/mvc/view/screens/auth/login_screen.dart';

class ForgotPasswordController extends GetxController {
  RxBool loading = false.obs;
  RxBool hideNewPassword = true.obs;
  RxBool hideNewConfirmPassword = true.obs;

  var forgotPasswordOneModel = ForgotPasswordOneModel().obs;
  var newOrderSubmitModel = NewOrderSubmitModel().obs;

  void changeHideNewPassword() {
    hideNewPassword.value = !hideNewPassword.value;
    log(hideNewPassword.value.toString());
    update();
  }

  void changeHideNewConfirmPassword() {
    hideNewConfirmPassword.value = !hideNewConfirmPassword.value;
    log(hideNewConfirmPassword.value.toString());
    update();
  }

//! forgot password one

  Future<ForgotPasswordOneModel?> addForgotPasswordOne(
      {required String email}) async {
    try {
      loading.value = true;

      var data =
          await ForgotPasswordService.forgotPasswordService(email: email);

      forgotPasswordOneModel.value = data!;
      if (forgotPasswordOneModel.value.status == true) {
        Get.snackbar(forgotPasswordOneModel.value.message.toString(), "",
            snackPosition: SnackPosition.BOTTOM);
        Get.to(() => ForgetPasswordTwo(email: email));
      }
    } catch (e) {
      log(">>>>>>>>>>${e.toString()}");
      // Get.snackbar("Error", "An error occured",
      //     snackPosition: SnackPosition.BOTTOM);
    } finally {
      loading.value = false;
      update();
    }
    return null;
  }

  // //! forgot password two

  Future<NewOrderSubmitModel?> addForgotPasswordTwo(
      {required String otp}) async {
    try {
      loading.value = true;

      var data = await ForgotPasswordService.forgotPasswordTwo(otp: otp);

      newOrderSubmitModel.value = data!;
      if (newOrderSubmitModel.value.status == true) {
        Get.snackbar(newOrderSubmitModel.value.message.toString(), "",
            snackPosition: SnackPosition.BOTTOM);
        Get.to(() => ForgotPasswordThree());
      }
    } catch (e) {
      log(">>>$e");
    } finally {
      loading.value = false;
      update();
    }
    return null;
  }

  //! forgot password three

  Future<NewOrderSubmitModel?> addForgotPasswordThree(
      {required String password}) async {
    try {
      loading.value = true;

      var data =
          await ForgotPasswordService.forgotPasswordThree(password: password);

      newOrderSubmitModel.value = data!;

      if (newOrderSubmitModel.value.status == true) {
        Get.snackbar(newOrderSubmitModel.value.message.toString(), "",
            snackPosition: SnackPosition.BOTTOM);
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
