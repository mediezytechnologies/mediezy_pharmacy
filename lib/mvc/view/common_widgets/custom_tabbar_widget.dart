// ignore: must_be_immutable
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';

import '../../controller/controller/new_order_controller/new_order_controller.dart';

class CustomTabbarWidget extends StatelessWidget {
  const CustomTabbarWidget(
      {Key? key,
      required this.height,
      required this.marginHorizontal,
      this.onTap,
      required this.controller,
      required this.unselectedLebelSize,
      required this.selectedLebelSize,
      required this.tabText1,
      required this.tabText2,
      this.tabText3,
      this.typeId = 2})
      : super(key: key);

  final double height;
  final double marginHorizontal;
  final void Function(int)? onTap;
  final TabController controller;
  final double unselectedLebelSize;
  final double selectedLebelSize;
  final String tabText1;
  final String tabText2;
  final String? tabText3;
  final int typeId;

  @override
  Widget build(BuildContext context) {
    final UpcomingDateController upcomingDateController =
      Get.put(UpcomingDateController());
    // List tabList = [
    //   Tab(
    //     child: Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(30.r),
    //       ),
    //       child: Align(
    //         alignment: Alignment.center,
    //         child: Text(
    //           tabText1,
    //         ),
    //       ),
    //     ),
    //   ),
    //   Tab(
    //     child: Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(30.r),
    //       ),
    //       child: Align(
    //         alignment: Alignment.center,
    //         child: Text(tabText2),
    //       ),
    //     ),
    //   ),
    // ];

    return Obx(
     () {
        return Container(
          height: height,
          margin: EdgeInsets.symmetric(horizontal: marginHorizontal.w),
          decoration: const BoxDecoration(
              color: Color.fromARGB(131, 187, 222, 251),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: TabBar(
            onTap: onTap,
            controller: controller,
            physics: const ClampingScrollPhysics(),
            dividerColor: Colors.transparent,
            unselectedLabelColor: kTextColor,
            unselectedLabelStyle: TextStyle(
              fontSize: unselectedLebelSize,
            ),
            labelStyle: TextStyle(
              fontSize: selectedLebelSize,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: kMainColor,
            ),
            tabs:
              List.generate(
                       2,
                          (index) {
                           
                       log("fjsdfjdksa  =======  ${upcomingDateController.date!.length}"    );
                            return Obx(() {
                             
                              if (upcomingDateController.loading.value) {
                                CircularProgressIndicator();
                              }
                              return Tab(
                                  text: upcomingDateController.date![index].formatDate);
                            });
                          },
                        ),
            
            
            // List.generate(typeId, (index) => tabList[index]),
          ),
        );
      }
    );
  }
}
