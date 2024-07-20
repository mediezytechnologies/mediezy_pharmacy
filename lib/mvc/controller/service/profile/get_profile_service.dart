import 'dart:developer';

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


   static editProfileService(
    String firstname,mobileNumber,address,medicalshop,lacation
   ) async {
    try {
      String? id = GetLocalStorage.getUserIdAndToken('id');

      var data ={
 "medical_shop_id":id,
            "firstname":firstname,
            "mobileNo":mobileNumber,
            "address":address,
           // "medicalshop_image":image,
            "location":lacation
      };
      log(data.toString());

      var response =
          await DioClient.dio.post('$baseUrl/medicalshop/medicalshopUpdate',data: data);

          

      //GetProfileModel? model = GetProfileModel.fromJson(response.data);

      log(response.data.toString());
      //log(model.toString());

      return response.data;
    } on DioException catch (e) {
      log(e.toString());
      
    }
    return null;
  }
}
