import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/controller/new_order_submit/new_order_submit_controller.dart';
import 'package:mediezy_medical/mvc/controller/controller/checkbox_controller/checkbox_controller.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';
import 'package:mediezy_medical/mvc/view/screens/home/widgets/builder_card_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/common_button_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/home/widgets/prescription_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/home/widgets/medicine_widget.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';

// ignore: must_be_immutable
class OrderDetailsScreen extends StatefulWidget {
  OrderDetailsScreen({
    super.key,
    this.name,
    this.date,
    this.itemCount,
    required this.medicines,
    required this.drName,
    required this.patientImage,
    this.tokenId,
    this.drId,
    this.patientId,
    this.type,
    required this.checkBoxVisibleId,
    required this.prescriptionImages,
  });

  final String? name;
  final String? date;
  final int? itemCount;
  final int? type;
  final String? patientId;
  final String drName;
  final String? tokenId;
  final String? drId;
  final String? patientImage;
  final List<String> prescriptionImages;
  List<Medicines>? medicines;
  final int checkBoxVisibleId;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final CheckboxController checkboxController = Get.put(CheckboxController());
  final NewOrderSubmitController newOrderSubmitController =
      Get.put(NewOrderSubmitController());

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        checkboxController.allChecked.value = false;
        checkboxController.checkedMedicines.clear();
        checkboxController.checkedPrescriptions.clear();
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.checkBoxVisibleId == 1
              ? "Completed details"
              : "Order details"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                checkboxController.allChecked.value = false;
                checkboxController.checkedMedicines.clear();
                checkboxController.checkedPrescriptions.clear();
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_outlined)),
        ),
        bottomNavigationBar: widget.type == 1
            ? null
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
                child: CommonButtonWidget(
                    title: "Submit",
                    onTapFunction: () {
                      newOrderSubmitController.addNewOrderSubmit(
                          context: context,
                          patientId: widget.patientId!,
                          tokenId: widget.tokenId!,
                          doctorId: widget.drId!,
                          orderStatus: "1",
                          medicineList: checkboxController.checkedMedicineIds,
                          prescriptionImage:
                              checkboxController.checkedPrescriptionImages,
                          submitDate: widget.date!);
                    })),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BuilderCardWidget(
                    patientImage: widget.patientImage,
                    name: widget.name!,
                    date: widget.date!,
                    drName: widget.drName),
                widget.medicines!.isEmpty
                    ? Container()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.type == 1
                              ? Container()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text('Select all'),
                                    Obx(() {
                                      return Checkbox(
                                        activeColor: kMainColor,
                                        value:
                                            checkboxController.allChecked.value,
                                        onChanged: (newValue) {
                                          final medicineIds = widget.medicines!
                                              .map((medicine) => medicine.id!)
                                              .toList();
                                          final prescriptionImages =
                                              widget.prescriptionImages;
                                          checkboxController.toggleAllItems(
                                              medicineIds, prescriptionImages);
                                        },
                                      );
                                    }),
                                  ],
                                ),
                          const VerticalSpacingWidget(height: 6),
                          GetMedicinesWidget(
                              prescriptionImage: widget.prescriptionImages,
                              checkBoxId: widget.checkBoxVisibleId,
                              medicines: widget.medicines!)
                        ],
                      ),
                VerticalSpacingWidget(height: 10),
                widget.prescriptionImages.isEmpty
                    ? Container()
                    : PrescriptionWidget(
                        medicines: widget.medicines!,
                        checkBoxId: widget.checkBoxVisibleId,
                        prescriptionImages: widget.prescriptionImages,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
