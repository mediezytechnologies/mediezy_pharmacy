import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/forgot_password/forgot_password_one_model.dart';
import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';
import 'package:mediezy_medical/mvc/view/services/base_url.dart';
import 'package:mediezy_medical/mvc/view/services/get_local_storage.dart';

class ForgotPasswordService {
  //!forgot password one

  static Future<ForgotPasswordOneModel?> forgotPasswordService(
      {required String email}) async {
    try {
      var formData = {"email": email};
      for (var element in formData.entries) {
        log(element.toString());
      }
      for (var field in formData.entries) {
        log("${field.key}: ${field.value}");
      }
      var response = await DioClient.dio
          .post("$baseUrl/user/forgot-password", data: formData);

      ForgotPasswordOneModel model =
          ForgotPasswordOneModel.fromJson(response.data);

      Map<String, dynamic> forgotUser = {
        'user_id': response.data['user_id'].toString(),
      };

      GetLocalStorage.saveToken(forgotUser);

      String? forgotUserId = GetLocalStorage.getUserIdAndToken('user_id');

      log("forgot user id : $forgotUserId");

      log(model.toString());
      log(response.data.toString());
      log(model.message.toString());

      return model;
    } on DioException catch (e) {
      log("hehe${e.response!.data.toString()}");
      Get.snackbar(e.response!.data["message"], "",
          snackPosition: SnackPosition.BOTTOM);
      log("<<<<<<<<<<<<<<<<<<<<<<<<${e.message.toString()}");
    } catch (e) {
      log("hahaaaaaaaaaaaaaaaaaaaaaaaaaaaaa>>>>>>>$e");
    }
    return null;
  }

//! forgot password two

  static Future<NewOrderSubmitModel?> forgotPasswordTwo(
      {required String otp}) async {
    try {
      String? forgotUserId = GetLocalStorage.getUserIdAndToken('user_id');
      var formData = {"otp": otp, "user_id": forgotUserId};

      for (var element in formData.entries) {
        log(element.toString());
      }
      for (var field in formData.entries) {
        log("${field.key}: ${field.value}");
      }

      var response = await DioClient.dio
          .post("$baseUrl/user/forgot-password/verify-otp", data: formData);

      NewOrderSubmitModel model = NewOrderSubmitModel.fromJson(response.data);

      log(response.data.toString());
      log(model.toString());
      log(response.statusMessage.toString());

      return model;
    } on DioException catch (e) {
      log("<<<<${e.response!.data.toString()}");
      Get.snackbar(e.response!.data['message'], "",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      log(",,,,,,,$e");
    }
    return null;
  }

  //! forgot password three

  static Future<NewOrderSubmitModel?> forgotPasswordThree(
      {required String password}) async {
    try {
      String? forgotUserId = GetLocalStorage.getUserIdAndToken('user_id');
      var formData = {
        "password": password,
        "user_id": forgotUserId,
      };

      for (var element in formData.entries) {
        log(element.toString());
      }
      for (var field in formData.entries) {
        log("${field.key}: ${field.value}");
      }

      var response = await DioClient.dio
          .post("$baseUrl/user/forgot-password/reset-password", data: formData);

      NewOrderSubmitModel model = NewOrderSubmitModel.fromJson(response.data);

      log(response.data.toString());
      log(model.toString());
      log(model.message.toString());

      return model;
    } on DioException catch (e) {
      log(e.response!.data.toString());
      Get.snackbar(e.response!.data['message'], "",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
