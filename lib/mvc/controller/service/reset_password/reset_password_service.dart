import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';
import 'package:mediezy_medical/mvc/view/services/base_url.dart';
import 'package:mediezy_medical/mvc/view/services/get_local_storage.dart';

class ResetPasswordService {
  static Future<NewOrderSubmitModel?> resetPasswordService(
      {required String oldPassword, required String newPassword}) async {
    try {
      String? id = GetLocalStorage.getUserIdAndToken('id');
      var formData = {
        "user_id": id,
        "old_password": oldPassword,
        "new_password": newPassword,
      };

      var response =
          await DioClient.dio.post("$baseUrl/reset-password", data: formData);

      NewOrderSubmitModel model = NewOrderSubmitModel.fromJson(response.data);

      log(response.data.toString());
      log(model.toString());

      return model;
    } on DioException catch (e) {
      log(e.response!.data.toString());
      Get.snackbar(e.response!.data['message'], "",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
