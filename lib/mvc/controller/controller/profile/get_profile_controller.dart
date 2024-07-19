import 'dart:developer';

import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/profile/get_profile_service.dart';
import 'package:mediezy_medical/mvc/model/profile/get_profile_model.dart';

class GetProfileController extends GetxController {
  RxBool loading = true.obs;
  Rx<GetProfileModel?> getProfileModel = GetProfileModel().obs;
  Future<void> getProfile() async {
    try {
      var data = await GetProfileService.getProfileService();

      if (data != null) {
        getProfileModel.value = data;
      }
    } catch (e) {
      log(e.toString());
    } finally {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
