import 'dart:developer';

import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/service/profile/get_profile_service.dart';
import 'package:mediezy_medical/mvc/model/profile/get_profile_model.dart';

class GetProfileController extends GetxController {
     RxBool isEdit = true.obs;
  RxBool loading = false.obs;
  RxBool isUpdating = false.obs;
  Rx<Medicalshop> getProfileModel = Medicalshop().obs;
  Rx<GetProfileModel> editProfileModel = GetProfileModel().obs;
  Future<void> getProfile() async {
    try {
      var data = await GetProfileService.getProfileService();

      if (data != null) {
        getProfileModel.value = data;
        log("shameeeee .... tis controller");
        loading.value = false;
      }
    } catch (e) {
      log(e.toString());
    } finally {
      loading.value = false;
    }
  }

Future<void> editProfile(String firstname, String mobileNumber, String address, String medicalshop, String location) async {
    isUpdating.value = true;
    try {
      var data = await GetProfileService.editProfileService(
          firstname, mobileNumber, address, medicalshop, location);

      if (data != null) {
        log("Profile updated successfully");
        await getProfile(); // Refresh profile data
      }
    } catch (e) {
      log("Error updating profile: $e");
    } finally {
      isUpdating.value = false;
      isEdit.value = true; // Switch back to view mode
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
