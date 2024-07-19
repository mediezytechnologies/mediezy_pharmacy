import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/profile/get_profile_model.dart';
import 'package:mediezy_medical/mvc/view/services/base_url.dart';
import 'package:mediezy_medical/mvc/view/services/get_local_storage.dart';

class GetProfileService {
  static Future<GetProfileModel?> getProfileService() async {
    try {
      String? id = GetLocalStorage.getUserIdAndToken('id');

      var response =
          await DioClient.dio.get('$baseUrl/medicalshop/medicalshopEdit/$id');

      GetProfileModel? model = GetProfileModel.fromJson(response.data);

      log(response.data);
      log(model.toString());

      return model;
    } on DioException catch (e) {
      log(e.toString());
    }
    return null;
  }
}
