import 'dart:developer';

import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/auth/signup/signup_service.dart';
import 'package:mediezy_medical/mvc/model/auth/signup/signup_model.dart';
import 'package:mediezy_medical/mvc/view/screens/auth/login_screen.dart';

class SignupController extends GetxController {
  RxBool loading = true.obs;

  var signupModel = SignupModel().obs;

  Future<SignupModel?> addSignup({
    required String name,
    required String email,
    required String password,
    required String mobileNo,
    required String address,
    required String location,
    required String pincode,
    String? medicalshopImage,
  }) async {
    try {
      var data = await SignupService.signupService(
          name: name,
          email: email,
          password: password,
          mobileNo: mobileNo,
          address: address,
          location: location,
          pincode: pincode,
          medicalshopImage: medicalshopImage??"");

      signupModel.value = data!;

      if (signupModel.value.status == true) {
        Get.snackbar(signupModel.value.message.toString(), "",
            snackPosition: SnackPosition.BOTTOM);
        Get.to(() => LoginScreen());
      }
      loading.value = false;
      update();
      return signupModel.value;
    } catch (e) {
      log(e.toString());
      loading.value = false;
    }
    return null;
  }
}
