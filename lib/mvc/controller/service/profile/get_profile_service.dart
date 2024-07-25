import 'dart:developer';

import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/profile/get_profile_model.dart';
import 'package:mediezy_medical/mvc/view/services/base_url.dart';
import 'package:mediezy_medical/mvc/view/services/get_local_storage.dart';

///medicalshop/medicalshopUpdate
class GetProfileService {
  static Future<Medicalshop?> getProfileService() async {
    try {
      String? id = GetLocalStorage.getUserIdAndToken('id');

      var response =
          await DioClient.dio.get('$baseUrl/medicalshop/medicalshopEdit/$id');

      GetProfileModel? model = GetProfileModel.fromJson(response.data);

      log(response.data.toString());
      log(model.toString());

      return model.medicalshop;
    } on DioException catch (e) {
      log(e.toString());
    }
    return null;
  }

// edit profile service

  static Future<dynamic> editProfileService(
      String firstname,
      String mobileNumber,
      String address,
      String medicalshop,
      String location,
      String pincode,
      String? image) async {
    try {
      String? id = GetLocalStorage.getUserIdAndToken('id');

      FormData formData = FormData.fromMap({
        "medical_shop_id": id,
        "firstname": firstname,
        "mobileNo": mobileNumber,
        "address": address,
        "pincode": pincode,
        "location": location,
        if (image != null && image.isNotEmpty)
          "medicalshop_image": await MultipartFile.fromFile(
            image,
            filename: image.split('/').last,
            contentType: MediaType('image', 'jpg'),
          ),
      });

      var response = await DioClient.dio.post(
        '$baseUrl/medicalshop/medicalshopUpdate',
        data: formData,
      );

      log(response.data.toString());

      return response.data;
    } on DioException catch (e) {
      log(e.toString());
    } catch (e) {
      log("Error: $e");
      // Get.snackbar("An error occurred", e.toString());
    }
  }
}
