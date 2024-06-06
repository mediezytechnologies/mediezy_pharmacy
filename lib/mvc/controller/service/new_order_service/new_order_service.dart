import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mediezy_medical/mvc/model/new_order_model.dart';

class MedicineService {
  static Future<List<MedicineOrder>?> medidicineService() async {
    try {
      var response = await Dio(BaseOptions(
        headers: {
          'Authorization':
              'Bearer 203|b45PxtPV3vGefD5ZqLP5xiV9pRKlotGRLyjf8j9g2d974d36'
        },
        contentType: 'application/json',
      )).post("https://test.mediezy.com/api/medicalshop/getUpcomingOrder",
          data: {"medical_shop_id": "1370"}
          // "${basePathUrl}get-hospital-name/$doctorId",
          );
      NewOrderModel? model = NewOrderModel.fromJson(response.data);
      log(model.toString());
      log("res ${response.data}");
      return model.medicineOrder;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log("6656566565656556565  dist");
      log("${e.response!.data}===========");
      log("${e.message}=fdsfg=fd");
    } catch (e) {
      log("$e");
    }
    return null;
  }
}
