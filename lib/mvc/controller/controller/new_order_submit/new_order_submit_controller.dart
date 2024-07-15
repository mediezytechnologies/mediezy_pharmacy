// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:mediezy_medical/mvc/controller/controller/new_order_controller/new_order_controller.dart';
// import 'package:mediezy_medical/mvc/controller/service/new_order_submit/new_order_submit_service.dart';
// import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';

// class NewOrderSubmitController extends GetxController {
//   final MedicineController medicineController = Get.put(MedicineController());
//   RxBool loading = true.obs;

//   String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

//   var newOrderSubmitModel = NewOrderSubmitModel().obs;

//   Future<NewOrderSubmitModel?> addNewOrderSubmit(
//       {required String patientId,
//       required String tokenId,
//       required String doctorId,
//       required String orderStatus,
//       List<String>? prescriptionImage,
//       required List<int> medicineList,
//       required BuildContext context}) async {
//     try {
//      loading.value = true;
//       log("Prescription Image: $prescriptionImage");

//       var data = await NewOrderSubmitService.newOrderSubmitService(
//           patientId: patientId,
//           tokenId: tokenId,
//           doctorId: doctorId,
//           orderStatus: orderStatus,
//           medicineList: medicineList,
//           prescriptionImage: prescriptionImage);
//       newOrderSubmitModel.value = data!;

//       if (newOrderSubmitModel.value.status == true) {
//         Get.snackbar(newOrderSubmitModel.value.message.toString(), "",
//             snackPosition: SnackPosition.BOTTOM);
//         Navigator.pop(context);
//         // Navigator.pushAndRemoveUntil(
//         //   context,
//         //   MaterialPageRoute(builder: (context) => NewOrderScreen()),
//         //   (route) => false,
//         // );
//         medicineController.getMedicine(formattedDate);
//       }

//       loading.value = false;

//       update();
//       return newOrderSubmitModel.value;
//     } catch (e) {
//       log("sdfkskldafjkolpdsa : $e");
//       loading.value = false;
//     }
//     return null;
//   }
// }


import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:developer';

import '../../../model/new_order_submit/new_order_submit_model.dart';
import '../../service/new_order_submit/new_order_submit_service.dart';
import '../new_order_controller/new_order_controller.dart';

class NewOrderSubmitController extends GetxController {
  final MedicineController medicineController = Get.put(MedicineController());
  RxBool loading = true.obs;

  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  var newOrderSubmitModel = NewOrderSubmitModel().obs;

  Future<NewOrderSubmitModel?> addNewOrderSubmit(
      {required String patientId,
      required String tokenId,
      required String doctorId,
      required String orderStatus,
      required String submitDate,
      List<String>? prescriptionImage,
      List<int>? medicineList,
      required BuildContext context}) async {
    try {
      loading.value = true;
      log("Prescription Image: $prescriptionImage");

      var data = await NewOrderSubmitService.newOrderSubmitService(
        patientId: patientId,
        tokenId: tokenId,
        doctorId: doctorId,
        orderStatus: orderStatus,
        medicineList: medicineList,
        prescriptionImage: prescriptionImage,
      );
newOrderSubmitModel.value=data!;
      if (newOrderSubmitModel.value.status == true) {
        log("=============== stat ${newOrderSubmitModel.value.status} ");
        Get.snackbar(newOrderSubmitModel.value.message.toString(), "",
            snackPosition: SnackPosition.BOTTOM);
      //  Navigator.pop(context);
        Navigator.of(context).pop();
        medicineController.getMedicine(submitDate);
      }
    } catch (e) {
      log("Error in addNewOrderSubmit: $e");
      Get.snackbar(
        "Error",
        "An unexpected error occurred",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      loading.value = false;
      update();
    }
    return null;
  }
}