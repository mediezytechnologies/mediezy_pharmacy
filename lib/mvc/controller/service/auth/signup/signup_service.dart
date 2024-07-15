import 'dart:developer';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';

import '../../../../model/auth/signup/signup_model.dart';
import '../../../../view/services/base_url.dart';
import '../../../dio_client.dart';

// class SignupService {
//   static Future<SignupModel?> signupService({
//     required String name,
//     required String email,
//     required String password,
//     required String mobileNo,
//     required String address,
//     required String location,
//     required String pincode,
//     String? medicalshopImage,
//   }) async {
   

//     //MultipartFile? addMemberImage;
//    // log("????????????????????????>>>>>>>>>>>>>>>>>>>>>>>>>>${addMemberImage.toString()}");
//     try {
//       Map<String, dynamic> formDataMap = {
//         "firstname": name,
//         "email": email,
//         "password": password,
//         "mobileNo": mobileNo,
//         "address": address,
//         "location": location,
//         "pincode": pincode,
//         // "medicalshop_image": addMemberImage,
//       };

//       if (medicalshopImage != null && medicalshopImage.isNotEmpty) {
//         //log(medicalshopImage);
//         formDataMap["medicalshop_image"] =
//             // addMemberImage =
//             await MultipartFile.fromFile(
//           medicalshopImage,
//           filename: medicalshopImage.split('/').last,
//           contentType: MediaType('image', 'jpg'),
//         );
//       }
//       FormData formData = FormData.fromMap(formDataMap);

//       log("FormData: ${formData.fields}");
//       for (var file in formData.files) {
//         log("File: ${file.key}: ${file.value.filename}");
//       }

//       var response = await DioClient.dio
//           .post("$baseUrl/medicalshop/Register", data: formData);
//       SignupModel model = SignupModel.fromJson(response.data);
//       log("model :$model");
//       log(response.data.toString());
//         log("Response: ${response.data}");
//       return model;
//     } on DioException catch (e) {
//       log(e.response!.data.toString());
//       Get.snackbar(e.response!.data['message'], "");
//     } catch (e) {
//       log(e.toString());
//     }
//     return null;
//   }
// }
class SignupService {
  static Future<SignupModel?> signupService({
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
      Map<String, dynamic> formDataMap = {
        "firstname": name,
        "email": email,
        "password": password,
        "mobileNo": mobileNo,
        "address": address,
        "location": location,
        "pincode": pincode,
      };

      if (medicalshopImage != null && medicalshopImage.isNotEmpty) {
        try {
          formDataMap["medicalshop_image"] = await MultipartFile.fromFile(
            medicalshopImage,
            filename: medicalshopImage.split('/').last,
            contentType: MediaType('image', 'jpg'),
          );
        } catch (e) {
          log("Error processing image: $e");
          // Handle the error (e.g., show a message to the user)
        }
      }

      FormData formData = FormData.fromMap(formDataMap);

      log("FormData: ${formData.fields}");
      for (var file in formData.files) {
        log("File: ${file.key}: ${file.value.filename}");
      }

      var response = await DioClient.dio
          .post("$baseUrl/medicalshop/Register", data: formData);
      SignupModel model = SignupModel.fromJson(response.data);
      log("model: $model");
      log("Response: ${response.data}");
      return model;
    } on DioException catch (e) {
      log("DioException: ${e.response?.data}");
      Get.snackbar(e.response?.data['message'] ?? "An error occurred", "");
    } catch (e) {
      log("Error: $e");
      Get.snackbar("An error occurred", e.toString());
    }
    return null;
  }
}