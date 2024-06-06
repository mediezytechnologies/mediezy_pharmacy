import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/demo/demo_model.dart';

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
      DemoModel? model = DemoModel.fromJson(response.data);
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

//controller..

class MedicineController extends GetxController {
  RxBool loding = true.obs;
  // RxBool isChecked = false.obs;
  // RxBool _loading = true.obs;
  // RxBool get loading => _loading;

  RxList<bool> isCheckedList = <bool>[].obs;

  RxList<MedicineOrder>? medicineOrder = <MedicineOrder>[].obs;

  Future<List<MedicineOrder>?> getMedicineService() async {
    try {
      var data = await MedicineService.medidicineService();
      update();
      loding.value = false;
      medicineOrder!.value = data!;
      update();
      return medicineOrder!;
    } catch (e) {
      Get.snackbar('warnig', 'Please check Internet Connection');
      log(e.toString());
      loding.value = false;
    }
    return null;
  }

  List<bool> checked = List.generate(10, (index) => false);

  final items = <bool>[].obs;

  void toggleItem(int index) {
    if (items.length > index) {
      items[index] = !items[index];
    } else {
      items.add(true);
    }
    items.refresh();
  }
//! checkbox function

  // void checkBoxValue(bool newValue) {
  //   isChecked.value = newValue;
  // }
  // void toggleCheckbox(int index) {
  //   isCheckedList[index] = !isCheckedList[index];
  //   update();
  // }

  @override
  void onInit() {
    getMedicineService();

    update();

    super.onInit();
  }
}


// import 'package:get/get.dart';

// class FavoriteController extends GetxController {
//   final favorites = <String>[].obs;

//   void addToFavorites(String item) {
//     if (!favorites.contains(item)) {
//       favorites.add(item);
//     }
//   }

//   void removeFromFavorites(String item) {
//     favorites.remove(item);
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MyController extends GetxController {
//   final items = <bool>[].obs;

//   void toggleItem(int index) {
//     if (items.length > index) {
//       items[index] = !items[index];
//     } else {
//       items.add(true);
//     }
//     items.refresh();
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final MyController controller = Get.put(MyController());

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('List View Builder'),
//         ),
//         body: Obx(
//           () => ListView.builder(
//             itemCount: 30,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text('Item $index'),
//                 trailing: Checkbox(
//                   value: controller.items.length > index
//                       ? controller.items[index]
//                       : false,
//                   onChanged: (value) {
//                     controller.toggleItem(index);
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }