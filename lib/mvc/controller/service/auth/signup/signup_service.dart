import 'dart:developer';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';

import '../../../../model/auth/signup/signup_model.dart';
import '../../../../view/services/base_url.dart';
import '../../../dio_client.dart';

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
    log("????????????????????????${medicalshopImage.toString()}");

    MultipartFile? addMemberImage;
    log("????????????????????????>>>>>>>>>>>>>>>>>>>>>>>>>>${addMemberImage.toString()}");
    try {
      if (medicalshopImage != null) {
        log(medicalshopImage);
        addMemberImage = await MultipartFile.fromFile(
          medicalshopImage,
          filename: medicalshopImage,
          contentType: MediaType('image', 'jpg'),
        );
      }

      FormData formData = FormData.fromMap({
        "firstname": name,
        "email": email,
        "password": password,
        "mobileNo": mobileNo,
        "address": address,
        "location": location,
        "pincode": pincode,
        "medicalshop_image": addMemberImage,
      });

      for (var field in formData.fields) {
        log("${field.key}: ${field.value}");
      }

      for (var file in formData.files) {
        log("${file.key}: ${file.value.filename}");
      }

      var response = await DioClient.dio
          .post("$baseUrl/medicalshop/Register", data: formData);
      SignupModel model = SignupModel.fromJson(response.data);
      log("model :$model");
      log(response.data.toString());
      return model;
    } on DioException catch (e) {
      log(e.response!.data.toString());
      Get.snackbar(e.response!.data['message'], "");
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
