import 'package:dio/dio.dart';

class DioClient {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://test.mediezy.com/api",
      headers: {
        'Authorization':
            'Bearer 203|b45PxtPV3vGefD5ZqLP5xiV9pRKlotGRLyjf8j9g2d974d36'
      },
      contentType: 'application/json',
    ),
  );
}
