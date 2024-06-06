import 'package:mediezy_medical/ddd/infrastructure/core/base_url.dart';

class ApiEndPoints {
  static const login = "$baseUrl/auth/login";
  static const getNewOrders = "$baseUrl/medicalshop/getUpcomingOrder";
}
