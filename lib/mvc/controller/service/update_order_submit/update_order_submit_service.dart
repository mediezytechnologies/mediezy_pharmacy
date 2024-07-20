import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';
import 'package:mediezy_medical/mvc/view/services/base_url.dart';

class UpdateOrderSubmitService {
  static Future<NewOrderSubmitModel?> updateOrderSubmitService({
    required String appointmentId,
    required String notes,
    List<int>? medicineList,
    List<int>? imageIdList,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "medicine_list[]": medicineList,
        "appointment_id": appointmentId,
        "prescription_image[]": imageIdList,
        "notes": notes,
      });

      for (var element in formData.fields) {
        log(element.toString());
      }

      for (var field in formData.fields) {
        log("${field.key} :${field.value}");
      }

      for (var file in formData.files) {
        log("${file.key}: ${file.value.filename}");
      }

      var response = await DioClient.dio.post(
          "$baseUrl/medicalshop/updateCompleteMedicineOrder",
          data: formData);

      NewOrderSubmitModel model = NewOrderSubmitModel.fromJson(response.data);

      log(model.toString());
      log(response.data.toString());
      log(response.statusMessage.toString());

      return model;
    } on DioException catch (e) {
      log(e.response!.data.toString());
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
