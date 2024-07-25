import 'dart:developer';

import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/profile/get_profile_service.dart';
import 'package:mediezy_medical/mvc/model/profile/get_profile_model.dart';

class GetProfileController extends GetxController {
  RxBool isEdit = true.obs;
  RxBool loading = true.obs;
  RxBool updateLoading = false.obs;
  RxBool isUpdating = false.obs;
  Rx<Medicalshop> getProfileModel = Medicalshop().obs;
  Rx<GetProfileModel> editProfileModel = GetProfileModel().obs;

  Future<void> getProfile() async {
    try {
      var data = await GetProfileService.getProfileService();

      if (data != null) {
        getProfileModel.value = data;
        loading.value = false;
      }
    } catch (e) {
      log(e.toString());
    } finally {
      loading.value = false;
    }
  }

//update profile Controller

  Future<void> editProfile(
      String firstname,
      String mobileNumber,
      String address,
      String medicalshop,
      String location,
      String pincode,
      String? image) async {
    isUpdating.value = true;
    updateLoading.value = false;
    try {
      var data = await GetProfileService.editProfileService(firstname,
          mobileNumber, address, medicalshop, location, pincode, image);

      if (data != null) {
        log("Profile updated successfully");

        await getProfile();
      }
    } catch (e) {
      log("Error updating profile: $e");
    } finally {
      isUpdating.value = false;
      updateLoading.value = false;
      isEdit.value = true;
    }
  }

  void toggleEditMode() {
    isEdit.value = !isEdit.value;
    update();
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
