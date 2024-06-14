import 'dart:developer';

import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/auth/login/login_service.dart';
import 'package:mediezy_medical/mvc/model/auth/login/login_model.dart';
import 'package:mediezy_medical/mvc/view/screens/home/new_orders/new_orders.dart';

class LoginController extends GetxController {
  RxBool loading = true.obs;

  var loginModel = LoginModel().obs;

  Future<LoginModel?> addLogin({
    required String email,
    required String password,
  }) async {
    try {
      var data =
          await LoginService.loginService(email: email, password: password);
      loginModel.value = data!;

      log(">>>>>>>>>>>>>>>>>>${loginModel.value.message.toString()}");
      if (loginModel.value.status == true) {
        Get.snackbar(loginModel.value.message.toString(), "",
            snackPosition: SnackPosition.BOTTOM);
        Get.offAll(NewOrderScreen());
      }
      loading.value = false;
      update();
      return loginModel.value;
    } catch (e) {
      log("sdfkskldafjkolpdsa : $e");
      loading.value = false;
    }
    return null;
  }
}
