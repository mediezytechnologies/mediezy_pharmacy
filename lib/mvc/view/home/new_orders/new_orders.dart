import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/controller/completed/completed_controller.dart';
import 'package:mediezy_medical/mvc/controller/controller/new_order_controller/new_order_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/builder_card_widget.dart';
import 'package:mediezy_medical/ddd/core/app_colors.dart';
import 'package:mediezy_medical/mvc/view/home/new_orders/order_details_screen.dart';

// ignore: must_be_immutable
class NewOrderScreen extends StatefulWidget {
  NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  final MedicineController medicineController = Get.put(MedicineController());

  final CompletedController completedController =
      Get.put(CompletedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recent Orders"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 55.h,
            color: kScaffoldColor,
            child: TabBar(
              controller: tabController,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.only(
                  top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
              unselectedLabelColor: kTextColor,
              unselectedLabelStyle: TextStyle(
                fontSize: 12.sp,
              ),
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kMainColor),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "New orders",
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Completed"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Obx(() {
                  if (medicineController.loding.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (medicineController.medicineOrder!.isEmpty) {
                    return Center(
                      child: Image(
                        height: 200.h,
                        width: 200.w,
                        image: const AssetImage("assets/images/no_data.jpg"),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: medicineController.medicineOrder!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => OrderDetailsScreen(
                                name: medicineController
                                    .medicineOrder![index].patientName
                                    .toString(),
                                date: medicineController
                                    .medicineOrder![index].date
                                    .toString(),
                                itemCount: medicineController
                                    .medicineOrder![index].medicines!.length,
                                medicines: medicineController
                                    .medicineOrder![index].medicines,
                                drName: medicineController
                                    .medicineOrder![index].doctorName
                                    .toString(),
                                patientImage: medicineController
                                    .medicineOrder![index].userImage,
                                drId: medicineController
                                    .medicineOrder![index].doctorId
                                    .toString(),
                                patientId: medicineController
                                    .medicineOrder![index].patientId
                                    .toString(),
                                tokenId: medicineController
                                    .medicineOrder![index].tokenId
                                    .toString(),
                                type: 0,
                                checkBoxVisibleId:
                                    tabController.index == 0 ? 0 : 1,
                              ),
                            ),
                          );
                        },
                        child: BuilderCardWidget(
                          patientImage: medicineController
                              .medicineOrder![index].userImage,
                          name: medicineController
                              .medicineOrder![index].patientName
                              .toString(),
                          date: medicineController.medicineOrder![index].date
                              .toString(),
                          drName: medicineController
                              .medicineOrder![index].doctorName
                              .toString(),
                        ),
                      );
                    },
                  );
                }),
                Obx(() {
                  if (completedController.loading.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (completedController.medicineOrder!.isEmpty) {
                    return Center(
                      child: Image(
                        height: 200.h,
                        width: 200.w,
                        image: const AssetImage("assets/images/no_data.jpg"),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: completedController.medicineOrder!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => OrderDetailsScreen(
                                name: completedController
                                    .medicineOrder![index].patientName
                                    .toString(),
                                date: completedController
                                    .medicineOrder![index].date
                                    .toString(),
                                itemCount: completedController
                                    .medicineOrder![index].medicines!.length,
                                medicines: completedController
                                    .medicineOrder![index].medicines,
                                drName: completedController
                                    .medicineOrder![index].doctorName
                                    .toString(),
                                patientImage: completedController
                                    .medicineOrder![index].userImage,
                                drId: completedController
                                    .medicineOrder![index].doctorId
                                    .toString(),
                                patientId: completedController
                                    .medicineOrder![index].patientId
                                    .toString(),
                                tokenId: completedController
                                    .medicineOrder![index].tokenId
                                    .toString(),
                                type: 1,
                                checkBoxVisibleId:
                                    tabController.index == 0 ? 1 : 0,
                              ),
                            ),
                          );
                        },
                        child: BuilderCardWidget(
                          patientImage: completedController
                              .medicineOrder![index].userImage,
                          name: completedController
                              .medicineOrder![index].patientName
                              .toString(),
                          date: completedController.medicineOrder![index].date
                              .toString(),
                          drName: completedController
                              .medicineOrder![index].doctorName
                              .toString(),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
