import 'package:dio/dio.dart';
import 'package:mediezy_medical/mvc/view/services/base_url.dart';
import 'package:mediezy_medical/mvc/view/services/get_local_storage.dart';

class DioClient {
  static String? token = GetLocalStorage.getUserIdAndToken('token');
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
       
      headers: {'Authorization': 'Bearer $token'},
      contentType: 'application/json',
    ),
  );
}
