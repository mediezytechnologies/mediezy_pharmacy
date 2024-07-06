import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';
import 'package:mediezy_medical/mvc/view/services/base_url.dart';
import 'package:mediezy_medical/mvc/view/services/get_local_storage.dart';

class ContactUsService {
  static Future<NewOrderSubmitModel?> contactUsService({
    required String email,
    required String description,
  }) async {
    try {
      String? id = GetLocalStorage.getUserIdAndToken('id');
      var formData = {
        "email": email,
        "description": description,
        "UserId": id,
      };
      for (var element in formData.entries) {
        log(element.toString());
      }

      var response = await DioClient.dio
          .post("$baseUrl/getContactUsDetails", data: formData);

      NewOrderSubmitModel model = NewOrderSubmitModel.fromJson(response.data);

      log(model.toString());
      log(response.toString());
      return model;
    } on DioException catch (e) {
      log(e.response!.data);

      Get.snackbar(e.response!.data['response'], "");
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
