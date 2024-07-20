import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/controller/new_order_submit/new_order_submit_controller.dart';
import 'package:mediezy_medical/mvc/controller/controller/checkbox_controller/checkbox_controller.dart';
import 'package:mediezy_medical/mvc/controller/controller/update_order_submit/update_order_submit_controller.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';
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
    required this.appointmentId,
    this.notes,
  });

  final String? name;
  final String? date;
  final int? itemCount;
  final int? type;
  final int appointmentId;
  final String? patientId;
  final String drName;
  final String? tokenId;
  final String? drId;
  final String? patientImage;
  final String? notes;
  List<PrescriptionImages>? prescriptionImages;
  List<Medicines>? medicines;
  final int checkBoxVisibleId;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final CheckboxController checkboxController = Get.put(CheckboxController());
  final UpdateOrderSubmitController updateOrderSubmitController =
      Get.put(UpdateOrderSubmitController());
  final NewOrderSubmitController newOrderSubmitController =
      Get.put(NewOrderSubmitController());

  final TextEditingController remarksController = TextEditingController();

  @override
  void initState() {
    remarksController.text = widget.notes ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (widget.checkBoxVisibleId == 1) {
          // checkboxController.allChecked.value = true;
          checkboxController.isEditing.value = true;
        } else {
          checkboxController.allChecked.value = false;
          checkboxController.checkedMedicines.clear();
          checkboxController.checkedPrescriptions.clear();
        }
        checkboxController.isEditing.value = false;
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
                if (widget.checkBoxVisibleId == 1) {
                  // checkboxController.allChecked.value = true;
                  checkboxController.isEditing.value = true;
                } else {
                  checkboxController.allChecked.value = false;
                  checkboxController.checkedMedicines.clear();
                  checkboxController.checkedPrescriptions.clear();
                }
                checkboxController.isEditing.value = false;
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_outlined)),
          actions: [
            widget.type != 1
                ? Container()
                : Obx(() {
                    return IconButton(
                        onPressed: () {
                          checkboxController.changeEditIcon();
                        },
                        icon: Icon(
                          checkboxController.isEditing.value
                              ? Icons.check
                              : Icons.mode_edit_outlined,
                          color: Colors.black,
                        ));
                  })
          ],
        ),
        bottomNavigationBar: widget.type == 1
            ? Obx(() {
                return SizedBox(
                    child: checkboxController.isEditing.value
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 8.w),
                            child: CommonButtonWidget(
                                title: "Update",
                                onTapFunction: () {
                                  updateOrderSubmitController
                                      .updateNewOrderSubmit(
                                          appointmentId:
                                              widget.appointmentId.toString(),
                                          notes: remarksController.text,
                                          context: context,
                                          imageIdList: checkboxController
                                              .checkedPrescriptionImages,
                                          medicineList: checkboxController
                                              .checkedMedicineIds);
                                }),
                          )
                        : SizedBox());
              })
            : checkboxController.isEditing.value
                ? Container()
                : Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
                    child: CommonButtonWidget(
                        title: "Submit",
                        onTapFunction: () {
                          newOrderSubmitController.addNewOrderSubmit(
                              context: context,
                              patientId: widget.patientId!,
                              tokenId: widget.tokenId!,
                              doctorId: widget.drId!,
                              orderStatus: "1",
                              medicineList:
                                  checkboxController.checkedMedicineIds,
                              prescriptionImage:
                                  checkboxController.checkedPrescriptionImages,
                              submitDate: widget.date!,
                              notes: remarksController.text,
                              appointmentId: widget.appointmentId);
                        }),
                  ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuilderCardWidget(
                    patientImage: widget.patientImage,
                    name: widget.name!,
                    date: widget.date!,
                    drName: widget.drName),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.type == 1
                        ? Obx(() {
                            return SizedBox(
                              child: checkboxController.isEditing.value
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text('Select all'),
                                        Obx(() {
                                          return Checkbox(
                                            activeColor: kMainColor,
                                            value: checkboxController
                                                .allChecked.value,
                                            onChanged: (newValue) {
                                              final medicineIds = widget
                                                  .medicines!
                                                  .map((medicine) =>
                                                      medicine.id!)
                                                  .toList();
                                              final prescriptionImageIds =
                                                  widget.prescriptionImages!
                                                      .map((image) => image.id!)
                                                      .toList();
                                              checkboxController.toggleAllItems(
                                                  medicineIds,
                                                  prescriptionImageIds);
                                            },
                                          );
                                        }),
                                      ],
                                    )
                                  : SizedBox(),
                            );
                          })
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text('Select all'),
                              Obx(() {
                                return Checkbox(
                                  activeColor: kMainColor,
                                  value: checkboxController.allChecked.value,
                                  onChanged: (newValue) {
                                    final medicineIds = widget.medicines!
                                        .map((medicine) => medicine.id!)
                                        .toList();
                                    final prescriptionImageIds = widget
                                        .prescriptionImages!
                                        .map((image) => image.id!)
                                        .toList();
                                    checkboxController.toggleAllItems(
                                        medicineIds, prescriptionImageIds);
                                  },
                                );
                              }),
                            ],
                          ),
                    const VerticalSpacingWidget(height: 6),
                    GetMedicinesWidget(
                        prescriptionImages: widget.prescriptionImages,
                        checkBoxId: widget.checkBoxVisibleId,
                        medicines: widget.medicines!)
                  ],
                ),
                VerticalSpacingWidget(height: 10),
                widget.prescriptionImages!.isEmpty
                    ? Container()
                    : PrescriptionWidget(
                        medicines: widget.medicines!,
                        checkBoxId: widget.checkBoxVisibleId,
                        prescriptionImages: widget.prescriptionImages,
                      ),
                widget.type != 1
                    ? Text("Remarks : ", style: greyMain)
                    : Obx(() {
                        if (!checkboxController.isEditing.value &&
                            widget.notes == null) {
                          return SizedBox();
                        }
                        return Text("Remarks : ", style: greyMain);
                      }),
                const VerticalSpacingWidget(height: 5),
                widget.type != 1
                    ? TextFormField(
                        style: TextStyle(
                            fontSize: size.width > 450 ? 9.sp : 14.sp),
                        cursorColor: kMainColor,
                        controller: remarksController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintStyle:
                              size.width > 450 ? greyTab10B600 : grey13B600,
                          hintText: "Add your notes",
                          filled: true,
                          fillColor: kCardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      )
                    : Obx(() {
                        if (widget.notes == null &&
                            !checkboxController.isEditing.value) {
                          return SizedBox();
                        }
                        return TextFormField(
                          style: TextStyle(
                              fontSize: size.width > 450 ? 9.sp : 14.sp),
                          cursorColor: kMainColor,
                          controller: remarksController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          readOnly: !checkboxController.isEditing.value,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintStyle:
                                size.width > 450 ? greyTab10B600 : grey13B600,
                            hintText: "Add your notes",
                            filled: true,
                            fillColor: kCardColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        );
                      })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
