import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';

import '../../../view/services/base_url.dart';
import '../../../view/services/get_local_storage.dart';

class NewOrderSubmitService {
  static Future<NewOrderSubmitModel?> newOrderSubmitService({
    required String patientId,
    required String tokenId,
    required String doctorId,
    required String orderStatus,
    required List<int> medicineList,
    required String prescriptionImage,
  }) async {
    try {
      String? id = GetLocalStorage.getUserIdAndToken('id');
      var formData = {
        "medical_shop_id": id,
        "patient_id": patientId,
        "token_id": tokenId,
        "doctor_id": doctorId,
        "order_details_status": orderStatus,
        "medicine_list": medicineList,
        "prescription_image": prescriptionImage,
      };
      for (var element in formData.entries) {
        log(element.toString());
      }
      var response = await DioClient.dio
          .post("$baseUrl/medicalshop/MedicineOrderSubmit", data: formData);

      NewOrderSubmitModel model = NewOrderSubmitModel.fromJson(response.data);
      log(model.toString());
      log("res ${response.data}");
      log("res dfgdfhdfhfg ${model.message}");
      log("servise strt ${model.status}");
      return model;

      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log("${e.response!.data}===========");
      log("${e.message}=fdsfg=fd");

      Get.snackbar(e.response!.data['response'], "");
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
