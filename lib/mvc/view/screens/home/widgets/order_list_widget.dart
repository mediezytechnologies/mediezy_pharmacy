// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:mediezy_medical/mvc/controller/controller/checkbox_controller/checkbox_controller.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';
import 'package:mediezy_medical/mvc/view/screens/home/widgets/builder_card_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/home/new_orders/order_details_screen.dart';

class OrderListWidget extends StatefulWidget {
  const OrderListWidget({
    super.key,
    required this.medicineOrder,
    this.type,
    required this.checkBoxVisibleId,
  });

  final List<MedicineOrder> medicineOrder;
  final int? type;
  final int checkBoxVisibleId;

  @override
  _OrderListWidgetState createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  int? openTileIndex;
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final CheckboxController checkboxController = Get.put(CheckboxController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // GestureDetector(
        //   onTap: () {
        //     checkboxController.sortingDoctor();
        //   },
        //   child: Padding(
        //     padding: EdgeInsets.only(right: 10.w, top: 5.h),
        //     child: SvgPicture.asset(
        //       "assets/svg/sort1.svg",
        //       color: Colors.black,
        //       fit: BoxFit.contain,
        //       width: size.width * .02,
        //       height: size.width * .07,
        //     ),
        //   ),
        // ),
        // Obx(() {
        // return
        Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                //  checkboxController.showListView.value
                //     ?
                ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: widget.medicineOrder.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => OrderDetailsScreen(
                          name: widget.medicineOrder[index].patientName
                              .toString(),
                          date: widget.medicineOrder[index].date.toString(),
                          itemCount:
                              widget.medicineOrder[index].medicines!.length,
                          medicines: widget.medicineOrder[index].medicines,
                          drName:
                              widget.medicineOrder[index].doctorName.toString(),
                          patientImage: widget.medicineOrder[index].userImage,
                          drId: widget.medicineOrder[index].doctorId.toString(),
                          patientId:
                              widget.medicineOrder[index].patientId.toString(),
                          tokenId:
                              widget.medicineOrder[index].tokenId.toString(),
                          type: widget.type,
                          checkBoxVisibleId: widget.checkBoxVisibleId,
                          prescriptionImages:
                              widget.medicineOrder[index].prescriptionImages!,
                          notes: widget.medicineOrder[index].notes,
                          appointmentId:
                              widget.medicineOrder[index].appointmentId!,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    child: BuilderCardWidget(
                      patientImage: widget.medicineOrder[index].userImage,
                      name: widget.medicineOrder[index].patientName.toString(),
                      date: widget.medicineOrder[index].date.toString(),
                      drName: widget.medicineOrder[index].doctorName.toString(),
                    ),
                  ),
                );
              },
            )
            // : ListView.builder(
            //     padding: EdgeInsets.zero,
            //     shrinkWrap: true,
            //     itemCount: widget.medicineOrder.length,
            //     itemBuilder: (context, index) {
            //       final model = widget.medicineOrder[index];
            //       return Container(
            //         decoration: BoxDecoration(
            //             boxShadow: [
            //               BoxShadow(
            //                 color: const Color.fromARGB(0, 220, 222, 222)
            //                     .withOpacity(1),
            //                 offset: const Offset(0, 2),
            //                 blurRadius: 4,
            //                 spreadRadius: 5,
            //               )
            //             ],
            //             color: kCardColor,
            //             borderRadius: BorderRadius.circular(12)),
            //         child: ExpansionTile(
            //           initiallyExpanded: openTileIndex == index,
            //           onExpansionChanged: (expanded) {},
            //           backgroundColor: kCardColor,
            //           title: Text(
            //             model.doctorName.toString(),
            //           ),
            //           children: [
            //             SizedBox(
            //               height: 10.h,
            //             ),
            //             ConstrainedBox(
            //               constraints: BoxConstraints(
            //                 maxHeight: 120,
            //               ),
            //               child: ListView.builder(
            //                 physics: const NeverScrollableScrollPhysics(),
            //                 shrinkWrap: true,
            //                 itemCount: widget.medicineOrder.length,
            //                 itemBuilder: (context, index) {
            //                   return InkWell(
            //                     onTap: () {
            //                       Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                           builder: (ctx) => OrderDetailsScreen(
            //                             name: widget.medicineOrder[index]
            //                                 .patientName
            //                                 .toString(),
            //                             date: widget
            //                                 .medicineOrder[index].date
            //                                 .toString(),
            //                             itemCount: widget
            //                                 .medicineOrder[index]
            //                                 .medicines!
            //                                 .length,
            //                             medicines: widget
            //                                 .medicineOrder[index].medicines,
            //                             drName: widget
            //                                 .medicineOrder[index].doctorName
            //                                 .toString(),
            //                             patientImage: widget
            //                                 .medicineOrder[index].userImage,
            //                             drId: widget
            //                                 .medicineOrder[index].doctorId
            //                                 .toString(),
            //                             patientId: widget
            //                                 .medicineOrder[index].patientId
            //                                 .toString(),
            //                             tokenId: widget
            //                                 .medicineOrder[index].tokenId
            //                                 .toString(),
            //                             type: widget.type,
            //                             checkBoxVisibleId:
            //                                 widget.checkBoxVisibleId,
            //                             prescriptionImages: widget
            //                                 .medicineOrder[index]
            //                                 .prescriptionImages!,
            //                             notes: widget
            //                                 .medicineOrder[index].notes,
            //                             appointmentId: widget
            //                                 .medicineOrder[index]
            //                                 .appointmentId!,
            //                           ),
            //                         ),
            //                       );
            //                     },
            //                     child: Padding(
            //                       padding:
            //                           EdgeInsets.symmetric(vertical: 3.h),
            //                       child: BuilderCardWidget(
            //                         patientImage: widget
            //                             .medicineOrder[index].userImage,
            //                         name: widget
            //                             .medicineOrder[index].patientName
            //                             .toString(),
            //                         date: widget.medicineOrder[index].date
            //                             .toString(),
            //                         drName: widget
            //                             .medicineOrder[index].doctorName
            //                             .toString(),
            //                       ),
            //                     ),
            //                   );
            //                 },
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            ),
        // }),
      ],
    );
  }
}
