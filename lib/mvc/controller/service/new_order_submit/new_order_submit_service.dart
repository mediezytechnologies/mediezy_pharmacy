import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';
import 'package:mediezy_medical/mvc/view/services/base_url.dart';
import 'package:mediezy_medical/mvc/view/services/get_local_storage.dart';

class NewOrderSubmitService {
  static Future<NewOrderSubmitModel?> newOrderSubmitService({
    required String patientId,
    required String tokenId,
    required String doctorId,
    required String orderStatus,
    required String notes,
    required int appointmentId,
    List<int>? medicineList,
    List<int>? prescriptionImage,
  }) async {
    // String? id = GetLocalStorage.getUserIdAndToken('id');
    // List<MultipartFile> addMemberImages = [];

    try {
      String? id = GetLocalStorage.getUserIdAndToken('id');
      FormData formData = FormData.fromMap({
        "medical_shop_id": id,
        "patient_id": patientId,
        "token_id": tokenId,
        "doctor_id": doctorId,
        "order_details_status": orderStatus,
        "medicine_list[]": medicineList,
        "prescription_image[]": prescriptionImage,
        'notes': notes,
        'appointment_id': appointmentId,
      });

      for (var element in formData.fields) {
        log(element.toString());
      }
      for (var field in formData.fields) {
        log("${field.key}: ${field.value}");
      }
      for (var file in formData.files) {
        log("${file.key}: ${file.value.filename}");
      }

      var response = await DioClient.dio
          .post("$baseUrl/medicalshop/MedicineOrderSubmit", data: formData);

      NewOrderSubmitModel model = NewOrderSubmitModel.fromJson(response.data);
      log(model.toString());
      log("Response: ${response.data}");
      log("Message: ${model.message}");
      log("Status: ${model.status}");

      return model;
    } on DioException catch (e) {
      log("DioError: ${e.response?.data}");
      log("DioError message: ${e.message}");
      // Consider handling this error, perhaps by showing a snackbar or alert to the user
    } catch (e) {
      log("General error: ${e.toString()}");
      // Consider handling this error as well
    }

    return null;
  }
}


// class NewOrderSubmitService {
//   static Future<NewOrderSubmitModel?> newOrderSubmitService({
//     required String patientId,
//     required String tokenId,
//     required String doctorId,
//     required String orderStatus,
//     required List<int> medicineList,
//     List<String>? prescriptionImage,
//   }) async {
//     String? id = GetLocalStorage.getUserIdAndToken('id');

//     try {
//       Map<String, dynamic> formDataMap = {
//         "medical_shop_id": id,
//         "patient_id": patientId,
//         "token_id": tokenId,
//         "doctor_id": doctorId,
//         "order_details_status": orderStatus,
//         "medicine_list": medicineList,
//       };

//       if (prescriptionImage != null && prescriptionImage.isNotEmpty) {
//         formDataMap["prescription_image"] = prescriptionImage;
//         log("Prescription Images: $prescriptionImage");
//       }

//       FormData formData = FormData.fromMap(formDataMap);

//       log("FormData fields:");
//       for (var element in formData.fields) {
//         log(element.toString());
//       }

//       var response = await DioClient.dio
//           .post("$baseUrl/medicalshop/MedicineOrderSubmit", data: formData);

//       NewOrderSubmitModel model = NewOrderSubmitModel.fromJson(response.data);
//       log("Response: ${response.data}");
//       log("Model message: ${model.message}");
//       log("Model status: ${model.status}");
//       return model;

//     } on DioError catch (e) {
//       log("DioError: ${e.response?.data}");
//       log("DioError message: ${e.message}");
//     //  Get.snackbar("Error", e.response?.data['message'] ?? "An error occurred");
//     } catch (e) {
//       log("Error: $e");
//     //  Get.snackbar("Error", "An unexpected error occurred");
//     }
//     return null;
//   }
// }