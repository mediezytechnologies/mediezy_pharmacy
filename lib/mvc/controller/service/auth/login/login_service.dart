import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/auth/login/login_model.dart';
import 'package:mediezy_medical/mvc/view/services/base_url.dart';
import 'package:mediezy_medical/mvc/view/services/get_local_storage.dart';

class LoginService {
  static Future<LoginModel?> loginService(
      {required String email, required String password}) async {
    try {
      var formData = {
        "email": email,
        "password": password,
      };
      for (var element in formData.entries) {
        log(element.toString());
      }
      var response =
          await DioClient.dio.post("$baseUrl/auth/login", data: formData);
      LoginModel model = LoginModel.fromJson(response.data);
      log("....................$model");
      log("res dfgdfhdfhfg ${model.message}");
      log("servise strt       ${model.status}");
      log(response.data.toString());

      Map<String, dynamic> user = {
        'token': response.data['token'],
        'id': response.data["medical_shop"]["id"].toString(),
        'firstname': response.data["medical_shop"]['firstname'].toString(),
        'mobileNo': response.data["medical_shop"]['mobileNo'].toString(),
        'image': response.data["medical_shop"]['image'].toString()
      };

      GetLocalStorage.saveToken(user);
      String? token = GetLocalStorage.getUserIdAndToken('token');
      String? id = GetLocalStorage.getUserIdAndToken('id');
      String? userName = GetLocalStorage.getUserIdAndToken('firstname');
      String? mobileNo = GetLocalStorage.getUserIdAndToken('mobileNo');
      String? image = GetLocalStorage.getUserIdAndToken('image');

      log("tol ==========$token");
      log("id ==========$id");
      log("user name ==========$userName");
      log("mob ===================== $mobileNo");
      log("mob ===================== $image");

      return model;
    } on DioException catch (e) {
      log("${e.response!.data}=============");

      Get.snackbar(e.response!.data['message'], "");
    } catch (e) {
      log("<<<<<<<<<<<<<<<<<<<<${e.toString()}");
    }
    return null;
  }
}
