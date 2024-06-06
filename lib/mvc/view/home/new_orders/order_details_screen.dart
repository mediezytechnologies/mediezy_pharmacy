import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_medical/mvc/controller/controller/new_order_controller/new_order_controller.dart';
import 'package:mediezy_medical/mvc/model/new_order_model.dart';
import 'package:mediezy_medical/ddd/core/app_colors.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/common_button_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/horizontal_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';

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
  });
  final String? name;
  final String? date;
  final int? itemCount;
  final String drName;
  final String? patientImage;
  List<Medicines>? medicines;
  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  List<String> items = List.generate(10, (index) => 'Item $index');
  List<bool> checked = List.generate(10, (index) => false);
  bool selectAll = false;
  final MedicineController controller = Get.put(MedicineController());

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order num 2133"),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
        child: CommonButtonWidget(title: "Apply", onTapFunction: () {}),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  child: Row(
                    children: [
                      widget.patientImage == null
                          ? Image.asset(
                              "assets/images/no image.jpg",
                              height: 50.h,
                              width: 60.w,
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              widget.patientImage!,
                              height: 50.h,
                              width: 60.w,
                              fit: BoxFit.fill,
                            ),
                      const HorizontalSpacingWidget(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.name!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.sp),
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy')
                                .format(DateTime.parse(widget.date!)),
                          ),
                          Row(
                            children: [
                              const Text(
                                "Prescribed by : ",
                              ),
                              Text(
                                widget.drName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Select All'),
                        // Checkbox(
                        //   activeColor: kMainColor,
                        //   value: selectAll,
                        //   onChanged: (newValue) {
                        //     setState(() {
                        //       selectAll = newValue!;
                        //       for (int i = 0; i < checked.length; i++) {
                        //         checked[i] = newValue;
                        //       }
                        //     });
                        //   },
                        // ),
                      ],
                    ),
                    const VerticalSpacingWidget(height: 6),
                    SizedBox(
                      height: mHeight * .55,
                      child: ListView.builder(
                        itemCount: widget.itemCount,
                        itemBuilder: (context, index) {
                          // return GetMedicinesWidget(
                          //   type: widget.medicines![index].type,
                          //   noon: widget.medicines![index].noon,
                          //   night: widget.medicines![index].night,
                          //   morning: widget.medicines![index].morning,
                          //   interval:
                          //       widget.medicines![index].interval.toString(),
                          //   evening: widget.medicines![index].evening,
                          //   dosage: widget.medicines![index].dosage.toString(),
                          //   medicineName: widget.medicines![index].medicineName
                          //       .toString(),
                          //   noOfDays:
                          //       widget.medicines![index].noOfDays.toString(),
                          //   timeSection:
                          //       widget.medicines![index].timeSection.toString(),
                          //   index: index,
                          // );
                          return CheckboxListTile(
                            activeColor: kMainColor,
                            title: Text(widget.medicines![index].medicineName
                                .toString()),
                            value: checked[index],
                            onChanged: (newValue) {
                              setState(() {
                                checked[index] = newValue!;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/rx logo.png",
                            height: 25.h,
                            width: 25.w,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            "Prescription uploaded",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.sp),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.remove_red_eye,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
